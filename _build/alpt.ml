let () = if Array.length Sys.argv != 2 then failwith "Wrong number of arguments" else ();;


let read_from_file f =
    let ic = open_in f in
        try
            let line = really_input_string ic (in_channel_length ic) in
            (* read line, discard \n *)
            close_in ic;
            line
            (* close the input channel *)
        with e ->
            (* some unexpected exception occurs *)
            close_in_noerr ic;
            (* emergency closing *)
            raise e;;


let text = read_from_file Sys.argv.(1);;

print_string text;;

let re = Re2.create_exn "§\\s*<([a-zA-Z._ -]+)\\s*:\\s*([a-zA-z]*)>\\s*§\\s*([^§]*)\\s*§";;
let matches = Re2.find_all_exn re text;;
let files = (Re2.find_all_exn ~sub:(` Index 1) re text, Re2.find_all_exn ~sub:(` Index 3) re text, Re2.find_all_exn ~sub:(` Index 2) re text);;

let rec print_matches ls = match ls with
    | x :: x1 -> print_string("[ "^x^" ]\n") ; print_matches x1
    | [] -> print_string "\n";;

let rec print_all a = match a with
    | (x :: x1, y :: y1, z :: z1) -> print_string("[ "^x^" ]\t[ "^y^" ]\t[ "^z^" ]\n") ; print_all (x1, y1, z1)
    | _ -> ();;

let subs s = Re2.rewrite_exn re ~template:"\\\\begin{lstlisting}[language = \\2]\n\\3\\\\end{lstlisting}" s;;

print_all(files);;

let write_to_file_a f c =            (* Write message to file *)
                                    let oc = open_out_gen [Open_append; Open_creat] 0o666 f in
                                    (* create or truncate file, return channel *)
                                    Printf.fprintf oc "%s" c;
                                    (* write something *)
                                    close_out oc;;

let write_to_file_w f c =           (* Write message to file *)
                                    let oc = open_out f in
                                    (* create or truncate file, return channel *)
                                    Printf.fprintf oc "%s" c;
                                    (* write something *)
                                    close_out oc;;


let rec clear_all_files f = match f with
    | (x::x1,y::y1,z::z1) -> write_to_file_w x "";
                clear_all_files (x1, y1, z1)
    | _ -> ()
in let rec write_all_to_file f = match f with
    | (x::x1,y::y1,z::z1) -> write_to_file_a x y;
                write_all_to_file (x1, y1, z1)
    | _ -> ()

in clear_all_files files;
   write_to_file_w "docs.tex" (subs text);
   write_all_to_file files;;

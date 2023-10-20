
let rec take n lst =
  if n = 0 then Some [] else
    match lst with
    | [] -> None
    | h :: t ->
        let left = take (n - 1) t in
          match left with
          | None -> None
          | Some x -> Some (h :: x)

let rec drop n lst =
  if n = 0 then Some lst else
    match lst with
    | [] -> None
    | _ :: t ->
        let left = drop (n - 1) t in
          match left with
          | None -> None
          | Some x -> Some x

let rec len = function
  | [] -> 0
  | _ :: t -> 1 + len t

let rec map f = function
  | [] -> []
  | h :: t -> f h :: map f t

let rec apply f n arg =
  if n = 1 then f arg else apply f (n - 1) (f arg)

let rec filter f = function
  | [] -> []
  | h :: t -> if f h then h :: (filter f t) else filter f t

let rec for_all f = function
  | [] -> true
  | h :: t -> if f h then for_all f t else false


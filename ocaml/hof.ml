
(* Preserves the order of evaluation *)
let rec map f = function
  | [] -> []
  | h :: t -> let h' = f h in h' :: map f t

(* Tail recursive version, has reversed order of evaluation (should be careful
   not to make it O(n^2)) *)
let rec rev_map_aux f acc = function
  | [] -> acc
  | h :: t -> rev_map_aux f (f h :: acc) t

let rev_map f = rev_map_aux f []

(* Preserves the order *)
let rec filter p = function
  | [] -> []
  | h :: t -> if p h then h :: filter p t else filter p t

(* Tail recursive version, also has reversed order of evaluation *)
let rec rev_filter_aux p acc = function
  | [] -> acc
  | h :: t -> filter_aux p (if p h then h :: acc else acc) t

let rev_filter p = filter_aux p []

let rec combine f acc = function
  | [] -> acc
  | h :: t -> f h (combine acc f t)

(* Tail recursion, which implies order inversion (actually it's just fold_left *)
let rec rev_combine f acc = function
  | [] -> acc
  | h :: t ->
      let acc' = f acc h in rev_combine f acc' t

(* Arguments order is like in standard library *)
let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | h :: t -> f h (fold_right f t acc)

let rec fold_left f acc lst =
  match lst with
  | [] -> acc
  | h :: t -> fold_left f (f acc h) t


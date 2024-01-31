
let is_valid_matrix = function
  | [] -> false
  | row :: rows ->
      match row with
      | [] -> false
      | _ -> List.for_all (fun x -> List.length x = List.length row) rows

let add_row_vectors = List.map2 ( + )

let add_matrices = List.map2 add_row_vectors

let transpose lst =
  let rec transpose' acc = function
    | [] | [] :: _ -> List.rev acc
    | lst -> transpose' (List.map List.hd lst :: acc) (List.map List.tl lst)
  in transpose' [] lst
  
let row_vectors_dot_product = List.fold_left2 (fun acc x y -> acc + x * y) 0

let mul_matrices m1 m2 =
  m1
  |> List.map (fun row -> List.map (row_vectors_dot_product row) (transpose m2))


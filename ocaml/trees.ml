
type 'a tree = 
  | Br of 'a * 'a tree * 'a tree
  | Lf

let rec size = function
  | Br (_, l, r) -> 1 + size l + size r
  | Lf -> 0

let rec total = function
  | Br (x, l, r) -> x + total l + total r
  | Lf -> 0

let max x y = if x > y then x else y

let rec depth = function
  | Br (_, l, r) -> 1 + max (depth l) (depth r)
  | Lf -> 0

let rec list_of_tree = function
  | Br (x, l, r) -> list_of_tree l @ [x] @ list_of_tree r
  | Lf -> []

let rec lookup tr k =
  match tr with
  | Lf -> None
  | Br ((k', v), l, r) ->
      if k = k' then Some v
      else if k < k' then lookup l k
      else lookup r k

let rec insert tr k v =
  match tr with
  | Lf -> Br ((k, v), Lf, Lf)
  | Br ((k', v'), l, r) ->
      if k = k' then Br ((k, v), l, r)
      else if k < k' then Br ((k', v'), insert l k v, r)
      else Br ((k', v'), l, insert r k v)

let rec is_found tr k =
  match tr with
  | Lf -> false
  | Br ((k', _), l, r) ->
      if k = k' then true
      else if k < k' then is_found l k
      else is_found r k

let rec mirror = function
  | Br (x, l, r) -> Br (x, mirror r, mirror l)
  | Lf -> Lf

let rec is_same_shape tr tr' =
  match tr, tr' with
  | Lf, Lf -> true
  | Br (_, l, r), Br (_, l', r') -> is_same_shape l l' && is_same_shape r r'
  | _ -> false

let rec combine tr tr' =
  match tr' with
  | Lf -> tr
  | Br ((k, v), l, r) -> combine (insert (combine tr l) k v) r


open Lists

let get = function
  | None -> failwith "bad_option"
  | Some x -> x

let rec merge cmp x y =
  match x, y with
  | [], l -> l
  | l, [] -> l
  | hx :: tx, hy :: ty ->
      if cmp hx hy
      then hx :: merge cmp tx (hy :: ty)
      else hy :: merge cmp (hx :: tx) ty

let rec msort cmp = function
  | [] -> []
  | [x] -> [x]
  | lst ->
      let length = len lst in
        let left = take (length / 2) lst |> get in
          let right = drop (length / 2) lst |> get in
            merge cmp (msort cmp left) (msort cmp right)


let rec insert cmp x = function
  | [] -> [x]
  | h :: t -> 
      if cmp x h 
      then x :: h :: t
      else h :: insert cmp x t

let rec isort cmp = function
  | [] -> []
  | h :: t -> insert cmp h (isort cmp t)


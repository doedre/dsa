open OUnit2
open Lists
open Trees
open Insertion_sort
open Merge_sort

let rec is_sorted cmp = function
  | [] -> true
  | f :: s :: t ->
      if cmp f s 
      then is_sorted cmp (s :: t)
      else false
  | _ :: [] -> true

let is_sorted_test = "test suite for is_sorted function" >::: [
  "empty list" >:: (fun _ -> assert_equal true (is_sorted ( <= ) []));
  "one element list" >:: (fun _ -> assert_equal true (is_sorted ( <= ) [0]));
  "sorted list" >:: (fun _ -> assert_equal true (is_sorted ( <= ) [0; 1; 3; 10; 1230]));
  "unsorted list odd" >:: (fun _ -> assert_equal false (is_sorted ( <= ) [1; 5; 0]));
  "unsorted list even" >:: (fun _ -> assert_equal false (is_sorted ( <= ) [1; 5; 9; 0]));
]

let lists_test = "test suite for merge sort utilities" >::: [
  "take_test" >::
    (fun _ ->
      assert_equal None (take 1 []);
      assert_equal None (take 5 [1; 2; 3]);
      assert_equal (Some []) (take 0 []);
      assert_equal (Some [1]) (take 1 [1; 2; 3]);
      assert_equal (Some [1; 2; 3]) (take 3 [1; 2; 3]);
    );
  "drop_test" >::
    (fun _ ->
      assert_equal None (drop 1 []);
      assert_equal None (drop 5 [1; 2; 3]);
      assert_equal (Some []) (drop 0 []);
      assert_equal (Some [1]) (drop 1 [3; 1]);
      assert_equal (Some [1; 2; 3]) (drop 3 [2; 32; 41; 1; 2; 3]);
    );
  "len_test" >::
    (fun _ ->
      assert_equal 0 (len []);
      assert_equal 1 (len [0]);
      assert_equal 5 (len [1; 2; 3; 4; 5]);
    );
]

let trees_test = "test suite for trees" >::: [
  "size_test" >::
    (fun _ ->
      assert_equal 0 (size Lf);
      assert_equal 1 (size (Br (1, Lf, Lf)));
      assert_equal 2 (size (Br (1, Lf, Br (1, Lf, Lf))));
      assert_equal 3 (size (Br (1, Br (1, Lf, Lf), Br (1, Lf, Lf))));
    );
  "total_test" >::
    (fun _ ->
      assert_equal 0 (total Lf);
      assert_equal 1 (total (Br (1, Lf, Lf)));
      assert_equal 2 (total (Br (1, Lf, Br (1, Lf, Lf))));
      assert_equal 3 (total (Br (1, Br (1, Lf, Lf), Br (1, Lf, Lf))));
    );
  "depth_test" >::
    (fun _ ->
      assert_equal 0 (depth Lf);
      assert_equal 1 (depth (Br (1, Lf, Lf)));
      assert_equal 2 (depth (Br (1, Lf, Br (1, Lf, Lf))));
      assert_equal 2 (depth (Br (1, Br (1, Lf, Lf), Br (1, Lf, Lf))));
      assert_equal 4 (depth (Br (1, Br (1, Br (1, Br (1, Lf, Lf), Lf), Lf), Lf)));
    );
  "list_of_tree_test" >::
    (fun _ ->
      assert_equal [] (list_of_tree Lf);
      assert_equal [1] (list_of_tree (Br (1, Lf, Lf)));
      assert_equal [1; 2] (list_of_tree (Br (1, Lf, Br (2, Lf, Lf))));
      assert_equal [2; 1; 3] (list_of_tree (Br (1, Br (2, Lf, Lf), Br (3, Lf, Lf))));
      assert_equal [4; 3; 2; 1] (list_of_tree (Br (1, Br (2, Br (3, Br (4, Lf, Lf), Lf), Lf), Lf)));
    );
  "combine_test" >::
    (fun _ ->
      assert_equal (Br ((1, "one"), Lf, Br ((2, "two"), Lf, Lf))) (combine (Br ((1, "one"), Lf, Lf)) (Br ((2, "two"), Lf, Lf)));
    );
]

let sort_test name sort =
  name >::: [
    "empty_list" >:: (fun _ -> assert_equal [] (sort ( <= )[]));
    "one_element_list" >:: (fun _ -> assert_equal [0] (sort ( <= ) [0]));
    "sorted_list" >:: (fun _ -> assert_equal true (is_sorted ( <= ) (sort ( <= ) [0; 1; 3; 10; 32901])));
    "unsorted_list" >:: (fun _ -> assert_equal true (is_sorted ( <= ) (sort ( <= ) [0; 3; 1; 10; -32901])));
    "sorted_list_rev" >:: (fun _ -> assert_equal true (is_sorted ( >= ) (sort ( >= ) [10; 3; 2; 1; 0])));
    "unsorted_list_rev" >:: (fun _ -> assert_equal true (is_sorted ( >= ) (sort ( >= ) [0; 3; 1; 10; -32901])));
  ]

let insertion_sort_test = sort_test "test suite for insertion_sort.ml" isort
let merge_sort_test = sort_test "test suite for merge_sort.ml" msort

let _ = run_test_tt_main is_sorted_test
let _ = run_test_tt_main lists_test
let _ = run_test_tt_main trees_test
let _ = run_test_tt_main insertion_sort_test
let _ = run_test_tt_main merge_sort_test


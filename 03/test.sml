(* 1 *)
only_capitals (["Abc","abc"]);

(* 2 *)
longest_string1 ["I","am","not", "the", "longest","got it?"];

(* 3 *)
longest_string2 ["I","am","not", "the", "longest","got it?"];

(* 4 *)
longest_string3 ["I","am","not", "the", "longest","got it?"];
longest_string4 ["I","am","not", "the", "longest","got it?"];

(* 5 *)
longest_capitalized(["I","am","not", "the", "Longest","Got it?"]);

(* 6 *)
rev_string("abcde");

(* 7 *)
first_answer (fn x => if x>1 then SOME x else NONE) [0,0,1,2,4,5];

(* 8 *)
all_answers (fn x => if x>1 then SOME [x] else NONE) [0,0,1,2];

(* 9 *)
(* 9-a *)
count_wildcards Wildcard ;

(* 9-b *)
count_wild_and_variable_lengths (Variable("a"));

(* 9-c *)
count_some_var ("x", Variable("x"))1;

(* 10 *)
check_pat (Variable("x"));

(* 11 *)
match (Const(1), UnitP);

(* 12 *)
first_match Unit [UnitP] ;

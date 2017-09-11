


(* 1 *)
val only_capitals  =
    List.filter (fn xs => Char.isUpper (String.sub (xs,0)))

(* 2 *)
		
val longest_string1 =
    List.foldl (fn (x,y) => if String.size(x) > String.size(y)
			    then x
			    else
				y)
	       ""
val longest_string2 =
    List.foldl (fn (x,y) => if String.size(x) >= String.size(y)
			    then x
			    else y)
	       ""

(* 4 *)
fun longest_string_helper f =
  List.foldl (fn (x,y) => if f(String.size(x), String.size(y))
			  then x
			  else y)
	     ""

val longest_string3  =
    longest_string_helper (fn (x,y) => x>y)

val longest_string4 =
    longest_string_helper (fn (x,y) => x >= y)

(* 5 *)
			  
val longest_capitalized =
    longest_string1 o only_capitals

			  
(* 6 *)
val rev_string =
    implode o rev o explode

(* 7 *)
fun first_answer f xs =
  case xs of
      [] => NONE
    | head:: tail => case f head of
			 SOME x => SOME x
		       | NONE => first_answer f tail
					      
(* 8 *)

fun all_answers f lst =
  let fun aux (l, acc) =
        case l of
            [] => SOME acc
          | head::tail => case f head of
                              NONE => NONE
                            | SOME v => aux(tail, acc @ v)
  in
      aux(lst, [])
  end


      (* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
                 | Variable of string
                 | UnitP
                 | ConstP of int
                 | TupleP of pattern list
                 | ConstructorP of string * pattern

datatype valu = Const of int
              | Unit
              | Tuple of valu list
              | Constructor of string * valu

fun g f1 f2 p =
    let
        val r = g f1 f2
    in
        case p of
            Wildcard          => f1 ()
          | Variable x        => f2 x
          | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
          | ConstructorP(_,p) => r p
          | _                 => 0
    end

	
      (* 9 *)
      

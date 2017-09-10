(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
  s1 = s2

(* put your solutions for problem 1 here *)
(* 1-a *)
fun all_except_option(str,str_lst) =
  case str_lst of
      [] => NONE
    | head::tail => if same_string(str, head)
		    then SOME tail
		    else case all_except_option(str, tail) of
			     NONE => NONE
			   | SOME xs => SOME (head :: xs)

(* 1-b *)
fun get_substitutions1 (str_li_li, str) =
  case str_li_li of
      [] => []
    | head :: tail => case all_except_option(str,head) of
			  NONE => get_substitutions1 (tail, str)
			| SOME xs => xs @ get_substitutions1 (tail, str)

(* 1-c *)
fun get_substitutions2 (str_li_li, str) =
  let fun aux (tmp_li_li, acc)=
	case tmp_li_li of
	    [] => acc
	  | head :: tail  => case all_except_option (str, head) of
				 NONE => aux (tail, acc)
			       | SOME xs => aux (tail, xs @ acc)
  in
      aux(str_li_li, [])
  end


(* 1-d *)
fun similar_names (str_li_li, name) =
  let val {first =x,middle =y, last =z} = name
      fun generate_names sub_li =
	case sub_li of
	    [] => []
	  | head :: tail => {first = head,middle=y,last=z} :: generate_names(tail)
  in
      name :: generate_names (get_substitutions2 (str_li_li, x))
  end
      
      
      

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 2-a *)
fun card_color (a , b:rank) =
  case a of
      Clubs => Black
    | Spades => Black
    | Diamonds => Red
    | Hearts => Red

(* 2-b *)			    
fun card_value (a: suit, b) =
  case b of
      Ace => 11
    | Num x => x
    | Jack => 10
    | Queen => 10
    | King => 10

		  
(* 2-c *)
fun remove_card (cs, c, e) =
  case cs of
      [] => raise e
    | head :: tail => if head = c
		      then tail
		      else head :: remove_card (tail, c, e)


(* 2-d *)
fun all_same_color (cs) =
  case cs of
      [] => true
    | _ :: [] => true
    | head :: neck :: tail => card_color (head) = card_color (neck) andalso
			      all_same_color (tail)

					     
					     
(* 2-e *)
fun sum_cards (cs) =
  let fun aux (card_set, sum) =
	case cs of
	    [] => sum
	  | head :: tail => aux(tail, card_value(head) + sum)
  in
      aux (cs,0)
  end

(* 2-f *)
fun pre_score(sum,goal) =
  if sum > goal
  then 3 * (sum - goal)
  else goal - sum

		  
fun score (cs, goal) =
  let val tmp = pre_score(sum_cards(cs), goal)
  in
      
      if all_same_color(cs)
      then tmp div 2
      else tmp

end


      (* 2-g*)
			   
fun officiate (clst, mlst, goal) =
    let fun aux(card_lst, move_lst, held_cards) =
            case move_lst of
                [] => score(held_cards, goal)
              | (Discard card)::tail =>
                aux(card_lst, tail, remove_card(held_cards, card, IllegalMove))
              | Draw::tail => case card_lst of
                                  [] => score(held_cards, goal)
                                | first::rest =>
                                  if sum_cards(first::held_cards) > goal
                                  then score(first::held_cards, goal)
                                  else aux(rest, tail, first::held_cards)
    in
        aux(clst, mlst, [])
    end


	all_same_color: Your function returns an incorrect result when given the list [(Clubs,Ace),(Spades,Ace),(Diamonds,Ace)] [incorrect answer]
sum_cards: Your function returns an incorrect result when summing a list of cards. [timeout]
sum_cards: Your function returns an incorrect result when summing a long list of cards. [timeout]
score: Your function returns an incorrect result when the sum is greater than the goal, and the hand contains cards of both colors. [timeout]
score: Your function returns an incorrect result when the sum is not greater than the goal, and the hand contains cards of both colors. [timeout]
score: Your function returns an incorrect result when the sum is greater than the goal, and the hand contains cards of oly one color. [timeout]
score: Your function returns an incorrect result when the sum is not greater than the goal, and the hand contains cards hand of both colors. [timeout]
score: Your function returns an incorrect result when the sum is exactly equal to the goal. [timeout]
score: Your function returns an incorrect result when you must round the score correctly. [timeout]
officiate: Your function returns an incorrect result when the game should end due to an empty card list. [Overflow exception thrown]
officiate: Your function returns an incorrect result when the game should end due to the sum of cards in the player's hand exceeding the goal. [Overflow exception thrown]
officiate: the game ends with no more move and the held-cards are of different colors. [Overflow exception thrown]
3a tests failed to run (most likely caused by an incorrect function signature or unimplemented function in the submission)
3b tests failed to run (most likely caused by an incorrect function signature or unimplemented function in the submission)

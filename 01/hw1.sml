(* 1 *)

fun is_older(date1 : int * int * int ,date2: int * int * int) =
  (#1 date1 < #1 date2) orelse
  ((#1 date1 = #1 date2) andalso (#2 date1 < #2 date2)) orelse
  ((#1 date1 = #1 date2) andalso (#2 date1 = #2 date2) andalso (#3 date1 < #3 date2))
      
(* 2 *)

fun number_in_month (dates:(int * int * int) list , month : int) =
  if dates = []
  then 0
  else if ( #2 (hd dates) = month )
  then 1 + number_in_month(tl dates , month)
  else  number_in_month(tl dates , month)


(* 3 *)
		       
fun number_in_months (dates:(int * int * int) list , months : int list) =
  if months = []
  then 0
  else number_in_month(dates,hd months) +
       number_in_months(dates ,tl months)

(* 4 *)
fun dates_in_month (dates :(int * int * int) list, month : int) =
  if dates = []
  then []
  else if (#2 (hd dates) = month)
  then (hd dates) :: dates_in_month(tl dates, month)
  else dates_in_month(tl dates, month)

(* 5 *)
fun dates_in_months (dates : (int * int * int) list, months : int list) =
  if months = []
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* 6 *)
(* summary:choose 1 when 「1」is considered head of a list,or choose 0 when 「0」is considered.*)
(*well,it all depends on its environment.*)
fun get_nth (set: string list, n: int) =
  if n = 1
  then hd set
  else get_nth(tl set,n-1)

(* 7 *)

fun date_to_string(date:int * int * int) =
  let
      val month_string =
	  ["January","February","March","April","May","June","July","August","September","October","November","December"];
  in
      get_nth(month_string, #2 date) ^
      " " ^
      Int.toString(#3 date)  ^
      ", " ^
      Int.toString(#1 date)
  end

(* 8 *)
fun number_before_reaching_sum (sum: int, int_list: int list) =
  if sum >= hd int_list
  then 1 + number_before_reaching_sum(sum - hd int_list, tl int_list)
  else 0

(* 9 *)
fun what_month(day:int) =
  let val day_list = [31,28,31,30,
		      31,30,31,31,
		      30,31,30,31]
  in
      number_before_reaching_sum(day, day_list)
  end

(* 10 *)
fun month_range (day1: int ,day2: int) =
  if day1 > day2
  then []
  else what_month (day1) :: month_range(day1+1, day2)


(* 11 *)
fun oldest (dates: (int * int *int) list) =
  if dates = []
  then NONE
  else let
      fun max (dates: (int * int * int) list) =
	if tl dates = []
	then hd dates
	else let val tmp = valOf (oldest(tl dates))  (* I omitted 「valOf」in the beginning and wastes much time *)
	     in
		 if is_older (hd dates,tmp)
		 then hd dates
		 else tmp
	     end
  in
      SOME (max dates)
  end

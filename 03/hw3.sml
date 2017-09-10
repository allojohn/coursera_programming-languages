

			       
			       (* 1 *)
val only_capitals  =
  List.filter (fn xs => Char.isUpper (String.sub (xs,0)))

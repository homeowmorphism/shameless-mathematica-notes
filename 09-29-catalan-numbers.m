(* KILLING TIME *)

(* What are the 3-digit numbers which are the sum of the cube of their digits *)
3^3 + 7^3 + 1^3

Total[IntegerDigits[371]^3]

crit[n_] := (n == Total[IntegerDigits[n]^3]

Select[Range[100,999], crit]

(* THE CATALAN NUMBERS *)

(* The point of Catalan numbers is that they don't have one definition, they have 70 equivalent definitions. -- See Richard Stanley's paper, 70 definitions, 70 proofs they are equivalent.*)

(* C_n = |\{triangulating using non-intersecting diagonals in (n+2)-gon\}| *)

(* Picture of numbers of triangulating a pentagon into 3 triangles, rotations of triangulationa are thought of as distinct. *) 
(* => C_3 = 5 *)
(* C_4 = ? *)

(* C_n = number of ways of making sense of an (n+1)-word sentence in English. *) 
(* lol he was kidding, it's the number of ways of multiplying in order in a non-associative algebra. *)
(* "Pretty little boys school." Shorten as PLBS *)
(* C_3 = ((PL)B) *)
(* C_3 = ((ab)c)d, (a(bc)d), a((bc)d), a(b(cd)), (ab)(cd) *)

(* C_n = the number of bin trees of a certain type *)

(* The list goes on and on.. *)

(* PROJECT IDEA *)

(* Make a poster of Catalan numbers in the following way. *)
(* col 1 = triang, non-ass-words, trees *)
(* draw C_1, C_2, etc on input n_ *)

(* Dror : "You know it really is beautiful mathematics, let me show you a chapter from paper. *)

(* See example in blackboard (I has pic) *)

(* Steps: 1. Produce all triangulations. 2. Draw them *)
(* How to produce? Start with an edge, associate the opposite vertex, and draw triangle. Call recursively. *)

(* Dror thinks nested lists are easy to get confused about, so use something else. *)
(* {{1,5},{1,3},{3,5}} <-> ds[d[1,5],d[1,3],d[3,5]] *)

(* Let's implement triangulation function *)

ts[n_] := ts[Range[0, n+1]]

(* This went wrong -- the ts called itself. But if you specify that n_ is an integer *)

ts[n_Integer] := ts[Range[0, n+1]]
(* Produces ts[{0,1,2,3,4,5}] *)

(* "We are at break time now, but I'm going to continue speaking." *)

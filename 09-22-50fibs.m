(* # 50 WAYS TO COMPUTE FIBONACCI *) 



(* "I think mathematica is truly lovely, but also Wolfram has gone crazy [...] there is too much bloat in it. *)
(* Dror thinks of variables as numbers. *)

(* Naive way *)
f0[0] = f0[1] = 1; f0[n_] := f0[n-1] + f0[n-2];

(* Timing evaluates how long something takes *)
Table[Echo@Timing[n -> f0[n]] {n, 1, 40}
?Echo
Echo[1+1]*7 (* will print 2 but return 14 *)

(* If you don't know how something works, do ?something ex: ?Timing, ?Table *)
Table[ij, {i, 10}, {j, 10}] // MatrixForm

(* We've seen that the naive way takes way too long to do. It should just add the last two numbers but instead it computes the whole stack every time. Let's correct it. -- Dynamic programming *)

(* There's a difference between assignment and DELAYED assignment. *)
a = n
a := n

(* When Mathematica does things, it first uses a = n, then a := n *)
sq[x_] := x^2
sq[7]
sq[7] = 50

(* Now sq will first use sq = 50, then x^2. *)
Table[sq[i], {i, 10}]

sq[x_] := (sq[x] = x^2)
(* What this will do is assign all the previous values - it saves them in an array like you'd expect in dynamic programming. *)
Table[sq[i], {i, 10}]

(* Note := binds tighter than = for that reason. *)
(* Ask computer how many values it has memorized. *)
Global `f1

(* Can print the table like an array. *)
Table[f1[k], {k, 0, 10}]

(* Can clear the data so it recomputes it using the old rule. *)
f1[3] =. 

(*Other ways to do fib -- more imperative syntax. *)
{prev, cur} = {cur, prev + cur}
k = prev = cur 1;
While[k <= 100, {{prev, cur} = {cur, prev + cur}}; ++k];cur = prev + cur, prev = cur};
cur 

(* - Aside - *)
(* Easy to get things mixed up when needed to swap two variables. *)
(* Clever trick to switch variables if they are numbers. *)
a = b - a 
b = b - a
a = a + b
(* You can also use this trick to swap two rows in lin alg *) 
(* - End aside - *)

(* By the way, control flow statements like "while" are discouraged because there's usually a better way to do this in Wolfram. Ex, make a list of numbers from (1,100) then replace the head of the list to not be List but Times. This multiplies every number on the list together.*)

;?
(* Translates to compound expression -> stored as an expr tree -> evaluated but output forgotten, and then side-effects the other variables. Returns only the last expression as the result. *) 

(* This expression evaluates to 1. *)

f2[n_] = (
	{k, prev, cur} = {1, 1, 1};
While[k < n, {prev, cur} = {cur, prev + cur}; ++k];
cur
)
(* This is because we only have a current assignment, so the while loop is not evaluated. We need that dynamic evaluation. The next one returns the right thing.*)

f2[n_] := (
	{k, prev, cur} = {1, 1, 1};
While[k < n, {prev, cur} = {cur, prev + cur}; ++k];
cur
)

Times@Range[5]
Times@@Range[5] (* this goes one level below, so you can Times[Range] instead of Times[List] this REPLACES.*)
(*h@l1 == h[l1] == l1 // h;
	l1 ~ h ~ l2 = h[l1,l2] *)

f[g[1],g[2]]
h@@@f[g[1],g[2]]

?For
For[k = 1 = cur = prev = 1, k < 100, ++, {prev, cur} = {cur, prev + cur}]
cur

?Do
{prev, cur} = {1,1}
Do[{prev, cur} = {cur, prev + cur}, 99];
cur

f6[n_] := While[Length[fs] <= n, fs = Append[fs, fs[-1] + fs[-2]]
f6[100]

f9[n_] := Module[{fs = {1,1}
	While[Length[fs] <= n, AppendTo[fs, 1 + Total@Most@fs]];
fs
]

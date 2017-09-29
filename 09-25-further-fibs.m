(* FURTHER WAYS TO COMPUTE FIBONACCI *)
(* Another 10 in particular. *)

(* "We will be seeing more of Mathematica, and maybe even some mathematics." *)

(* Possible smallish projects *)

(* How to display a pdf *)
Rasterize[
	Import[
	"your-pdf-here"][1]
	ImageResolution -> 120
	] // ImageCrop

(* Reminder: we did it in a naive way, then a better way using := *)

Series[1/(1-x-x^2), {x,0,10}]

D[1/(1-x-x^2), {x, 100}] / 100! /. x -> 0 

(* This doesn't work to get the 10th element. *)
Series[1/(1-x-x^2), {x,0,10}][10]

(* This is because series are not represented the way we think. *)
Series[1/(1-x-x^2), {x,0,10}] // FullForm

(* Need the third element of the stored list at the 10th coefficient. *)
Series[1/(1-x-x^2), {x,0,10}][3, 10]

(* Or we can do it this way *)
SeriesCoefficient[1/(1 - x - x^2), {x,0,10}]

(* Also, f_n is also the number of ways of reaching $n$ using 1's and 2's (you did this in a quiz before!) *)
(* Suppose you have a staircase of $n$ stairs, which you can climb in skips of 1 or 2. *)

(* This implies that the fib numbers is equal to choosing a number of K 2's 
-- leading to the remaining sum being $n - 2K$, the rest being ones, we have $2 + n-2K$ numbers so 
$n - K$ numbers. Since we can have at most floor(K/2) 2's and at least 0, we get*)

f13[n_] := Sum[Binomial[n-k, k], {k, 0, Floor[n/2]}]
f13[10]

(* Next up: finding an explicit formula for Fib *)
(* By the way, explicit is kinda narrow : the only thing a formula does is give us an algorithm to compute stuff -- (I would add not even lol) *)
(* Anyway, you can use the matrix way to do it and solve for Eigenvals *)

(* The way Dror does it though: 
$f_n = \lambda^n$ what is $\lambda$?
$\lambda^2 = \lambda + 1$ 
$\alpha \lambda_1^n + \beta \lambda^n = f_n$
$f_0 = 1 = \alpha + \beta$ 
$f_1 = 1 = \lambda_1 \alpha + \lambda_2 \beta$*)

Solve[\[Lambda]^2 ==  \[Lambda] + 1]

(* Can also do it using matrices *)
MatrixPower[{1 & 1 \\ 1 & 0}, 100]
f16[n_] := MatrixPower[{1 & 1 \\ 1 & 0}, 100][1,1]
f16[100]

%U1
E = [1 3; 9 -2]
resultado = det(E)
rgE = rank(E)


%sistema de ecuacion lineal
A = [1 -4; 1 -3] %cohefcientes
B = [6; 4] %terminos independientes

MA = [A B]

rgA = rank(A)
rgMA = rank(MA)
nVar = columns(A)
% verificar RF rgA = rgMA = n y n = nVar

X = A\B
% conjunto solucion del sistema

%funciones utiles det(), rank(), columns(), inv()
 
%U2
u = [-1 0]
v = [3 3]
r = u*v'

%U4
%funciones utiles dot(), norm()

%U6
%funciones utiles eig(), det(), trace(), [P, D] = eig(A)

L = [2 1 1;1 2 1;1 1 2]

V = eig(L) %devuelve los autovalores hallados
[P, D] = eig(L) %devuelve las matrices P que ortogonaliza L y la matris ortogal D
T = trace(L)
SumV = sum(V) % | S = V(1) + V(2) + V(3)
ProdV = prod(V)% | P = V(1)*V(2)*V(3)  


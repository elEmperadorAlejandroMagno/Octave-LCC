% u4
%ej 4
% R^3 con el PI euclidiano
A = {[3 -1 0], [1 3 2]}
piA = dot(A{1}, A{2}) % producto interior 2 a 2 de los vectores del conjunto A y deben dan 0 para que sea perpendiculares
if piA == 0
    printf("A es ortogonal ya que el PI = 0\n")
else
    printf("A no es ortogonal\n")
end

A = {[2 -1 0], [1 2 1]}
piA = dot(A{1}, A{2})
if piA == 0
    printf("A es ortogonal ya que el PI = 0\n")
else
    printf("A no es ortogonal\n")
end

%ej6

B = {[1 0 -1], [-1 2 1], [1 1 0]};
%B es base?
M = [B{1};B{2};B{3}]
esc_M = rref(M) % escalonamos la matriz y revisamos si una fila se anulo, en tal caso dicho vector es CL de los demas y por lo tanto B es LD
printf("B es LI ya que no se anula ninguna fila al escalonar\n")

%rg = rank(M); % el rango me dira si alguna fila se anula
%n = rows(M) % numero de vectores de B
%if rg == n % si el rango de M es = al numero de vectores enotnces ninguna fila se anula y por lo tanto B es LI
%    printf("Entonces B es LI")
%else
%   printf("B es LD")

%SI es base entonces verificamos PI 2 a 2 de los vectores de B
piA1 = dot(B{1},B{2})
piA2 = dot(B{1}, B{3})
piA3 = dot(B{2},B{3})

if piA1 != 0
    printf("B no es BO\n")
elseif piA2 != 0
    printf("B no es BO\n")
elseif piA3 != 0
    printf("B no es BO\n")
else
    printf("Dado que los PI 2 a 2 de los vectores de B dan 0 entonces B es BO\n")
end

%ya que B no es BO hay que transformarla con GS
v1 = B{1}
v2 = B{2} - (dot(B{2}, v1) / norm(v1)^2) * v1
v3 = B{3} - (dot(B{3}, v1) / norm(v1)^2) * v1 - (dot(B{3}, v2) / norm(v2)^2) * v2

format rat
BO = {v1, v2, v3} %obutivmos una Base Ortonormal
printf("El conjunto BO es un conjunto ortogonal obtenido al aplicar GS para transformar el conjunto B LI en una BON\n")







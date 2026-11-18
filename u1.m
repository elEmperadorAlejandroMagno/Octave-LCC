%ej5
F = [-1 -1;0 -2;1 0]
B = [4 -6;0 4;-2 -2]
G = [0 -5 2;2 -1 3]
D = [2 1 1;3 0 2;4 -1 3]
E = [1 -1;2 0]

printf("a) F + (3/2 * B)")
Opa= F + (3/2 * B)
printf("b) B - (2 * G') = ")
Opb = B - (2 * G')
printf("c) (B' * F) - D No puede realizarse pues el resultado de B' * F da una matriz 2x2 y D tiene orde 3x3\n")
printf("d) (F + B) * G")
Opd = (F + B) * G
printf("e)((1/2 * B) * G) + E' No puede realizarse ya que la matriz resultante de (1/2 * B) * G da como resultado una matriz 3x3 y E es una matriz 2x2\n")
printf("f)(B * G) - D^2")
Opf = (B * G) - (D^2)

%ej6
E = [1 3;9 -2]
M = [2 -1 -1;-2 1 -2;-1 0 -1]
F = [1 1 -1;1 -1 1;-1 1 1]
G = [-1 0 2 1;1 1 0 3;0 2 2 3;2 0 -4 -2]
H = [1 2 3;0 -2 6;-1 -2 -3;0 0 6;2 0 0]
J = [2 3 -1 0;2 0 2 2;1 0 -1 1;3 1 0 1]

function det_Matriz(A, nom)
    [op1, op2] = size(A);
    if op1 == op2
        printf("|%s| = %d\n", nom, det(A))
    else
        printf("%s no es una matriz cuadrada por lo tanto no se puede calcular determinante\n", nom)
    end
end

det_Matriz(E, "E")
det_Matriz(M, "M")
det_Matriz(F, "F")
det_Matriz(G, "G")
det_Matriz(H, "H")
det_Matriz(J, "J")

%8
A = [6 -9;0 2]
B = [2 1 1;3 0 2;1 -1 3]
C = [1;2;-5]
D = [-1 0 3 0;1 2 -3 -1;4 2 -12 1]
E = [0 -3 0]
F = [1 1 -1 0;0 2 1 1;2 1 0 -3;-1 -2 3 -3]

printf("rg(A) = %d\n",rank(A))
printf("rg(B) = %d\n",rank(B))
printf("rg(C) = %d\n",rank(C))
printf("rg(D) = %d\n",rank(D))
printf("rg(E) = %d\n",rank(E))
printf("rg(F) = %d\n",rank(F))

%10

cA = [2 -4; 1 -3];
iA = [6;4];

cB = [2 -3;4 -6];
iB = [1;7];

cC = [-1 2 -3;3 -5 8;2 -3 5];
iC = [-2;3;1];

cD = [-2 1 2;4 -2 2;-6 -2 3];
iD = [0;0;4];

cE = [1 2 -3 -4;1 3 1 -2;2 5 -2 -6];
iE = [6;4;9];

cF = [-5 0 1 2;1 -1 0 1;-3 -2 1 4;2 3 -1 -5];
iF = [-13;6;-1;-5];

function rf_clasificar(cA, iA, var)

    rgA = rank(cA);
    AO = [cA iA];
    printf("Sistema\n")
    disp(AO)
    rgAO = rank(AO);

    if rgA == rgAO

        if rgA == columns(cA)
            printf("El SEL es compatible determinado\n")
            printf("Única solución\n")
            S = (cA\iA)'
        elseif rgA < columns(cA)
            printf("El SEL es compatible indeterminado\n")
        end


    else
        printf("El SEL es incompatible\n");
    end

end

pkg load symbolic
format rat

printf("a)")
rf_clasificar(cA, iA) % (x y) determinado

printf("b)");
rf_clasificar(cB, iB); % (x y) incompatible

printf("c)");
rf_clasificar(cC, iC); % (x y z) indeterminado
escM = rref([cC iC]) % escalonamos y con despeje regresivo buscamos una solucion
printf("S={(x,y,z) in R^3: y = -3 + z, x = -4 - z, z in R}\n")


printf("d)");
rf_clasificar(cD, iD); % (x y z) incompatible

printf("e)");
rf_clasificar(cE, iE); % (u v w z) incompatible

printf("f)");
rf_clasificar(cF, iF); % (t u v w) indeterminado
escM = rref([cF iF]) % escalonamos matriz orlada y remplazo regresivo
printf("S={(t,u,v,w) in R^4: u = -17/5 + 1/5 v + 7/5 w, t = 13/5 + 1/5 v + 2/5 w, v,w in R}") 

%ej 13

A = [-2 5;-1 3]
B = [0 2 -1;1 -2 1;1 -4 2]
C = [4 7 0;-3 -1 5]
D = [2 3 1;1 2 1;0 0 1]
E = [7 -6 2;-1 1 0;2 -2 1]

function es_inversible(A)
    [m,n] = size(A);
    printf("Matriz\n")
    disp(A)
    if m == n
        
        detA = det(A);
        if detA != 0
            printf("La matriz es inversible ya que la determinante %d es distinto de 0\n", detA)
            printf("Matriz inversa\n")
            disp(inv(A))
        else
            printf("La matriz no es inversible ya que la determinante es 0\n")
        end
    else
        printf("La matriz no es cuadrada, no es inversible\n")
    end
end

es_inversible(A)
es_inversible(B)
es_inversible(C)
es_inversible(D)
es_inversible(E)









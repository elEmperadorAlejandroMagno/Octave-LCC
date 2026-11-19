%ej 2

printf("Union de S y T\n")
printf("a) S={(x,y,z) in R^3: x + y = 0} y T={(x,y,z) in R^3:-x+y+z=0}\n")
st = [1 1 0;-1 1 1]
i = [0;0]
sel = [st i] % armamos el sitema con ambas condiciones
format rat

function clas_sel(m, mo)
    rg1 = rank(m) % matriz coheficinetes
    rg2 = rank(mo) % matriz orlada
    if rg1 == rg2
        printf("El SEL es compatible ")
        if rg1 == columns(m)
            printf("Determinado\n")
        else
            printf("Indeterminado\n")
            esc = rref(mo)
        end
    else
        printf("El SEL es incompatible\n")
    end
end

clas_sel(st, sel) %x,y,z
printf("S ∩ T={(x,y,z) in R^3: y = -1/2z, x = 1/2z}\n")

disp("b) ")
disp("Por isomorfismo de M2x2 a R^4\n")
S = "S={(a b c d) in R^4: a + b + c = 0}\n";
T = "T={(a b c d) in R^4: b = 0\n";
printf("%s y %s\n", S, T)
st = [1 1 1 0; 0 1 0 0]
i = [0;0]
sel = [st i]
clas_sel(st, sel)
printf("S ∩ T={(a,b,c,d) in R^4: b = 0, a = -c}\n")

disp("c)")
disp("Por isomorfismo de P2 a R^3")
printf("S={(x,y,z) in R^3: x - y = 0} y T={(x,y,z) in R^3: x + y + z = 0}\n")
st = [1 -1 0;1 1 1]
i = [0;0]
sel = [st i]
clas_sel(st, sel)
printf("S ∩ T={(x,y,z) in R^3: y = -1/2z, x = -1/2z}\n")

%ej3
printf("u es combinación lineal de los vectores v y w?")
disp("a)\n")
u = [-1 0 2]
v = [0 1 3]
w = [1 1 1]
cl = [u;v;w]

cl_esc = rref(cl)
%FALTA


%ej6 
function es_li(m)
    n = rows(m); % cantidad de filas
    esc = rref(m)
    if rank(m) < n % rango = cantidad de filas no nulas
        % si se anula una fila entonces es LD
        printf("El conjunto es Linealmente dependiente\n")
    else
        % si no se anula ninguna fila entonces es LI
        printf("El conjunto es LI (Linealmente independiente)\n")
    end
end

disp("a)\n")
x1 = [1 0 2]
x2 = [-1 1 3]
x3 = [0 -1 1]
X = [x1;x2;x3]
es_li(X)

disp("b)\n")
printf("Por isomorfismo pasamos de M2 (R) -> R^4\n")
x1 = [1 0 3 2]
x2 = [-1 1 1 0]
x3 = [2 1 1 0]
x4 = [3 2 3 7]
X = [x1;x2;x3;x4]
es_li(X)

disp("c)")
printf("Por isomorfismo pasamos de M2x1(R) -> R^3\n")
x1 = [-1 0 1]
x2 = [2 1 3]
x3 = [-1 1 -1]
X = [x1;x2;x3]
es_li(X)

%ej 10

function comp_vector_base(base, vector)
    A = [base vector] % armamos la matric orlada con los vectores columna
    A_esc = rref(A) % escalonamos
    v_B = A_esc(:, end) % extraemos los componentes de la ultima columna
    printf("Componentes de u en al base B: \n[u]B =\n")
    disp(v_B)
end

printf("Hallar los compenentes del vector u en la base que se indica\n")
disp("a)")
% armamos los vectores como columnas
u = [1;2;8;3]
b1 = [0;1;2;1]
b2 = [-1;1;0;0]
b3 = [-1;2;3;0]
b4 = [2;-2;0;2]
B = [b1 b2 b3 b4]
comp_vector_base(B, u)

disp("b)\n")
u = [0;1;0]
b1 = [-2;1;0]
b2 = [0;2;1]
b3 = [-2;3;2]
B = [b1 b2 b3]
comp_vector_base(B, u)

%ej 11
printf("Obtener el vector u, conocido sus componentes en la base indicada\n")
function vector_org(B, u)
    u_org = B * u; % producto entre la matric de la base y la matriz de los componentes del vector en dicha base
    printf("El vector u: \n")
    disp(u_org)
end

disp("a)\n")
comp_u = [-1;0;1;2]
b1 = [0;1;1;0];
b2 = [-1;0;1;1];
b3 = [-1;1;3;3];
b4 = [2;0;-3;5];
B = [b1 b2 b3 b4]
vector_org(B, comp_u)

disp("b)\n")
comp_u = [0;1;0]
b1 = [-2;1;0];
b2 = [0;2;1];
b3 = [-2;3;2];
B = [b1 b2 b3]
vector_org(B, comp_u)

%ej 12
printf("Hallar las matrices de paso P = MB->B' y Q = MB'->B\n")
disp("a)\n")
B1 = [-1 2 3;-1 -1 2;0 -3 2]
B2 = [1 1 0;0 2 1;0 0 2]

function matriz_paso(B1, B2, M)
    B21 = [B2 B1] % intercambiamos lugar de bases
    esc_B21 = rref(B21) % escalamos, las ultimas 3 columnas forman la matriz de paso
    printf("%s\n", M)
    disp(esc_B21(:,columns(esc_B21) - 2 : columns(esc_B21))
)
end

matriz_paso(B1, B2, "P = M B->B'")

disp("b)\n")
printf("Isomorfismo de P1 a R^2")
B1 = [1 3.2]
B2 = [-1 -1]
matriz_paso(B1, B2, "Q = M B'->B")


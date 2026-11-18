%ej 4

u = [-1 0]
v = [3 -3]
w = [0 -4]

function es_versor(u, nom)
    norma = norm(u);
    if norma == 1
        printf("El vector %s es versor\n", nom)
    else 
        printf("El vector %s no es un versor, la norma debe ser = 1\n", nom)
    end
end

es_versor(u, "u")
es_versor(v, "v")
es_versor(w, "w")
res = (3 * u) + v * (1/2 * u)' - (6 * v) * norm(u - v) * norm(12 * w + 3 * u - v);
printf("b) 3u + v * 1/2u - 6v * ||u - v|| * ||12w + 3u - v|| =")
disp(res) % devuelve un nuevo vector

u = [1 -2 0]
v = [-2 -6 0]
w = [-1/6 -5/6 1/6]

es_versor(u, "u")
es_versor(v, "v")
es_versor(w, "w")
res = (3 * u) + v * (1/2 * u)' - (6 * v) * norm(u - v) * norm(12 * w + 3 * u - v);
printf("b) 3u + v * 1/2u - 6v * ||u - v|| * ||12w + 3u - v|| =")
disp(res) % devuelve un nuevo vector

%ej 7
u = [2 sqrt(5)];
norm_v = 2;
ang_u_v = 30;
% no tengo idea de ocmo se hace

p1 = [0 1 -2];
p2 = [1 -1 0];
p3 = [0 -1 2];
% calculo de un vector por sus puntos u = P2 - P1 
u = p2 - p1
v = p3 - p1
%prod escalar
printf("u.v = ")
res = u * v';
disp(res)

%coseno (v1 * v2') / norm(v1) * norm(v2)
norm_u = norm(u);
norm_v = norm(v);
%printf("u.v = ||u|| . ||v|| cosA = ")
prod_esc = ((u * v') / (norm_u * norm_v));
ang_A = acos(prod_esc);
printf("Angulo(rad) entre u y v = ")
disp(ang_A)
% u.v = 0 entonces u y v son perpendiculares
printf("Dado que u.v != 0 entonces u y v no son perpendicualres\n")

%ej8
v1 = [-6 12];
w1 = [4 -8];

v2 = [1 2 -1];
w2 = [-1 2 1];

v3 = [-2 -6 1];
w3 = [3 1 12];

function clasificar_vectores(u, v)
    printf("v ")
    disp(u)
    printf("w ")
    disp(v)
    num = u * v'; %prod escalar por componente
    if num == 0
        % si el producto escalar = 0 entonces los vectores son perpendiculares
        printf("Son perpendiculares\n")
    else
        m = [u;v]; % matriz formada por vectores fila
        n = rows(m); % cantidad de filas
        if rank(m) < n 
            % si el rango de la matriz escalonada < numero de filas de la matriz original entonces una fila se ha anulado, por lo tanto un vector es multiple del otro y por lo tanto son pararelos 
            printf("Son paralelos\n")
        else
            printf("No son perpendicualres ni paralelos\n")
        end
    end
end
        
clasificar_vectores(v1, w1)
clasificar_vectores(v2, w2)
clasificar_vectores(v3, w3)


    

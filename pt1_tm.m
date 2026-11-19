%ej1

MC = [-1 1 -1;2 -1 1;0 1 1;2 0 2] % Matriz de coheficientes del SEL simultaneo
I1 = [0;1;-1;0] %matriz de terminos independiendes 1
I2 = [1;1;0;0] % matriz de terminos independientes 2
var = columns(MC) % cantidad de variables en el SEL

SEL1 = [MC I1] % matriz de SEL con I1
%e_SEL1 = rref(SELS) % escalonamos matriz ampliada
rg = rank(MC) % rango de coheficientes
rgA = rank(SEL1) % rango del SEL

function clas_sel(rg, rgA, var)
    if rg == rgA % si el rango de la M de coheficientes es igual al rango de la matriz ampliada entonces es compatible
        if rg == var % si el rango de la matriz es igual al numero de variables del SEL entonces es compatible determinado
            printf("El SEL es compatible determinado, tiene una única solucion\n")
        else
            printf("El SEL es compatible indeterminado, tiene infinitas soluciones\n")
        end
    else %dado el el rg de A es distinto al rg A° entcones el SEL es incompatible
        printf("El SEL es incompatible, no tiene solución\n")
    end
end

clas_sel(rg, rgA, var)
% escalonamos y buscamos una solución

e_SEL1 = rref(SEL1)
%S = MC\I1 % no funciona
printf("La solucion del sistema es: \n")
S = e_SEL1(1:3,4)'

SEL2 = [MC I2] % matriz de SEL con I2
rg = rank(MC)
rgA = rank(SEL2) % rango de la matriz ampliada
clas_sel(rg, rgA, var) %clasificamos

%ej2
printf("Analizar si X={(1,0,2),(3,-2,4),(2,-2,2)} es linealmente independiente. Si no lo es determinar el o los vectores que son CL de los demás.\n")
X = {[1 0 2], [3 -2 4], [2 -2 2]}
u1 = X{1};
u2 = X{2};
u3 = X{3};
M = [u1;u2;u3] %matriz de los vectores fila
e_M = rref(M) %escalonamos y observamos si se anula alguna fila
printf("Dado que la ultima fila se anula al escalar, u3 es CL de los demás vectores del conjunto X\n")

%ej 3
printf("T:M2 -> R^2 / T (a b; c d) = (a + 2b, a + c + d), B = C, B' = C\n")
printf("Por isomorfismo M2 -> R^4")
printf("a) Clasificarla utilizando la matriz asociada en las bases indicadas\n")
B1 = [1 0 0 0;0 1 0 0; 0 0 1 0; 0 0 0 1] % base B del dominioR^4
B2 = [1 0;0 1] % base B' del cod R^2

T = @(v) [v(1) + 2*v(2); v(1) + v(3) + v(4)]; %formula de la transformación lineal
TA = [T(B1(:,1)), T(B1(:,2)), T(B1(:,3)), T(B1(:,4))]; % matriz de los transformados de los vectores columna

MA = [B2 TA] % armamos la matriz de B1 en B2 intercambiando lugares
e_MA = rref(MA) % escalonamos y tomamos las ultimas 4 columnas corresponientes que forman la Matriz asociada a T
printf("Matriz asociada [T]B->B'\n")
MA = e_MA(:,3:end) %matriz asociada a T
rgT = rank(MA) %rango de la matriz asociada es igual al rango de la Imagen de T (RgT)
dimD = 4 % dimension del dominio R^4
dimCD = 2 % dimension del codominio R^2
iny = 0;
sob = 0;
if rgT == dimCD % T es sobreyectiva pues Imt = R^2
    printf("T es sobreyectiva\n")
    sob = 1;
else 
    printf("T no es sobreyectiva\n")
end
if rgT == dimD % T es inyectiva pues NulT = dimCD - RgT, por lo que NulT = 0 
    printf("T es inyectiva\n")
    iny = 1;
else
    printf("T no es inyectiva\n")
end
if iny == 1 && sob == 1 % T es inyectiva y sobreyectiva
    printf("T es biyectiva\n")
else 
    printf("T no es biyectiva\n")
end

printf("b) Hallar el NucT\n")

v_nulo = [0;0];
SEL = [MA v_nulo] % armamos SEL con la Matriz asociada y el vector nulo del codominio
format rat
e_SEL = rref(SEL) % escalonamos y dado que rg < #var tenemos 2 variables libres
printf("NucT={(x,y,z,w) in R^4: x = -1z - 1w, y = 1/2z + 1/2w, z,w in R}")

%ej 4
A = [1 1 0;0 2 1;0 0 3]
printf("a)Hallar autovalores\n")
av = eig(A) %autovalores
t_A = trace(A) %traza de A
d_A = det(A) % determinante de A
s_av = av(1) + av(2) + av(3) % suma de los autovalores
p_av = av(1) * av(2) * av(3) % productos de los autovalores
if t_A == s_av && d_A == p_av % la suma y el producto de los autovalores es igual a la traza y el determinante de lam atriz
    printf("Se verifican las propiedades de los autovalores\n")
end

[P, D] = eig(A);
printf("Matriz diagonal D\n")
disp(D)




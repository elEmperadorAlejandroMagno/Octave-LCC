%ej 7
pkg load symbolic

printf("a) T: R^3 -> R^3 [T]C = A = (1 0 1;2 1 0;-1 2 1)")

syms  x y z k1 k2 k3;

MA = [1 0 1;2 1 0;-1 2 1] % matriz asociada
A1 = [1;0;0]
A2 = [0;1;0]
A3 = [0;0;1]
u = [x;y;z] % vector generico del dominio R^3
v_nulo = [0;0;0] % vector nulo del codonimio R^3

eql = k1 * A1 + k2 * A2 + k3 * A3 == u % SEL para encontrar los componentes de u
MO = [A1 A2 A3 u] % matriz ampliada del SEL
e_MO = rref(MO) % escalonamos
u_C = e_MO(:,4) % extraemos los componentes de u en la ultima columna de la Matriz ampliada

NucT = MA * u == v_nulo % SEL para encontrar el Nucleo de T con el vector generico del dominio

M = [1 0 1;2 1 0;-1 2 1]; %matriz de coeficinetes del SEL de NucT
I = v_nulo; % termino indepentiende del SEL con el vector nulo
SEL = [M I] % matriz ampliada
e_SEL = rref(SEL) % escalonamos
printf("Nuct={(x,y,z) in R^3: x = 0, y = 0, z = 0}\n")

printf("b) T: R^2 -> R^3\n")
syms x y k1 k2

MA = [-1 0;0 1;1 -1] % matriz asociada
B1 = {[1;2], [0;1]} % vectores columna
B2 = {[0 1 1], [1 0 1], [1 1 0]}
u = [x;y] % vector generico en C

eql = k1 * B1{1} + k2 * B1{2} == u % SEL para encontrar los componentes del vector generico u en B1

M = [B1{1} B1{2} u] % SEL matricialmente con matriz ampliada
e_M = rref(M) % escalonamos
u_B1 = e_M(:,3) % extraemos los componentes de u 

NucT = MA * u == [0;0;0] % Nucleo de T

M = [-1 0 0;0 1 0;1 -1 0];
nulo = [0;0;0];

SEL = [M nulo] % matriz de coefincientes ampliada
e_SEL = rref(SEL) % escalonamos y obtenemos la solucion al SEL
printf("NucT={(x,y) in R^2: x = 0, y = 0}\n")

syms x y z
% Imagen de T
v = [x;y;z] % vector generico del codominio R^3
Im = [M v] % espacio generador por las columnas de la matriz asociada
e_Im = rref(Im) % escalonamos y observamos si requiere alguna condicion
printf("Luego ImT={(x,y,z) in R^3: x+y+z = 0}")




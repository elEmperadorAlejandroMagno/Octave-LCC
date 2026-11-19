% u5
%ej 4

printf("Hallar la matriz asociada a T\n")
disp("a)\n")
printf("T: M2x1 → R^2 / T (a b) = (4a − 2b, 2a + b) , B = C, B ' = C.\n")
printf("Por isomorfismo de M2x1 -> R^2") % v in R^2 v(1)=a v(2)=b
T = @(v) [4*v(1) - 2*v(2); 2*v(1) + v(2)] % formula de transofrmacion
A1 = [1 0]
A2 = [0 1]
TA = [T(A1), T(A2)] % transformacion de la base del dominio
B = [1 0;0 1] % base del codonimio
B_TA = [B TA] % SEL simultaneo

esc_BTA = rref(B_TA) %escalonamos
MA = esc_BTA(:,3:end) % obtenemos las columnas de la matriz asociada en este caso las ultimas 2 columnas ya que el EV es R^2

rgT = rank(MA) % rango de la Matriz asociada = Rango de la Imagen de T
disp("R^2")
dimD = 2 %dimension del dominio R^2
disp("R^2")
dimCD = 2 % dimension del codominio R^2

function clas_ma(rgT, dimD, dimCD)
    iny = 0;
    sob = 0;
    if rgT == dimCD % si el rgT es igual a la dimension del codominio entonces ImT = R^2 (EV del codominio)
        printf("T es sobreyectiva\n")
        sob = 1;
    else
        printf("T no es sobreyectiva\n")
    end

    if rgT == dimD % si el rg de MA es = dimension del dominio entonces Nulidad de T ,que es la dimension del Nucleo de T, es 0 dado que Nul = dimD - rgT
        printf("T es inyectiva\n")
        iny = 1;
    else
        printf("T no es inyectiva\n")
    end

    if iny == 1 && sob == 1 % si T es biyectiva sii T es inyectiva y sobreyectiva a la vez
        printf("T es biyectiva\n")
    else 
        printf("T no es biyectiva\n")
    end
end

clas_ma(rgT, dimD, dimCD)

disp("b)\n")
printf("T: P2 → R^2 / T(ax2 + bx + c) = (b + c, −2b − 3c), B = {−x2, x, −1}}, B ' = {(1, 1), (0, 1)}")
printf("Por isomorfismo P2 -> R^3")

T = @(v) [v(2) + v(3);(-2*v(2))-(3*v(3))] %formula T con vectores como columnas
A1 = [-1 0 0]
A2 = [0 1 0]
A3 = [0 0 -1]

TA = [T(A1), T(A2), T(A3)]
B = [1 1; 0 1]
B_TA = [B TA]
esc_BTA = rref(B_TA)
MA = esc_BTA(:,3:end)
rgT = rank(MA)
disp("R^3")
dimD = 3
disp("R^2")
dimCD = 2

clas_ma(rgT, dimD, dimCD)

disp("c)\n")
printf("T: M2 → P2 / T a b c d = (a + b)x2 + (b + d)x + (c + d)\n")
printf("Por isomorfismo M2 -> R^4 y P2 -> R^3\n")

T = @(v) [(v(1) + v(2));v(2) + v(4); v(3) + v(4)] % formula de T con vectores como columna
A1 = [1 1 1 0]
A2 = [1 0 1 0]
A3 = [0 0 1 0]
A4 = [0 1 1 1]

TA = [T(A1), T(A2), T(A3), T(A4)] % matriz de transformados del dom
B = [1 0 1;0 1 -1; 0 0 -1] % matriz de vec del cod
B_TA = [B TA] % armamos SEL simultaneo
esc_BTA = [B TA] %escalonamos
MA = esc_BTA(:,4:end)

rgT = rank(MA)
disp("R^4")
dimD = 4
disp("R^3")
dimCD = 3

clas_ma(rgT, dimD, dimCD)

u = [1;1;0;1] % [u]B
Tu = MA*u % [T(u)]B' 





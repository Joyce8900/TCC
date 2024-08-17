clc
clear
close all

load curvaL_vuvuzela.mat

plot(J2, J1, 'LineWidth', 2)

indice1 = 33;
indice2 = 100;
indice3 = 10;

x_ponto1 = J2(indice1);
y_ponto1 = J1(indice1);
x_ponto2 = J2(indice2);
y_ponto2 = J1(indice2);
x_ponto3 = J2(indice3);
y_ponto3 = J1(indice3);
hold on
plot(x_ponto1, y_ponto1, '*', 'LineWidth', 2)
plot(x_ponto2, y_ponto2, '*', 'LineWidth', 2)
plot(x_ponto3, y_ponto3, '*', 'LineWidth', 2)

texto_anotacao1 = '  Lambda = 0.35';
text(x_ponto1, y_ponto1, texto_anotacao1);
texto_anotacao2 = '  Lambda = 1';
text(x_ponto2, y_ponto2, texto_anotacao2);
texto_anotacao3 = '  Lambda = 0.10';
text(x_ponto3, y_ponto3, texto_anotacao3);

xlabel('||Dx||_1^1', 'FontSize', 14);
ylabel('||x - y||_2^2', 'FontSize', 14);



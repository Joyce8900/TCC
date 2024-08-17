%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total
clc
clear
close all

lambda = 0.01:0.01:5;
laplace = zeros(1, 100);
t = linspace(0, 4*pi, 100);% Vetor de tempo de 0 a 4*pi com 100 pontos
sinal_quadrado = 2 * (mod(t, 2*pi) < pi) - 1;
load laplaceRuido.mat

y=sinal_Laplace_Ruido;
Nit=100;

for i =1: length(lambda)
  [x(:,i),J] = denoiseTV(y,lambda(i),Nit);
  J1(i) = norm(x(:,i)'-y)^2;
  J2(i)=norm(diff(x(:,i)),1);
end

plot(J2,J1,'LineWidth', 2)

indice1 = 200; %
indice2 = 57; %
indice3 = 25; %
x_ponto1 = J2(indice1);
y_ponto1 = J1(indice1);
x_ponto2 = J2(indice2);
y_ponto2 = J1(indice2);
x_ponto3 = J2(indice3);
y_ponto3 = J1(indice3);
hold on
plot(x_ponto1, y_ponto1,'*','LineWidth', 2)
plot(x_ponto2, y_ponto2,'*','LineWidth', 2)
plot(x_ponto3, y_ponto3,'*','LineWidth', 2)

texto_anotacao1 = '  Lambda = 2.0';
texto_anotacao2 = '  Lambda = 0.57';
texto_anotacao3 = '  Lambda = 0.25';

text(x_ponto1, y_ponto1, texto_anotacao1);
text(x_ponto2, y_ponto2, texto_anotacao2);
text(x_ponto3, y_ponto3, texto_anotacao3);

xlabel('||Dx||_1^1', 'FontSize', 14); % Altera o label do eixo X
ylabel('||x - y||_2^2', 'FontSize', 14); % Altera o label do eixo Y

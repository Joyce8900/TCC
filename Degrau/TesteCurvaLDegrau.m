%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total
clc
clear
close all

lambda = 0.01:0.01:5;
degrau = zeros(1, 100);
degrau(50:end) = 1; % Sinal degrau
load degrauRuido.mat

y=sinal_Degrau_Ruido;
Nit=100;
for i =1: length(lambda)
  [x(:,i),J] = denoiseTV1(y,lambda(i),Nit);
  J1(i) = norm(x(:,i)'-y)^2;
  J2(i)=norm(diff(x(:,i)),1);
end

plot(J2,J1,'LineWidth', 2)

lambdaOtimo1 = lambda(100)
lambdaOtimo2 = lambda(57)
lambdaOtimo3 = lambda(25)

indice1 = 100; %
indice2 = 57; %
indice3 = 25; %

x1 = J2(indice1);
y1 = J1(indice1);
x2 = J2(indice2);
y2 = J1(indice2);
x3 = J2(indice3);
y3 = J1(indice3);

hold on
plot(x1, y1,'*','LineWidth', 2)
plot(x2, y2,'*','LineWidth', 2)
plot(x3, y3,'*','LineWidth', 2)
texto_anotacao1 = '  Lambda = 1';
texto_anotacao2 = '  Lambda = 0.57';
texto_anotacao3 = '  Lambda = 0.25';
text(x1, y1, texto_anotacao1);
text(x2, y2, texto_anotacao2);
text(x3, y3, texto_anotacao3);

xlabel('||Dx||_1^1', 'FontSize', 14); % Altera o label do eixo X
ylabel('||x - y||_2^2', 'FontSize', 14); % Altera o label do eixo Y





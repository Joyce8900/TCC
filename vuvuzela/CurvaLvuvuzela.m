%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total
clc
clear
close all
pkg load signal

[S, Fe] = audioread('vuvuzela.wav');

Sinal_vuvuzela = S(100000:end, 1).'; % "remove o início da amostra"
y = Sinal_vuvuzela;
lambda = 0.8;
Nit = 100;
lambda = 0.01:0.01:5;
for i =1: length(lambda)
  [x(:,i),J] = denoiseTV(y,lambda(i),Nit);
  J1(i) = norm(x(:,i)'-y)^2;
  J2(i)=norm(diff(x(:,i)),1);
end
plot(J2,J1,'LineWidth', 2)
lambdaOtimo = lambda(33)
indice = 33; %
x_ponto = J2(indice);
y_ponto = J1(indice);
hold on
plot(x_ponto, y_ponto,'*','LineWidth', 2)
texto_anotacao = '  Lambda = 0.35';
text(x_ponto, y_ponto, texto_anotacao);
title('Curva L da função Degrau', 'FontSize', 14); % Aumenta o tamanho do título
xlabel('||Dx||_1^1', 'FontSize', 14); % Altera o label do eixo X
ylabel('||x - y||_2^2', 'FontSize', 14); % Altera o label do eixo Y





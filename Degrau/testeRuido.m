%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%%Tema: Remoção de Ruído em Sinais Unidimensionais usando o Algoritmo de Variação Total de Filtragem Iterativo.

clc
clear
close all

degrau = zeros(1, 100);
degrau(50:end) = 1; % Sinal degrau
ruido_gaussiano = 0.2 * randn(size(degrau)); % Ruído gaussiano com média 0 e desvio padrão 0.2
sinal_Degrau_Ruido= degrau + ruido_gaussiano; % Adicionando o ruído ao sinal
plot(degrau);
hold on;
plot(sinal_Degrau_Ruido);
title('Sinal de Degrau com Ruído Gaussiano');
xlabel('Amostras');
ylabel('Amplitude');
legend('Sinal Original', 'Sinal com Ruído');

save  degrauRuido.mat sinal_Degrau_Ruido

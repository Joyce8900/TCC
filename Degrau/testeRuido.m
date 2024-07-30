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

xlabel('Samples');
ylabel('Amplitude');
legend('Original Signal', 'Signal with Noise');

save  degrauRuido.mat sinal_Degrau_Ruido

%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total

clc
clear
degrau = zeros(1, 100);
degrau(50:end) = 1; % Sinal degrau
load degrauRuido.mat

y=sinal_Degrau_Ruido;
lambda=0.9;
Nit=100;

[x,J] = denoiseTV(y,lambda,Nit);

plot(x, 'LineWidth', 2); % Aumenta o tamanho da linha da função
hold on;
plot(degrau, 'LineWidth', 2); % Aumenta o tamanho da linha da função
title('Resultado da remoção de ruído da função degrau', 'FontSize', 14); % Aumenta o tamanho do título
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal Original', 'Sinal com Ruído Suprimido', 'FontSize', 12); % Aumenta o tamanho da legenda


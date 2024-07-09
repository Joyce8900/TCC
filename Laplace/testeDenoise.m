%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total

clc
clear
close all
% Função para gerar uma onda quadrada
t = linspace(0, 4*pi, 100);% Vetor de tempo de 0 a 4*pi com 100 pontos
sinal_quadrado = 2 * (mod(t, 2*pi) < pi) - 1;% Sinal de onda quadrada
load laplaceRuido.mat
y= sinal_Laplace_Ruido;
lambda=0.57;
Nit=100;
[x,J] = denoiseTV(y,lambda,Nit);
plot(x, 'LineWidth', 2); % Aumenta o tamanho da linha da função

hold on;

plot(sinal_quadrado, 'LineWidth', 2); % Aumenta o tamanho da linha da função
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend( 'Sinal com Ruído Suprimido','Sinal Original', 'FontSize', 12); % Aumenta o tamanho da legenda
hold off
figure(2)
plot(sinal_Laplace_Ruido, 'LineWidth', 2)
hold on;
plot(x, 'LineWidth', 2); % Grafico da função com ruido

xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend( 'Sinal com Ruído','Sinal Original', 'FontSize', 12); %

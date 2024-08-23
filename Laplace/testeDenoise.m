%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total

clc
clear
close all
% Função para gerar uma onda quadrada
t = linspace(0, 4*pi, 100); % Vetor de tempo de 0 a 4*pi com 100 pontos
sinal_quadrado = 2 * (mod(t, 2*pi) < pi) - 1; % Sinal de onda quadrada

% Carregando o sinal com ruído
load laplaceRuido.mat
y = sinal_Laplace_Ruido;

% Parâmetros de entrada
lambda = 0.25;
Nit = 100;

% Remoção de ruído
[x, J] = denoiseTV(y, lambda, Nit);

% Plotando o sinal original e o sinal com ruído removido
figure(1)
plot(t, sinal_quadrado, 'LineWidth', 2); % Aumenta o tamanho da linha da função
hold on;
plot(t, x, 'LineWidth', 2); % Aumenta o tamanho da linha da função
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal Original', 'Sinal com Ruído Removido', 'FontSize', 10); % Corrigido a ordem da legenda
hold off

% Plotando o sinal com ruído e o sinal com ruído removido
figure(2)
plot(t, y, 'LineWidth', 2) % Gráfico do sinal com ruído
hold on;
plot(t, sinal_quadrado, 'LineWidth', 2); % Gráfico do sinal com ruído
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal com Ruído', 'Sinal sem Ruido', 'FontSize', 12); % Corrigido a ordem da legenda
hold off


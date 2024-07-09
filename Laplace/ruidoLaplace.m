%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total
clc
clear
close all

t = linspace(0, 4*pi, 100);% Vetor de tempo de 0 a 4*pi com 100 pontos
sinal_quadrado = 2 * (mod(t, 2*pi) < pi) - 1;% Sinal de onda quadrada
ruido_gaussiano = 0.2 * randn(size(sinal_quadrado)); % Ruído gaussiano com média 0 e desvio padrão 0.2
sinal_Laplace_Ruido= sinal_quadrado + ruido_gaussiano; % Adicionando o ruído ao sinal
plot(sinal_quadrado);
hold on;
plot(sinal_Laplace_Ruido);
%title('Sinal de Laplace com Ruído Gaussiano');
xlabel('Amostras');
ylabel('Amplitude');
legend('Sinal Original', 'Sinal com Ruído');

save  laplaceRuido.mat sinal_Laplace_Ruido




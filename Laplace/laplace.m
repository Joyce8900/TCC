clc;
clear;
close all;

% Função para gerar uma onda quadrada
function y = square_wave(t)
    y = 2 * (mod(t, 2*pi) < pi) - 1;
end

t = linspace(0, 4*pi, 100); % Vetor de tempo de 0 a 4*pi com 100 pontos
sinal_quadrado = square_wave(t); % Sinal de onda quadrada

% Gerando ruído gaussiano
ruido_gaussiano = 0.3 * randn(size(t)); % Ruído gaussiano com média 0 e desvio padrão 0.3

% Transformando o ruído gaussiano em ruído de Laplace
ruido_laplace = log(1 + 0.3 * abs(ruido_gaussiano)) .* sign(ruido_gaussiano);

sinal_com_ruido_laplace = sinal_quadrado + ruido_laplace; % Adicionando o ruído ao sinal
plot(t, sinal_quadrado);
hold on;
plot(t, sinal_com_ruido_laplace);
title('Sinal de Onda Quadrada com Ruído de Laplace');
xlabel('Tempo');
ylabel('Amplitude');
legend('Sinal Original', 'Sinal com Ruído');

save laplaceRuido.mat sinal_com_ruido_laplace


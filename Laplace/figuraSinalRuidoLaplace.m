%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total

clc
clear

% Função para gerar uma onda quadrada
t = linspace(0, 4*pi, 100);% Vetor de tempo de 0 a 4*pi com 100 pontos
sinal_quadrado = 2 * (mod(t, 2*pi) < pi) - 1;% Sinal de onda quadrada





load laplaceRuido.mat
y= sinal_com_ruido_laplace;




plot(sinal_quadrado, 'LineWidth', 2); % Aumenta o tamanho da linha da função
hold on;
plot(y, 'LineWidth', 2); % Aumenta o tamanho da linha da função


%title('Sinal Original e Sinal com Ruído', 'FontSize', 14); % Aumenta o tamanho do título
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal Original', 'Sinal com Ruído', 'FontSize', 12); % Aumenta o tamanho da legenda
print('graficoLaplace', '-dpng'); % Salva como PNG


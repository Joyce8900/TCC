%Aluno: Joyce Oliveira dos Santos
%Matricula: 20210046341
%Curso: Sistemas de Informação
%Orientador: Dr. Márcio Barboza
%Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total
clear
pkg load signal

[S, Fe] = audioread('vuvuzela.wav');

Sinal_vuvuzela=S(100000:end,1).'; % "remove o início da amostra"

y=Sinal_vuvuzela;
lambda=0.35;
Nit=100;

[x,J] = denoiseTV(y,lambda,Nit);
%x = y(1:5*Fe);
sound(y, Fe); % Audio com vuvuzela
% Reproduza o áudio
sound(x, Fe); Audio sem vuvuzela

%plot(x, 'LineWidth', 2); % Aumenta o tamanho da linha da função
plot(y, 'LineWidth', 2); % Aumenta o tamanho da linha da função
%title('Resultado da remoção de ruído da função degrau', 'FontSize', 14); % Aumenta o tamanho do título
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal Original com ruido', 'FontSize', 12); % Aumenta o tamanho da legenda
figure(2)
plot(x, 'LineWidth', 2); % Aumenta o tamanho da linha da função

xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal com Ruído Suprimido', 'FontSize', 12); % Aumenta o tamanho da legenda


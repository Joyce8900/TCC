clear
clc
pkg load signal

[S, Fe] = audioread('vuvuzela.wav');

Sinal_vuvuzela = S(100000:end, 1).'; % "remove o início da amostra"

y = Sinal_vuvuzela;
lambda = 1;
Nit = 100;

[x, J] = denoiseTV(y, lambda, Nit);

% Reproduza o áudio

sound(y, Fe); % som original
sound(x, Fe); % som sem ruido

% Selecione as amostras que você deseja plotar
x1 = x(1:5*Fe);
y1 = y(1:5*Fe);

% Crie um vetor de tempo para o eixo x
t = (0:length(x1)-1) / Fe;
t_offset = (0:length(y1)-1) / Fe + 5; % Adiciona um deslocamento de 5 segundos para y

figure;
plot(t, x1, 'LineWidth', 1); % Plota x
hold on;
plot(t_offset, y1, 'LineWidth', 1); % Plota y com um deslocamento no eixo x
hold off;

xlabel('Time (s)');
ylabel('Amplitude');
legend('Signal without vuvuzela', 'Signal with vuvuzela', 'FontSize', 12);
%title('Gráfico de x e y sem sobreposição');
audiowrite('vuvuzela1.wav', x, Fe);

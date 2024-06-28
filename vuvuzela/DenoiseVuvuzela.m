clear
pkg load signal

[S, Fe] = audioread('vuvuzela.wav');

Sinal_vuvuzela=S(100000:end,1).'; % "remove o início da amostra"

y=Sinal_vuvuzela;
lambda=0.35;
Nit=100;

[x,J] = denoiseTV(y,lambda,Nit);



%x = y(1:5*Fe);

% Reproduza o áudio
%sound(x, Fe);

sound(y, Fe);

%plot(x, 'LineWidth', 2); % Aumenta o tamanho da linha da função
plot(y, 'LineWidth', 2); % Aumenta o tamanho da linha da função
%title('Resultado da remoção de ruído da função degrau', 'FontSize', 14); % Aumenta o tamanho do título
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal Original com ruido', 'FontSize', 12); % Aumenta o tamanho da legenda


figure(2)

plot(x, 'LineWidth', 2); % Aumenta o tamanho da linha da função
%plot(y, 'LineWidth', 2); % Aumenta o tamanho da linha da função
%title('Resultado da remoção de ruído da função degrau', 'FontSize', 14); % Aumenta o tamanho do título
xlabel('Amostras', 'FontSize', 14); % Aumenta o tamanho do label do eixo x
ylabel('Amplitude', 'FontSize', 14); % Aumenta o tamanho do label do eixo y
legend('Sinal com Ruído Suprimido', 'FontSize', 12); % Aumenta o tamanho da legenda






%plot(y(:,2))

%figure(2)
%plot(y(:,1))

clc
clear

load degrauRuido.mat

y=sinal_Degrau_Ruido;
lambda=0.9;
Nit=100;

[x,J] = denoiseTV(y,lambda,Nit);

plot(x);
title('Sinal de Degrau com Ruído Gaussiano');
xlabel('Amostras');
ylabel('Amplitude');
legend('Sinal Original', 'Sinal com Ruído');

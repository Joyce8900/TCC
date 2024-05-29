//Aluno: Joyce Oliveira dos Santos
//Matricula: 20210046341
//Curso: Sistemas de Informação
//Orientador: Dr. Márcio Barboza 
//Tema: Remoção de ruídos em sinais unidimensionais usando Variação Total

clc
clear

load laplaceRuido.mat
y= sinal_com_ruido_laplace;
lambda=0.9;
Nit=100;

[x,J] = denoiseTV(y,lambda,Nit);

plot(x);
title('Sinal de Laplace com Ruído Gaussiano');
xlabel('Amostras');
ylabel('Amplitude');
legend('Sinal Original', 'Sinal com Ruído');

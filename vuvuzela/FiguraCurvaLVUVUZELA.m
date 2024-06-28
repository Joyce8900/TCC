clc
clear
close all


load curvaL_vuvuzela.mat

plot(J2,J1,'LineWidth', 2)

lambdaOtimo = lambda(33)

indice = 33; %
x_ponto = J2(indice);
y_ponto = J1(indice);
hold on
plot(x_ponto, y_ponto,'*','LineWidth', 2)

texto_anotacao = '  Lambda = 0.35';
text(x_ponto, y_ponto, texto_anotacao);


%title('Curva L da função Degrau', 'FontSize', 14); % Aumenta o tamanho do título

xlabel('||Dx||_1^1', 'FontSize', 14);
ylabel('||x - y||_2^2', 'FontSize', 14); %




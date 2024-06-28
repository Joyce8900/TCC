clc
clear

close all

lambda = 0.01:0.01:5;
degrau = zeros(1, 100);
degrau(50:end) = 1; % Sinal degrau
load degrauRuido.mat

y=sinal_Degrau_Ruido;
Nit=100;


for i =1: length(lambda)
  [x(:,i),J] = denoiseTV1(y,lambda(i),Nit);
  J1(i) = norm(x(:,i)'-y)^2;
  J2(i)=norm(diff(x(:,i)),1);
end

plot(J2,J1,'LineWidth', 2)

lambdaOtimo = lambda(90)

indice = 90; %
x_ponto = J2(indice);
y_ponto = J1(indice);
hold on
plot(x_ponto, y_ponto,'*','LineWidth', 2)

texto_anotacao = '  Lambda = 0.90';
text(x_ponto, y_ponto, texto_anotacao);


%title('Curva L da função Degrau', 'FontSize', 14); % Aumenta o tamanho do título

xlabel('||Dx||_1^1', 'FontSize', 14); % Altera o label do eixo X
ylabel('||x - y||_2^2', 'FontSize', 14); % Altera o label do eixo Y





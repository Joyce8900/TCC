clc
clear

lambda = 0.01:0.01:5;
degrau = zeros(1, 100);
degrau(50:end) = 1; % Sinal degrau
load degrauRuido.mat

y=sinal_Degrau_Ruido;
Nit=100;
for i =1:length(lambda)
  [x(:,i),J] = denoiseTV(y,lambda(i),Nit);
end
%k=10;
%J1=sum(abs(x(:,2)-y)^2)
%J1 = norm(x(:,2)-y)^2
%J2 =sum(abs(diff(x(:,2))))
for k = 1:length(degrau)
  J1(k) = norm(x(:,k)'-y)^2;
  J2(k)=norm(diff(x(:,k)),1);
end
plot(J1,J2)
I = find(J1>3.8 & J1<3.9)
lambdaOtimo = lambda(I(7))

indice = 90; % Índice do ponto onde você deseja adicionar a anotação
x_ponto = x(indice);
y_ponto = y(indice);
texto_anotacao = 'Lambda = 0.91';
text(x_ponto, y_ponto, texto_anotacao);

%hold on
%plot(J1(I(7)),J2(I(7)),'*')
%lambdaJoyce = lambda(78)

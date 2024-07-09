function [x,J] = denoiseTV(y,lambda,Nit)
% [x,J] = denoiseTV(y,lambda,a,Nit)
% Filtragem de variação total (remoção de ruído) usando
% algoritmo de corte iterativo.
% ENTRADA
% y - sinal ruidoso (vetor linha)
% lambda - parâmetro de regularização
% Nit - número de iterações
% SAÍDA
% x - resultado da remoção de ruído
% J - função objetivo
J = zeros(1,Nit); % função objetivo
N = length(y);
z = zeros(1,N-1); % inicializa z
alpha = 4;
T = lambda/2;
for k = 1:Nit
x = y - [-z(1) -diff(z) z(end)]; % y - D’ z
J(k) = sum(abs(x-y).^2) + lambda * sum(abs(diff(x)));
z = z + 1/alpha * diff(x); % z + 1/alpha D z
z = max(min(z,T),-T); % clip(z,T)
end

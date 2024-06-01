function [x,J] = denoiseTV1(y,lambda,Nit)
% [x,J] = denoiseTV(y,lambda,a,Nit)
% Total variation filtering (denoising) using
% iterative clipping algorithm.
% INPUT
% y - noisy signal (row vector)
% lambda - regularization parameter
% Nit - number of iterations
% OUTPUT
% x - result of denoising
% J - objective function
J = zeros(1,Nit); % objective function
N = length(y);
z = zeros(1,N-1); % initialize z
alpha = 4;
T = lambda/2;
for k = 1:Nit
x = y - [-z(1) -diff(z) z(end)]; % y - D’ z
J(k) = norm(x-y).^2 + lambda * norm(diff(x),1);
z = z + 1/alpha * diff(x); % z + 1/alpha D z
z = max(min(z,T),-T); % clip(z,T)
end

% Vuvuzela Cancelation Program ---
clc
clear

% Vuvuzela Cancelation Program ---

fprintf('--- Vuvuzela Cancelation Program ---\n\n');

% Step 1/5: Load audioCortado.wav
fprintf('-> Step 1/5: Load audioCortado.wav:');
[y, Fe] = audioread('audioCortado.wav'); % Change from wavread to audioread
x = y(100000:end, 1).';  % Remove the beginning of the sample
Nx = length(x);

% Algorithm parameters
apriori_SNR = 1;  % Select 0 for a posteriori SNR estimation and 1 for apriori (see [2])
alpha = 0.05;     % Only used if apriori_SNR = 1
beta1 = 0.5;
beta2 = 1;
lambda = 3;

% STFT parameters
NFFT = 1024;
window_length = round(0.031 * Fe);
window = hamming(window_length);
window = window(:);
overlap = floor(0.45 * window_length); % Number of window samples without overlapping

% Signal parameters
t_min = 0.4;   % Interval for learning the noise
t_max = 1.00;  % Spectrum (in second)

% Construct STFT manually
fprintf('-> Step 2/5: Compute STFT -');
step = window_length - overlap;
num_frames = 1 + floor((Nx - window_length) / step);
S = zeros(NFFT, num_frames);
T = (0:(num_frames-1)) * step / Fe;
for i = 1:num_frames
    frame = x((i-1)*step + (1:window_length)) .* window;
    S(:, i) = fft(frame, NFFT);
end
F = (0:(NFFT-1)) * Fe / NFFT;
[Nf, Nw] = size(S);
fprintf(' OK\n');

%----------------------------%
%        Noisy spectrum      %
%          extraction        %
%----------------------------%
fprintf('-> Step 3/5: Extract noise spectrum -');
t_index = find(T > t_min & T < t_max);
absS_vuvuzela = abs(S(:, t_index)).^2;
vuvuzela_spectrum = mean(absS_vuvuzela, 2); % Average spectrum of the vuvuzela (assumed to be ergodic)
vuvuzela_specgram = repmat(vuvuzela_spectrum, 1, Nw);
fprintf(' OK\n');

%---------------------------%
%       Estimate SNR        %
%---------------------------%
fprintf('-> Step 4/5: Estimate SNR -');
absS = abs(S).^2;
SNR_est = max((absS ./ vuvuzela_specgram) - 1, 0); % A posteriori SNR
if apriori_SNR == 1
    SNR_est = filter((1 - alpha), [1 -alpha], SNR_est);  % A priori SNR: see [2]
end
fprintf(' OK\n');

%---------------------------%
%  Compute attenuation map  %
%---------------------------%
fprintf('-> Step 5/5: Compute TF attenuation map -');
an_lk = max((1 - lambda * ((1 ./ (SNR_est + 1)).^beta1)).^beta2, 0);  % an_l_k or anelka, sorry stupid french joke :)
STFT = an_lk .* S;
fprintf(' OK\n');

%--------------------------%
%   Compute Inverse STFT   %
%--------------------------%
fprintf('-> Compute Inverse STFT:');
ind = mod((1:window_length) - 1, Nf) + 1;
output_signal = zeros((Nw - 1) * step + window_length, 1);
for indice = 1:Nw % Overlap-add technique
    left_index = ((indice - 1) * step);
    index = left_index + (1:window_length);
    temp_ifft = real(ifft(STFT(:, indice), NFFT));
    output_signal(index) = output_signal(index) + temp_ifft(ind) .* window;
end
fprintf(' OK\n');

%-----------------    Display Figure   ------------------------------------
% Show temporal signals
figure
subplot(2,1,1);
t_index = find(T > t_min & T < t_max);
plot((1:length(x)) / Fe, x);
xlabel('Time (s)');
ylabel('Amplitude');
hold on;
noise_interval = floor(T(t_index(1)) * Fe):floor(T(t_index(end)) * Fe);
plot(noise_interval / Fe, x(noise_interval), 'r');
hold off;
legend('Original signal', 'Vuvuzela Only');
title('Original Sound');

% Show denoised signal
subplot(2,1,2);
plot((1:length(output_signal)) / Fe, output_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sound without vuvuzela');

% Show spectrogram
t_epsilon = 0.001;
figure
S_one_sided = max(S(1:length(F)/2, :), t_epsilon); % Keep only the positive frequency
pcolor(T, F(1:end/2), 10*log10(abs(S_one_sided)));
shading interp;
colormap('hot');
title('Spectrogram: speech + Vuvuzela');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

figure
S_one_sided = max(STFT(1:length(F)/2, :), t_epsilon); % Keep only the positive frequency
pcolor(T, F(1:end/2), 10*log10(abs(S_one_sided)));
shading interp;
colormap('hot');
title('Spectrogram: speech only');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

%-----------------    Listen results   ------------------------------------
fprintf('\nPlay 5 seconds of the Original Sound:');
sound(x(1:5*Fe), Fe); % Change from wavplay to sound
fprintf(' OK\n');
fprintf('Play 5 seconds of the new Sound: ');
sound(output_signal(1:5*Fe), Fe); % Change from wavplay to sound
fprintf('OK\n');
fprintf('Write anti_vuvuzela.wav:');
audiowrite('anti_vuvuzela.wav', output_signal, Fe); % Change from wavwrite to audiowrite
fprintf('OK\n');



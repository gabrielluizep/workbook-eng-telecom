%%
clear all;
close all;
clc;

%% Transmissão
% 1) Símbolos binários
% 2) Modulação M-PSK ou M-QAM
% 3) Conversão Série-Paralelo 
%    Colocar os símbolos modulados nas subportadoras
% 4) IFFT
% 5) Adiciona Prefixo Cíclico
% 6) Transmitir pelo canal

%% Recepção
%  7) Remove Prefixo Cíclico
%  8) FFT
%  9) Conversão Paralelo-Série
% 10) Demodula M-PSK ou M-QAM
% 11) Estima a taxa de erro de bit (BER)

%% Parâmetros
n_ofdm = 64;
n_cp = 16;
n_seq = 10000; 
n_symbols = n_seq * n_ofdm;
M_psk = 2;
SNR = 0:30;

%%
s = randi([0 1], 1, n_symbols);

% Moduladação
s_mod = pskmod(s, M_psk);

% Conversão Série-Paralelo
s_paralel = reshape(s_mod, n_ofdm, n_seq);

s_ifft = ifft(s_paralel);

s_ofdm = [s_ifft(end - n_cp + 1:end,:); s_ifft];

tx = reshape(s_ofdm, 1, n_seq * (n_ofdm + n_cp));

ratio = zeros(length(SNR));
for i = 1:length(SNR)
    %% Canal
    y_channel = awgn(tx, SNR(i));

    %% Receptor
    rx = reshape(y_channel, n_ofdm + n_cp, n_seq);

    rx_ofdm = rx(n_cp + 1:n_ofdm + n_cp, :);

    rx_fft = fft(rx_ofdm);

    rx_sequential = reshape(rx_fft, 1, n_symbols);

    s_hat = pskdemod(rx_sequential, M_psk);
    [errors, ratio(i)] = biterr(s, s_hat);
end

semilogy(SNR, ratio);
grid on;
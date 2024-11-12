%%
clear all;
close all;
clc;

%% Parâmetros
n_bits = 1000000;
M_psk = 2;
Rs = 10e3;
Ts = 1/Rs;
fd = 40;

%% Transmissão e recepção
s = randi(1, 1, n_bits);
s_mod = pskmod(s, M_psk);

ch1 = rayleighchan(Ts, fd);
ch2 = rayleighchan(Ts, fd);
ch3 = rayleighchan(Ts, fd);
ch4 = rayleighchan(Ts, fd);

ch1.StoreHistory = 1;
ch2.StoreHistory = 1;
ch3.StoreHistory = 1;
ch4.StoreHistory = 1;

s_ch1 = filter(ch1, s_mod);
h1 = transpose(ch1.PathGains);

s_ch2 = filter(ch2, s_mod);
h2 = transpose(ch2.PathGains);

s_ch3 = filter(ch3, s_mod);
h3 = transpose(ch3.PathGains);

s_ch4 = filter(ch4, s_mod);
h4 = transpose(ch4.PathGains);

SNRs = [0:25];
for SNR = 0:25
    %% SISO
    s_ch1_noisy= awgn(s_ch1, SNR,'measured');
    s_ch1_eq = s_ch1_noisy./h1;
    s_siso_demod = pskdemod(s_ch1_eq, M_psk);
    [n_err_siso(SNR+1), ber_siso(SNR+1)] = symerr(s, s_siso_demod);
        
    %% MRC 1x2
    s_ch1_noisy= awgn(s_ch1, SNR - 3,'measured');
    s_ch2_noisy= awgn(s_ch2, SNR - 3,'measured');
    
    y1 = s_ch1_noisy .* conj(h1);
    y2 = s_ch2_noisy .* conj(h2);
    
    s_mrc_1x2_eq = y1 + y2;
    s_mrc_1x2_demod = pskdemod(s_mrc_1x2_eq, M_psk);
    [n_err_mrc_1x2(SNR+1), ber_mrc_1x2(SNR+1)] = symerr(s, s_mrc_1x2_demod);
   
    
    %% MRC 1x4
    s_ch1_noisy= awgn(s_ch1, SNR - 6,'measured');
    s_ch2_noisy= awgn(s_ch2, SNR - 6,'measured');
    s_ch3_noisy= awgn(s_ch3, SNR - 6,'measured');
    s_ch4_noisy= awgn(s_ch4, SNR - 6,'measured');
    
    y1 = s_ch1_noisy .* conj(h1);
    y2 = s_ch2_noisy .* conj(h2);
    y3 = s_ch3_noisy .* conj(h3);
    y4 = s_ch4_noisy .* conj(h4);
    
    s_mrc_1x4_eq = y1 + y2 + y3 + y4;
    s_mrc_1x4_demod = pskdemod(s_mrc_1x4_eq, M_psk);
    [n_err_mrc_1x4(SNR+1), ber_mrc_1x4(SNR+1)] = symerr(s, s_mrc_1x4_demod);
    
    %% AWGN
    s_awgn = awgn(s_mod, SNR, 'measured');
    s_demod_awgn = pskdemod(s_awgn, M_psk);
    [n_err_awgn(SNR+1), ber_awgn(SNR+1)] = symerr(s, s_demod_awgn);
end

%% Plots
semilogy(SNRs, ber_siso);
hold on; grid on;
semilogy(SNRs, ber_awgn);
semilogy(SNRs, ber_mrc_1x2);
semilogy(SNRs, ber_mrc_1x4);

xlabel('SNR (dB)');
ylabel('BER');
legend('SISO', 'AWGN', 'MRC 1x2', 'MRC 1x4');
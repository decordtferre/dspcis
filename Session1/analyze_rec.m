% Plays and records signals, which are subsequently analyzed by looking at
% the spectrograms, and the power spectral densities.

%% Cleanup
clear; close all;

%% Initialize script parameters
% These global parameters are used as arguments in the function calls
% below.
fs = ; % Sampling frequency [Hz]
N = ; % Discrete Fourier Transform (DFT) size [Samples] 
% Overlap length between subsequent frames in the
% short-time-Fourier-transform (STFT) used to plot the spectrogra [samples]
Noverlap = ; 

%% Construct signals
sig = ; 

%% Play and record.
% Call to initparams()
[] = initparams();
% Call to recplay.mdl to play simin and record simout
sim('recplay');
% Retrieve recorded output
out=simout.signals.values(:,1);

%% Compute and plot the spectrogram
% Input signal
figure; subplot(2,1,1)
spectrogram()
title('Input signal.')

% Output signal
subplot(2,1,2)
spectrogram()
title('Output signal.')

%% Select input and output signals to compute PSD
% Ideally the output signal should be trimmed such that only periods where
% the signal is active are considered as the PSD assumes stationarity. 
% Else, the PSD will be biased due to the inclusion of silence.
in = ;
out = ;

%% Compute and plot the power spectral density (PSD)...
% ...Using Welch's method 
PSD = pwelch();

% Plot results
figure;
% Input signal
figure; subplot(2,1)
plot(,pow2db());
xlabel('Frequency (kHz)');
ylabel('Power/frequency (dB/Hz)')
title('Input signal.')
% Output signal
subplot(2,2)
plot(,pow2db());
xlabel('Frequency (kHz)');
ylabel('Power/frequency (dB/Hz)')
title('Output signal.')
sgtitle('Power Spectral Density estimate')
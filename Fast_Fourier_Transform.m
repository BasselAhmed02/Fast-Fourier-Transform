% FFT Application in MATLAB

% Define the sample rate and duration
Fs = 1000;           % Sampling frequency (samples per second)
T = 1 / Fs;          % Sampling period (seconds per sample)
L = 1000;            % Length of signal (number of samples)
t = (0:L-1) * T;     % Time vector

% Generate a sample signal: a sum of 50 Hz and 120 Hz sinusoids
signal = 0.7 * sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t);

% Compute the FFT
Y = fft(signal);

% Calculate the two-sided spectrum
P2 = abs(Y / L);
P1 = P2(1:L/2+1);      % Single-sided spectrum
P1(2:end-1) = 2 * P1(2:end-1);  % Scale the amplitude

% Define the frequency domain for plotting
f = Fs * (0:(L/2)) / L;

% Plot the time-domain signal
figure;
subplot(2, 1, 1);
plot(t, signal);
title('Time-Domain Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Plot the frequency-domain signal
subplot(2, 1, 2);
plot(f, P1);
title('Single-Sided Amplitude Spectrum of the Signal');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');

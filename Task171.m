%% task 171
clear;
clc;

% Create Signal
a = dtmfdial(['1','2','3','4', '5', '6', '7', '8', '9', '0']);

% Play tone generated
sound(a);

% Plot waveform and spectrograph
plot(a);
spectrogram(a,hamming(126), 0, 256);

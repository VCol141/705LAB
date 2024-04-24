%% task 182
clear;
clc;

% Initialise variables
fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

% Dial tones
a = dtmfdial(['1','2','3','4', '5', '6', '7', '8', '9', '0']);

% Cut up signal
[nstart,nstop] = dtmfcut(a,fs);

k = 1;

% get bpf signals
[bb, H, W] = dtmfdesign(fcent, L, fs);

% get the frequencies of the dial tones
for i = 1:size(nstart, 2)

    freq_section = a(nstart(i):nstop(i));
    sc = dtmfscore(freq_section, bb);

    freq_components(:,i) = nonzeros(sc .* fcent);
end
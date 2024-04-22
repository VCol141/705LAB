clear;
clc;

fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

a = dtmfdial(['1','2','3','4', '5', '6', '7', '8', '9', '0']);

[nstart,nstop] = dtmfcut(a,fs);

k = 1;

[bb, H, W] = dtmfdesign(fcent, L, fs);

for i = 1:size(nstart, 2)

    freq_section = a(nstart(i):nstop(i));
    sc = dtmfscore(freq_section, bb);

    freq_components(:,i) = nonzeros(sc .* fcent);
end



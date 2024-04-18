clear;
clc;

fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

a = dtmfdial(['1','2','3','4', '5', '6', '7', '8', '9', '0']);

[nstart,nstop] = dtmfcut(a,fs);

freq_components = zeros(8, size(nstart, 2));

k = 1;

[hh, ww, bb] = dtmfdesign(fcent, L, fs);

for i = 1:size(nstart, 2)

    freq_section = a(nstart(i):nstop(i));
    sc = dtmfscore(freq_section, bb);


    for j = 1:size(fcent,1)

        if (sc(j))

            freq_components(j, i) = fcent(j);
        end
    end
end





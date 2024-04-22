clear;
clc;

fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];

for L = 80:100
    l = findMinval(L, fs, fcent);

    if l
        disp(L)
        break;
    end
end

close;

findMinval(L, fs, fcent);

%% Basic Filter Test
clear;
clc;

L = 80;
fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];

[bb, H, W] = dtmfdesign(fcent, L, fs);


%% Functions



function l = findMinval(L, fs, fcent)
% System parameters

% gets the responce
[bb, H, W] = dtmfdesign(fcent, L, fs);
l = 1;

for j = 1:(size(fcent, 1) - 1)
    index = find(abs(H(:,j)) >= 0.25);
    start = W(max(index),j);

    if (start > ((fcent(j + 1) / fs) * 2 * pi))
        l = 0;
        break;
    end
end
end
clear;
clc;

for L = 80:100
    l = findMinval(L);

    if l
        disp(L)
        break;
    end
end

close;

findMinval(L);



function l = findMinval(L)
% System parameters
fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];

% gets the responce
[bb, H, W] = dtmfdesign(fcent, (L), 8000);

i = 2;
l = 1;

for j = 1:size(fcent, 1)
    index = find(abs(H(:,j)) >= 0.25);
    start = W(max(index),j);

    if (start > ((fcent(i) / fs) * 2 * pi))
        l = 0;
        break;
    end

    i = i + 1;
end
end
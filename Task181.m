clear;
clc;

for L = 86:100
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
[bb] = dtmfdesign(fcent, L, 8000);

for i = 1:size(fcent, 1)
    [H_i, W_i] = freqz(bb(:,i), 1, fs);

    waosdoaksd = find(abs(H_i) > 0.25);
    result = waosdoaksd(size(waosdoaksd,1)) + 1;

    W_f = W_i .* (fs / (2 * pi));

    meg(i) = W_i(result) * (fs / (2 * pi()));
end

l = 1;

for i = 1:(size(meg, 2) - 1)

    if (meg(i) > (fcent(i + 1)))
        l = 0;
        break;
    end

end


end
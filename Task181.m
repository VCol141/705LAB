clear;
clc;

for L = 0:100
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
[hh, ww, bb] = dtmfdesign(fcent, L, fs);

x = linspace(0, pi, fs);

plot(x, hh);



% Find range that is above 1/sqrt(2)
for i = 1:size(fcent,1)
    waosdoaksd = find(abs(hh(:,i)) > (1/4));
    num_rows = size(waosdoaksd,1);
    result(1,i) = waosdoaksd(i);
    result(2,i) = waosdoaksd(num_rows);
end

% Get the first and last Normalised Frequency
lOmeg(:) = ww(result(1,:));
hOmeg(:) = ww(result(2,:));

lcf = lOmeg * (fs / (2*pi));
hcf = hOmeg * (fs / (2*pi));

bpw = hcf - lcf;

l = 1;

hOww = ww(result(2,:)) .* (fs / (2 * pi()));

for i = 1:(size(result, 2) - 1)

    if (hOww(i) > (fcent(i + 1)))
        l = 0;
        break;
    end

end


end
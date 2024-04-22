clear;
clc;

fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

% b = load('unknown_number_22.mat');
% a = b.xx;
% 
% a = dtmfdial(['1','2','3','4', '5', '6', '7', '8', '9', '0', '*', '#', 'A', 'B', 'C', 'D']);

number = '01205978436';
a = dtmfdial(number, 7);
keys = dtmfrun(a,L,fs)

%% Testing Accuracy


k = 50;
f = 0;

sum = 0;

for i = 1:k
    a = dtmfdial(number, 7);

    %a = bandpass(a, [697 1633], fs);

    keys = dtmfrun(a,L,fs);

    for j = 1:size(keys,2)
        if keys(j) == number(j)
            sum = sum + 1;
        end

        f = f + 1;
    end

end

sum / f
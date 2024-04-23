clear;
clc;

fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

number = '01205978436*';

k = 500;
f = 0;

sum = 0;

for i = 1:k
    a = dtmfdial(number, 8);

    keys = dtmfrun(a,L,fs);

    for j = 1:size(keys,2)
        if keys(j) == number(j)
            sum = sum + 1;
        end

        f = f + 1;
    end

end

disp(sum / f);
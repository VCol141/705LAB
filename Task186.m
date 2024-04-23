clear;
clc;

fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];
number = '01205978436';


k = 500;
f = 0;

sum = 0;

for i = 1:k
    a = dtmfdial(number, -4);

    a = bandpass(a, [697 1633], fs);

    a1 = a * (1 / max(abs(a)));

    for n = 1:size(a,2)
        if abs(a1(n)) < 0.2
            a(n) = 0;
        end
    end

    a = bandpass(a, [697 1633], fs);

    keys = dtmfrun(a,L,fs);

    s1 = size(keys,2);
    s2 = size(number,2);

    if s1 > s2
        s3 = s2;
    else
        s3 = s1;
    end

    for j = 1:s3
        if keys(j) == number(j)
            sum = sum + 1;
        end

        f = f + 1;
    end

end

disp(sum / f);
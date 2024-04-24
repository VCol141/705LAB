%% task 185
clear;
clc;

%initialise vars
fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

%arbitrary number
number = '01205978436*';

%initialise trial no.
k = 500;
f = 0;

sum = 0;

% loop for number of trials
for i = 1:k
    a = dtmfdial(number, 8);

    %get the keys
    keys = dtmfrun(a,L,fs);

    %for the keys that were returned, compare them to the arbitrary number
    for j = 1:size(keys,2)
        if keys(j) == number(j)
            %If matching, increment sum
            sum = sum + 1;
        end
        % Increment total number of trials done
        f = f + 1;
    end

end

%calculate percentage success
disp(sum / f);
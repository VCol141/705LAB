%%% Task 181

%% task 5
clear;
clc;

%initialise variables
fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];

%loop until min L is found
for L = 80:100
    l = findMinval(L, fs, fcent);

    if l
        disp(L)
        break;
    end
end

%% Basic Filter Test Task 3 and 4
clear;
clc;

%initialise variables
L = 80;
fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];

%get signals
[bb, H, W] = dtmfdesign(fcent, L, fs);

%plot
t = linspace(0,pi,4096);
plot(t, abs(H))


%% Function for Task 5



function l = findMinval(L, fs, fcent)
% System parameters

% gets the responce
[bb, H, W] = dtmfdesign(fcent, L, fs);
l = 1;

%loop for all BPFs
for j = 1:(size(fcent, 1) - 1)
    %find start-stop bandi ndexes
    index = find(abs(H(:,j)) >= 0.25);
    start = W(max(index),j);

    %check if they overlap
    if (start > ((fcent(j + 1) / fs) * 2 * pi))
        l = 0;
        break;
    end
end
end
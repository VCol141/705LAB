%% task 183
clear;
clc;

%initialise variables
fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

%check if the keys returned is the same as number
number = '01205978436';
a = dtmfdial(number, 7);
keys = dtmfrun(a,L,fs);
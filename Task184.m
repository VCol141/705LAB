%% task 184
clear;
clc;

%initialise variables
fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

%get our groups dial tone
b = load('unknown_number_1.mat');
a = b.xx;

%get the keys pressed
keys = dtmfrun(a,L,fs)
clear;
clc;

fs = 8000;
L = 86;
fcent = [697;770;852;941;1209;1336;1477;1633];

b = load('unknown_number_7.mat');
a = b.xx;

keys = dtmfrun(a,L,fs)

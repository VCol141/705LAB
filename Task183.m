clear;
clc;

fs = 8000;
L = 87;
fcent = [697;770;852;941;1209;1336;1477;1633];

a = load('unknown_number_5.mat');

%a = dtmfdial(['1','2','3','4', '5', '6', '7', '8', '9', '0', '*', '#', 'A', 'B', 'C', 'D']);

keys = dtmfrun(a.xx,L,fs)
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
keys = dtmfrun(a,L,fs);
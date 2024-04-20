clear;
clc;


fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];

L = 80;

% gets the responce
[hh] = dtmfdesign(fcent, L, fs);



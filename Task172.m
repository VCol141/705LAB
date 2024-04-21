clear;
clc;

% Values for Filter
L = 50;
N = 4096;
a = 1
wn = a;
b = zeros(1,L);
omegaC = 0.2*pi;

% Calculating b with beta being zero
j = 1;
for i = 0:L
        b(j) = cos(omegaC * i)*wn;

        j = j + 1;
end

% Calc Frequency Responce
[H, W] = freqz(b, a, N);

% Find Beta that equals magnitude responce of 1 by dividing 1 by max
% magnitude
beta = 1 / max(abs(H));

% ReCalc Frequency Responce
[H, W] = freqz(beta.*b, a, N);

% Plot Responce
plot(abs(H));

% Find range that is above 1/sqrt(2)
result = find(abs(H) > (1/sqrt(2)));

% Get the first and last Normalised Frequency
ftOmeg = W(result(1));
ltOmeg = W(result(140));

ftf = ftOmeg * (N / (2*pi))
ltf = ltOmeg * (N / (2*pi))



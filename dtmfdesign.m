function  [H, W, hh] = dtmfdesign(fcent, L, fs)
%DTMFDESIGN
%     hh = dtmfdesign(fcent, L, fs)
%       returns a matrix where each column is the
%       impulse response of a BPF, one for each frequency
%  fcent = vector of center frequencies
%      L = length of FIR bandpass filters
%     fs = sampling freq  
%
% The BPFs must be scaled so that the maximum magnitude
% of the frequency response is equal to one.
%==========================================
% [697;770;852;941;1209;1336;1477;1633]; list of centre frequencies

%%%% add your lines below to complete the code

% Values for Filter
h = zeros(1,L);

for i = 1:size(fcent,1)
    omegaC = 2*pi*(fcent(i) / fs);

    % Calculating b with beta being one
    k = 1;

    for j = 0:L
        h(k) = cos(omegaC * j);
        k = k + 1;
    end

    t = linspace(0,L, k - 1);

    plot(t, h)

    % Calc Frequency Responce
    [H_1, W_1] = freqz(h, 1, fs);

    t = linspace(0,pi, fs);

    beta = 1 / max(abs(H_1));

    [H_1, W_1] = freqz(beta*h, 1, fs);

    plot (t, H_1)

    H(:,i) = abs(H_1);

    W(:, i) = abs(W_1);

    hh(:, i) = h;
end


end

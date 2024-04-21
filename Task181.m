clear;
clc;


fs = 8000;
fcent = [697;770;852;941;1209;1336;1477;1633];
xx = linspace(0, pi, fs);
 
L = 80;
[ww, hh, bb] = dtmfdesign_updated(fcent, L, fs);

% for L = 1:100
% 
%     % gets the impulse response
%     [w, h, bb] = dtmfdesign_updated(fcent, L, fs);
% 
%     %find the index of the stopband
%     for i = 1:size(fcent)
%         index = find(abs(h(:,i)) > (1/4));
%         num_rows = size(index, 1);
%         result(1,i) = index(i);
%         result(2,i) = index(num_rows);
%     end
% 
%     % Get the first and last Normalised Frequency
%     lOmeg(:) = w(result(1,:));
%     hOmeg(:) = w(result(2,:));
% 
%     lcf = lOmeg * (fs / (2*pi));
%     hcf = hOmeg * (fs / (2*pi));
% 
%     bpw = hcf - lcf;
% 
% 
%     hOww = ww(result(2,:)) .* (fs / (2 * pi()));
% 
%     for i = 1:(size(result, 2) - 1)
% 
%         if (hOww(i) > (fcent(i + 1)))
%             break;
%         else
%             disp(L)
%         end
% 
%     end
% 
%     %normalise
% end

% returns w and h too
function [w_out, h_out, hh] = dtmfdesign_updated(fcent, L, fs)
    nn = 1:L;

    for i=1:size(fcent)

        %calculate filter coeffs
        bb = cos(2*pi*(fcent(i)/fs)*nn); 

        %get the greatest unscaled val to scale BPF down 
        [h, w] = freqz(bb, 1, fs);
        maxVal = max(h); %find the maximum value

        %scaled 
        bb_scaled = (1/maxVal)*bb;
        [h_out, w_out] = freqz(bb_scaled, 1, fs);

        %assign to matrix 
        hh(:, i) = bb_scaled;
    end
end

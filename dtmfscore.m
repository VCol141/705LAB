function  [sc] = dtmfscore(xx, hh)
%DTMFSCORE
%          sc = dtmfscore(xx, hh)
%    returns a score based on the maximum amplitude of the filtered output
%     xx = input DTMF signal
%     hh = impulse response of ONE bandpass filter
%
% The signal detection is done by filtering xx with a length-L
% BPF, hh, and then finding the maximum amplitude of the output.
% The score is either 1 or 0.
%      sc = 1 if max(|y[n]|) is greater than, or equal to, 0.59
%      sc = 0 if max(|y[n]|) is less than 0.59

xx_2 = xx*(1/max(abs(xx)));   %---Scale x[n] to the range [-2,+2]
sc = zeros(size(hh, 2), 1);

% get freq resp of signal
for i = 1:size(hh,2)
    y(i) = max(abs(conv(hh(:,i), xx_2)));
    
end

%sort the freq resp by magnitude
y_1 = sort(y);

n = size(y_1,2);

% return the top two frequencies by magnitude
for i = 1:size(hh,2)

    if (y(i) == y_1(n))
        sc(i) = 1;
    elseif (y(i) == y_1(n - 1))
        sc(i) = 1;
    end
end

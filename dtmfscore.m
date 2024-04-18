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

xx = xx*(2/max(abs(xx)));   %---Scale x[n] to the range [-2,+2]
sc = zeros(size(hh, 2), 1);

for i = 1:size(hh, 2)
    y = conv(hh(i), xx);
    y = abs(max(y))
    
    if (max(y) >= 0.59)
        % disp(max(y));
        sc(i) = 1;
    end
end

end


%%%% add your lines below to complete the code


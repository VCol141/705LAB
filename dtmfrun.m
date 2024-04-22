function keys = dtmfrun(xx,L,fs)
%DTMFRUN    keys = dtmfrun(xx,L,fs)
%    returns the list of key numbers corresponding
%      to the DTMF waveform, xx.
%      L = filter length
%     fs = sampling freq  

freqs = [697;770;852;941;1209;1336;1477;1633];  % list of centre frequencies

hh = dtmfdesign( freqs,L,fs );
%   hh = MATRIX of all the filters. Each column contains the impulse
%        response of one BPF (bandpass filter)

dtmf.keys = ...
['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
dtmf.colTones = [1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941];

[nstart,nstop] = dtmfcut(xx,fs);   %<--Find the start and end points of each tone

%%%% add your lines below to complete the code

k = 1;

[bb, H, W] = dtmfdesign(freqs, L, fs);

for i = 1:size(nstart, 2)

    freq_section = xx(nstart(i):nstop(i));
    sc = dtmfscore(freq_section, bb);

    %freq_components(:,i) = nonzeros(sc .* freqs);

    %S = sum(nonzeros(sc .* freqs));

    switch sum(nonzeros(sc .* freqs))
        case (697 + 1209)
            keys(i) = '1';
        case (697 + 1336)
            keys(i) = '2';
        case (697 + 1477)
            keys(i) = '3';
        case (697 + 1633)
            keys(i) = 'A';
        case (770 + 1209)
            keys(i) = '4';
        case (770 + 1336)
            keys(i) = '5';
        case (770 + 1477)
            keys(i) = '6';
        case (770 + 1633)
            keys(i) = 'B';
        case (852 + 1209)
            keys(i) = '7';
        case (852 + 1336)
            keys(i) = '8';
        case (852 + 1477)
            keys(i) = '9';
        case (852 + 1633)
            keys(i) = 'C';
        case (941 + 1209)
            keys(i) = '*';
        case (941 + 1336)
            keys(i) = '0';
        case (941 + 1477)
            keys(i) = '#';
        case (941 + 1633)
            keys(i) = 'D';
        otherwise
            keys(i) = 'e';
    end
end


end

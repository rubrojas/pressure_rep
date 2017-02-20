
function [freqs, amps, amps2] = find_freq(data, probe, l)
rate = 0.5 * l;

k = probe;

pxx  = pwelch(data(:,k),16385);

noise_zero = 10*mode(pxx);
pxx = pxx/noise_zero;
%figure;
%plot(pxx);


%
f = 1:16385;
lpxx = 10*log10(pxx);
%plot(f./128,lpxx);

%lpxx = lpxx(1:int32(length(lpxx)));
%(2*3.5/rate) alternative reduction of length
%span = 101;
%method ='rlowess';
%fil_lpxx = smooth(lpxx,span,method);

%norm_lpxx = lpxx;%- fil_lpxx;

[mod, inde] = max(lpxx(int16(rate*128-3):int16(rate*128+3)));

%inde = int16(rate*128-3) + inde;
%double(inde)/128

%rrate = inde/128.

%norm_lpxx = norm_lpxx.*(100/mod);


%norm_lpxx = lpxx + noise_zero;

%figure;
%pwelch(lpxx);
%mean = sum(norm_lpxx)./length(norm_lpxx);
means = std(lpxx);
%mean = 10*rate/3.5;

[pks, locs] = findpeaks(lpxx, 128, 'MinPeakHeight', means, 'MinPeakProminence', 4*rate + means+3);

%xx = locs < 10;
freqs=locs;

amps=pks;

amps2=amps*100/mod;
%findpeaks(norm_lpxx, 128, 'MinPeakHeight', mean + 3  , 'MinPeakProminence', 4*rate + 3 + mean);
%plot(lpxx);hold on; plot(fil_lpxx);hold off;

end


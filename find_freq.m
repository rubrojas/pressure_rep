
function [freqs, amps] = find_freq(data, probe, l)
rate = 0.5 * l;

k = probe;

pxx  = pwelch(data(:,k),16385);

lpxx = 10*log10(pxx);

lpxx = lpxx(1:length(lpxx)*rate/10);
%(2*3.5/rate) alternative reduction of length
span = 101;
method ='rlowess';
fil_lpxx = smooth(lpxx,span,method);

norm_lpxx = lpxx - fil_lpxx;

mod = max(norm_lpxx(rate*128-3:rate*128+3));

norm_lpxx = norm_lpxx.*(100/mod);

%mean = sum(norm_lpxx)./length(norm_lpxx);
mean = std(norm_lpxx);
%mean = 10*rate/3.5;
[pks, locs] = findpeaks(norm_lpxx, 128, 'MinPeakHeight', mean + 3, 'MinPeakProminence', 4*rate + 3 + mean);

%xx = locs < 10;
freqs=locs;

amps=pks;

%findpeaks(norm_lpxx, 128, 'MinPeakHeight', mean + 3  , 'MinPeakProminence', 4*rate + 3 + mean);
%plot(lpxx);hold on; plot(fil_lpxx);hold off;

end 


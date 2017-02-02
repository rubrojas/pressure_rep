three_norm_freq_hist = cell(7,7);

for i = 1:7
    for j = 1:7
        
        value = [norm_freq_hist{i,j}{1,1}; norm_freq_hist{i,j}{1,1}; norm_freq_hist{i,j}{3,1}];
      
        three_norm_freq_hist{i,j} = value;
    end
end
clearvars i j k value
norm_freq_hist = cell(7,7);

for i = 1:7
    for j = 1:7
        
        value = cell(3,1);
        
        for k = 1:3
            value{k,1} = [H_array{i,j}{k,1}(:,1), H_array{i,j}{k,1}(:,2)*2/i];
        end
        
        norm_freq_hist{i,j} = value;
    end
end
clearvars i j k value
for c = 1:7
    
    figure;
    
    for i = 1:7
        
        for k = c
            
            
            k_vec = ones(1, length(H_array_allprobes{i,k}(:,2))).*i/2;
            scatter(k_vec,H_array_allprobes{i,k}(:,2),H_array_allprobes{i,k}(:,1).*5, 'k', 'filled');
            
            hold on
            axis([0 4 0 0.51]);
            grid on
            grid minor
            
            
        end
    end
    clearvars B k Bvec i k_vec
end
for i = 4
B = 20;
for k=1:7
    
  
    if k == 7
        B = 270;
    else
    end
      Bvec = ones(1, length(H_array_allprobes{i,k}(:,2))).*B;
   %k_vec = ones(1, length(H_array_allprobes{i,k}(:,2))).*k/2;
    scatter(Bvec,H_array_allprobes{i,k}(:,2),H_array_allprobes{i,k}(:,1).*5, 'k', 'filled');
  
    hold on
    axis([0 280 0 0.51]);
    grid on
    grid minor
    B = B*2;
    
end
end
clearvars B k Bvec i 
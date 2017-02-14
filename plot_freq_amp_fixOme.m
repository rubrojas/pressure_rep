%This is a modified code to plot the normalized pure spectrum

B_list = { '0', '20', '40', '80', '160', '270', '300'};

ff = 10; %Number of maximums ploted per probe, per condition
k = 1; %probe

for i = 5
    figure;
    
    for j=1:7
        
        a = char(B_list(j));
        B = eval(a);
        
        
       
        %k_vec = ones(1, ff).*i/2;
        %k_vec = ones(1, length(H_array_allprobes{i,k}(:,2))).*k/2;
        %scatter(Bvec,H_array_allprobes{i,k}(:,2),H_array_allprobes{i,k}(:,1).*5, 'k');
        %stem3(Bvec,H_array_allprobes{i,k}(:,2),H_array_allprobes{i,k}(:,1),
        %'k'); % comment this one for original histogram plots 
        Bvec = ones(1,ff).*B;
        %k_vec = ones(1, ff).*i/2;
        for f=1:ff
        if mod(all_freq_array{i,j}{k,1}(f,3),1) == 0
            stem3(all_freq_array{i,j}{k,1}(f,3), Bvec(f) ,all_freq_array{i,k}{k,1}(f,4), 'r', 'filled');%this one is for artur's freq analysis of just the freq, no histogram
        else
            stem3(all_freq_array{i,j}{k,1}(f,3), Bvec(f) ,all_freq_array{i,k}{k,1}(f,4), 'k', 'filled');
        end
         end
         hold on
       
       
        
        
        
       % B = B*2;
        
    end
%     
    title(['\Omega_o = ',num2str(i/2), ' Hz']);
    ylabel('I in coils (Amp)')
    xlabel('f/f_0')
   % axis([-10 310 0 0.51]);
    grid on
    grid minor
     hold off
end
clearvars B k Bvec i B_list a 
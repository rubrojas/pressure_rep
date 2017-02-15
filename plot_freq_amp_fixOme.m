%This is a modified code to plot the normalized pure spectrum

B_list = { '0', '20', '40', '80', '160', '270', '300'};

ff = 10; %Number of maximums ploted per probe, per condition
k = 1; %probe

for i = 1
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
        
        
        %3D STEMP PLOT OF THE NORMALIZE BUT NOT MODULATED FREQUENCIES 
        
%         for f=1:ff
%         if mod(all_freq_array{i,j}{k,1}(f,3),1) == 0
%             stem3(all_freq_array{i,j}{k,1}(f,3), Bvec(f) ,all_freq_array{i,j}{k,1}(f,4), 'r', 'filled');%this one is for artur's freq analysis of just the freq, no histogram
%         else
%             stem3(all_freq_array{i,j}{k,1}(f,3), Bvec(f) ,all_freq_array{i,j}{k,1}(f,4), 'k', 'filled');
%         end
%          hold on
%         end
         
        %ANOTHER TIPE OF PLOT - COLOR SCALE ON TOP 
      color_list = {'0   , 0.4470 ,   0.7410',  '0.8500  ,  0.3250  ,  0.0980','0.9290  ,  0.6940  ,  0.1250', '0.4940 ,   0.1840   , 0.5560', '0.4660  ,  0.6740   , 0.1880','0.3010 ,   0.7450 ,   0.9330', '0.6350   , 0.0780 ,   0.1840'};
       b = char(color_list(j));
      % c = eval(b);
        %for f=1:ff
        stem(all_freq_array{i,j}{k,1}(1:ff,3),all_freq_array{i,j}{k,1}(1:ff,4),'color', (b));%this one is for artur's freq analysis of just the freq, no histogram
        hold on
            
        
        
       %----------------------------------------------------------------------------------------
        
        
        
        
        
       % B = B*2;
        
    end
    %TITLE AND THINGS FOR COLOR PLOTS
    title(['\Omega_o = ',num2str(i/2), ' Hz']);
    ylabel('rel. amp.');
    xlabel('f/f_0');
    legend('0', '20', '40', '80','160','270','00');
   % axis([-10 310 0 0.51]);
    grid on
    grid minor
     hold off
%-----------------------------
     
     
     
%TITLE AND THINGS FOR STEM3 PLOTS
%     title(['\Omega_o = ',num2str(i/2), ' Hz']);
%     ylabel('I in coils (Amp)')
%     xlabel('f/f_0')
%    % axis([-10 310 0 0.51]);
%     grid on
%     grid minor
%      hold off
%--------------------------------------------------     
end
clearvars B k Bvec i B_list a b c B_list color color_list f ff j k 
%This is a modified code to plot the normalized pure spectrum
B_list = { '0', '20', '40', '80', '160', '270', '300'};

%ff = 10; %Number of maximums ploted per probe, per condition
k = 1; %probe

for j = 4
    
    figure;
    
    for i = 1:7
        
        a = char(B_list(j));
        B = eval(a);
        
        ff = length(all_freq_array{i,j}{k,1}(:,3));
        k_vec = ones(1, ff).*i/2;
        
            for f=1:ff
                if mod(all_freq_array{i,j}{k,1}(f,3),1) == 0
                    stem3(all_freq_array{i,j}{k,1}(f,3), k_vec(f) ,all_freq_array{i,j}{k,1}(f,4), 'r', 'filled');%this one is for artur's freq analysis of just the freq, no histogram
                else
                    stem3(all_freq_array{i,j}{k,1}(f,3), k_vec(f) ,all_freq_array{i,j}{k,1}(f,4), 'k', 'filled');
               
                end
                hold on
            end
            
            
    end
    
     title([ 'I = ',num2str(a), 'A']);
     ylabel('$\Omega_o$', 'interpreter','latex')
     xlabel('f/f_0')
     axis([0 10 0 4 0 100]);
%     grid on
%     grid minor
        
    end
 
   
       clearvars B k Bvec i k_vec

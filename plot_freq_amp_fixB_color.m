%This is a modified code to plot the normalized pure spectrum
B_list = { '0', '20', '40', '80', '160', '270', '300'};


ff = 20; %Number of maximums ploted per probe, per condition
k = 3; %probe

for j = 1
    
    figure;
    
    for i = 1:7
        
        a = char(B_list(j));
        B = eval(a);
        k_vec = ones(1, ff).*i/2;
        
        
%         %3D STEMP PLOT OF THE NORMALIZE BUT NOT MODULATED FREQUENCIES 
%         
%             for f=1:ff
%                 if mod(all_freq_array{i,j}{k,1}(f,3),1) == 0
%                     stem3(all_freq_array{i,j}{k,1}(f,3), k_vec(f) ,all_freq_array{i,j}{k,1}(f,4), 'r', 'filled');%this one is for artur's freq analysis of just the freq, no histogram
%                 else
%                     stem3(all_freq_array{i,j}{k,1}(f,3), k_vec(f) ,all_freq_array{i,j}{k,1}(f,4), 'k', 'filled');
%                
%                 end
%                 hold on
%             end
       %--------------------------------------------------------------------------------------------     
        %ANOTHER TIPE OF PLOT - COLOR SCALE ON TOP 
      color_list = {'0   , 0.4470 ,   0.7410',  '0.8500  ,  0.3250  ,  0.0980','0.9290  ,  0.6940  ,  0.1250', '0.4940 ,   0.1840   , 0.5560', '0.4660  ,  0.6740   , 0.1880','0.3010 ,   0.7450 ,   0.9330', '0.6350   , 0.0780 ,   0.1840'};
       b = char(color_list(i));
      % c = eval(b);
      
        
        stem(all_freq_array{i,j}{k,1}(1:ff,3),all_freq_array{i,j}{k,1}(1:ff,4),'filled','color', (b));%this one is for artur's freq analysis of just the freq, no histogram
        
       
        hold on
    
            
        
        
       %----------------------------------------------------------------------------------------
             
       
       
       
    end
    
     title([ 'I = ',num2str(a), 'A']);
     %ylabel('$\Omega_o$', 'interpreter','latex')
     xlabel('f/f_0')
     ylabel('relative amplitude');%this for color plots
    % axis([0 10 0 4 0 100]);
    grid on
    grid minor
    legend('0.5Hz', '1Hz', '1.5Hz', '2Hz','2.5Hz','3Hz','3.5Hz'); %this for color plots
        
    end
 
   
       clearvars B k Bvec i k_vec B k Bvec i B_list a b c B_list color color_list f ff j k k_vec

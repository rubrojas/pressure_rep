%hist_all_freq_all_probes

clearvars N_weight centers A_ord B_ord B A edges
clearvars k2 A H_value I freq amp k x value_H i j a current_name_H hh N_ord N edges c bin B nn A_ord B_ord hh
A = 0;
B = 0;

for i= 1:7
    for j = 7
        
       
        
        
        A = vertcat(all_freq_array{i,j}{1,1}(:,3),all_freq_array{i,j}{2,1}(:,3),all_freq_array{i,j}{3,1}(:,3),A);
        B = vertcat(all_freq_array{i,j}{1,1}(:,4),all_freq_array{i,j}{2,1}(:,4),all_freq_array{i,j}{3,1}(:,4),B);
        
        
        
        
        
        
    end
end



[A_ord, I] = sort(A);
B_ord = B(I);
hh = A_ord < 20;
A_ord = A_ord(hh);
B_ord = B_ord(hh);

c =21; %number of divition per frequency unit
edges = linspace(0,max(A_ord),max(A_ord)*c);

[N ,edges] = histcounts(A_ord, edges);
N_weight = zeros(1,length(N));

for i=1:length(N)-1
    nn = A_ord>edges(i) & A_ord<edges(i+1);
    N_weight(i) = sum(B_ord(nn));
end

N_max = max(N_weight);
N_weight = N_weight./N_max; %Normalization based on the height of the main peak

%Creating the centers for the plots
for k2 = 1:length(edges)-1
    centers(k2) = (edges(k2) + edges(k2+1))/2;
end

%select your plot
figure;
bar(centers, N_weight);
%stem(centers, N_weight,'filled');





clearvars k2 A H_value I freq amp k x value_H i j a current_name_H hh N_ord N edges bin B nn A_ord B_ord hh c centers N_max 
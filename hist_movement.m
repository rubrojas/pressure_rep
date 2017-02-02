H_array = cell(7,7);

for i = 1:7
    for j = 1:7
        
        H_value = cell(3,1);
        clearvars value_H
        for k = 1:3
            A = vertcat(all_freq_array{i,j}{k,1}(:,3),all_freq_array{i,j}{k,1}(:,4));
            %all_freq_array{i, j}{k, 1}(:,3|4);
            edges = linspace(0,max(A),max(A)*501);
            %edges = 0:0.01:max(A);
            [N ,edges, bin] = histcounts(A, edges);
            [N_ord, I] = sort(N,'descend');

            for k2 = 1:length(edges)-1
                centers(k2) = (edges(k2) + edges(k2+1))/2;
            end
            
            threshold = 3;
            
            hh = N_ord > threshold;
            centers_ord = centers(I);
            value_H = [N_ord(hh).', centers_ord(hh).'];
            
            H_value{k,1} = value_H;
            
        end
        
        H_array{i,j} = H_value;
    end
end

clearvars threshold k2 A centers H_value I freq amp k x value_H i j a current_name_H hh N_ord centers_ord N edges bin
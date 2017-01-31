%H_names = cell(7,7);

for i=1:1
    for j=1:1
        %A = f_names(i,j);
        edges = linspace(0,max(A),max(A)*501);
        %edges = 0:0.01:max(A);
        
        [N ,edges, bin] = histcounts(A, edges);
        
        [N_ord, I] = sort(N,'descend');
        
        
     
        for k = 1:length(edges)-1
            centers(k) = (edges(k) + edges(k+1))/2;
        end
        
        hh = N_ord > 1;
        centers_ord = centers(I);
        value_H = [N_ord(hh).', centers_ord(hh).'];
        
        current_name_H = strcat('H_',p_names_list(7*(i-1)+j));
        eval(sprintf('%s=value_H;',char(current_name_H)));
        
        
    end
end

clearvars freq amp k x value_H i j a current_name_H 
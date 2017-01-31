p_names_list = {'p05_0', 'p05_20', 'p05_40', 'p05_80', 'p05_160', 'p05_270', 'p05_00', 'p1_0', 'p1_20', 'p1_40', 'p1_80', 'p1_160', 'p1_270', 'p1_00' , 'p15_0', 'p15_20', 'p15_40', 'p15_80', 'p15_160', 'p15_270', 'p15_00','p2_0', 'p2_20', 'p2_40', 'p2_80', 'p2_160', 'p2_270', 'p2_00', 'p25_0', 'p25_20', 'p25_40', 'p25_80', 'p25_160', 'p25_270', 'p25_00','p3_0', 'p3_20', 'p3_40', 'p3_80', 'p3_160', 'p3_270', 'p3_00', 'p35_0', 'p35_20', 'p35_40', 'p35_80', 'p35_160', 'p35_270', 'p35_00'};

p_names = cell(7,7);
all_freq_array = cell(7,7);

% 
for i = 1:7
    for j = 1:7
        p_names(i,j) = p_names_list(7*(i-1)+j);
        a = char(p_names(i,j));
        x = eval(a);
        
        %creating a name of the new value
        %for k = 1:3
        current_name = strcat('F_',a);
        
        value = cell(3,1);
        for k = 1:3
            [freq, amp] = find_freq(x, k, i);
            value{k,1} = [freq, amp, mod(freq,i/2), mod(abs(i/2-mod(freq,i/2)),i/2)];
            
            %eval(sprintf('%s(%d)=%d',current_name,position,value))
            %eval(sprintf('%s=value;',current_name));
            %pwelch(p25_270(:,1))
        end
        
        all_freq_array{i,j} = value; 
        [i j], value;
    end
end

clearvars freq amp k x value i j a current_name

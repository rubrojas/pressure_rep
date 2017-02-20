%creating the list of names of datasets
p_names_list = {'p05_0', 'p05_20', 'p05_40', 'p05_80', 'p05_160', 'p05_270', 'p05_00', 'p1_0', 'p1_20', 'p1_40', 'p1_80', 'p1_160', 'p1_270', 'p1_00' , 'p15_0', 'p15_20', 'p15_40', 'p15_80', 'p15_160', 'p15_270', 'p15_00','p2_0', 'p2_20', 'p2_40', 'p2_80', 'p2_160', 'p2_270', 'p2_00', 'p25_0', 'p25_20', 'p25_40', 'p25_80', 'p25_160', 'p25_270', 'p25_00','p3_0', 'p3_20', 'p3_40', 'p3_80', 'p3_160', 'p3_270', 'p3_00', 'p35_0', 'p35_20', 'p35_40', 'p35_80', 'p35_160', 'p35_270', 'p35_00'};

%cell that contains resulting frequences 7*7*3 arrays
p_names = cell(7,7);
all_freq_array = cell(7,7);

% going over 7 rates
for i = 1:7
    %going over 7 magnetic fields
    for j =  1:7
        %setting names of datasets in good order
        p_names(i,j) = p_names_list(7*(i-1)+j);
        % taking the name of the current set
        a = char(p_names(i,j));
        %evaluating the dataset from the workspace and storing it in var x
        x = eval(a);
        
        %creating a cell to collect data from 3 channels
        value = cell(3,1);
        
        %going through 3 channels
        for k = 1:3
            %setting freq and amp as a result of function, input: x - data,
            % k - chanel, i - double of rotation rate
            [freq, amp, amp2] = find_freq_2(x, k, i);
            
            %setting k'th cell of value as a set of arrays
            value{k,1} = [freq, amp, freq.*2/i, amp2];

            
            %value{k,1} = [freq, amp, mod(freq,i/2), mod(abs(i/2-mod(freq,i/2)),i/2)];
            
        end
        %storind value in the cell of all_freq_array
        all_freq_array{i,j} = value; 
        
    end
end

clearvars freq amp k x value i j a current_name amp2

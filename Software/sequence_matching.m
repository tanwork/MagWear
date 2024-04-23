function res= sequence_matching(seq1, seq2)
    % Get the length of the sequence
    len1 = length(seq1);
    len2 = length(seq2);
    
    cor_matrix= zeros(len1,len2);
    for i=1:len1
       for j=1:len2
            cor_matrix(i,j) = (seq1(i)-seq2(j)).^2;
       end
    end
    
    matrix=cor_matrix;
    [m, n] = size(matrix);  % Get the number of rows and columns of the matrix
    
    % Initialize the accumulation and matrix
    min_sum_matrix = zeros(m, n);
    min_sum_matrix(1, 1) = matrix(1, 1);  % The cumulative sum of the starting points is the value of the starting point
    
    % Calculate the cumulative sum of the first row and column
    for i = 2:m
        min_sum_matrix(i, 1) = min_sum_matrix(i-1, 1) + matrix(i, 1);
    end
    for j = 2:n
        min_sum_matrix(1, j) = min_sum_matrix(1, j-1) + matrix(1, j);
    end
    
    % Step-by-step calculation of cumulative sums for other positions
    for i = 2:m
        for j = 2:n
            min_sum_matrix(i, j) = matrix(i, j) + min(min_sum_matrix(i-1, j), min(min_sum_matrix(i, j-1), min_sum_matrix(i-1, j-1)));
        end
    end
    
    % Backtracking paths to find cumulative and minimal paths
    min_sum_path = zeros(m + n - 1, 2);
    min_sum_path(1, :) = [1, 1]; 
    i = 1; j = 1; k = 2;
    while i < m && j < n
        if min_sum_matrix(i+1, j) < min(min_sum_matrix(i, j+1), min_sum_matrix(i+1, j+1))
            i = i + 1;
        elseif min_sum_matrix(i, j+1) < min(min_sum_matrix(i+1, j), min_sum_matrix(i+1, j+1))
            j = j + 1;
        else
            i = i + 1;
            j = j + 1;
        end
        min_sum_path(k, :) = [i, j];
        k = k + 1;
    end
    while i < m
        i = i + 1;
        min_sum_path(k, :) = [i, j];
        k = k + 1;
    end
    while j < n
        j = j + 1;
        min_sum_path(k, :) = [i, j];
        k = k + 1;
    end
    
    index1=1;
    res=[];
    while(index1<size(min_sum_path,1) && min_sum_path(index1,1)<=len1 &&min_sum_path(index1,2)<=len2 &&min_sum_path(index1,1)>0&&min_sum_path(index1,2)>0)
        if(min_sum_path(index1,1)~=min_sum_path(index1+1,1) && min_sum_path(index1,2)~=min_sum_path(index1+1,2))
            res=[res;min_sum_path(index1,1),min_sum_path(index1,2)];
            index1=index1+1;
        elseif(min_sum_path(index1,1)==min_sum_path(index1+1,1))
            a=min_sum_path(index1,1);
            start_index=index1;
            while(min_sum_path(index1,1)==a)
                index1=index1+1;
            end
            b=min_sum_path(start_index,2);
            min_value=cor_matrix(a,min_sum_path(start_index,2));
            for i=start_index:index1-1
                if(cor_matrix(a,min_sum_path(i,2))<min_value)
                    min_value=cor_matrix(a,min_sum_path(i,2));
                    b=min_sum_path(i,2);
                end
            end
            res=[res;a,b];
          elseif(min_sum_path(index1,2)==min_sum_path(index1+1,2))
            a=min_sum_path(index1,2);
            start_index=index1;
            while(min_sum_path(index1,2)==a)
                index1=index1+1;
            end
            b=min_sum_path(start_index,1);
            min_value=cor_matrix(min_sum_path(start_index,1),a);
            for i=start_index:index1-1
                if(cor_matrix(min_sum_path(i,1),a)<min_value)
                    min_value=cor_matrix(min_sum_path(i,1),a);
                    b=min_sum_path(i,1);
                end
            end
            res=[res;b,a];
        end
            
    end
    
end

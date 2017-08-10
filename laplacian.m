function lapI = laplacian(I)
    lapI = zeros(size(I));
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            if 1 < i && i < size(I,1)
                lapI(i,j,:) = lapI(i,j,:) + I(i-1,j,:)-2.0*I(i,j,:)+I(i+1,j,:);
            elseif i == 1
                lapI(i,j,:) = lapI(i,j,:) + I(i+1,j,:)-I(i,j,:);
            else
                lapI(i,j,:) = lapI(i,j,:) + I(i-1,j,:)-I(i,j,:);
            end
            if 1 < j && j < size(I,2)
                lapI(i,j,:) = lapI(i,j,:) + I(i,j-1,:)-2.0*I(i,j,:)+I(i,j+1,:);
            elseif j == 1
                lapI(i,j,:) = lapI(i,j,:) + I(i,j+1,:)-I(i,j,:);
            else
                lapI(i,j,:) = lapI(i,j,:) + I(i,j-1,:)-I(i,j,:);
            end
        end
    end
end
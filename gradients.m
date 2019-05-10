function [Ix,Iy] = gradients(I)
    Ix = zeros(size(I));
    Iy = zeros(size(I));
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            if i < size(I,1)
                Ix(i,j,:) = I(i+1,j,:)-I(i,j,:);
            end
            if j < size(I,2)
                Iy(i,j,:) = I(i,j+1,:)-I(i,j,:);
            end
        end
    end
end

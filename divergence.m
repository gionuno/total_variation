function divI = divergence(Ix,Iy)
    divI = zeros(size(Ix));
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            if 1 < i && i < size(Ix,1)
                divI(i,j,:) = divI(i,j,:) - Ix(i-1,j,:) + Ix(i,j,:);
            elseif i == 1
                divI(i,j,:) = divI(i,j,:) + Ix(i,j,:);
            else
                divI(i,j,:) = divI(i,j,:) - Ix(i-1,j,:);
            end
            if 1 < j && j < size(Ix,2)
                divI(i,j,:) = divI(i,j,:) - Iy(i,j-1,:) + Iy(i,j,:);
            elseif j == 1
                divI(i,j,:) = divI(i,j,:) + Iy(i,j,:);
            else
                divI(i,j,:) = divI(i,j,:) - Iy(i,j-1,:);
            end
        end
    end
end

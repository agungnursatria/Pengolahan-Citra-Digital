function konvolusi = konvolusi(image, pilihan)
    [row, col, z] = size(image);
    
    %  buat gambar baru dengan margin pada setiap sisi image
    % [1 2 3]       [0 0 0 0 0]
    % [4 5 6]  =>   [0 1 2 3 0]
    % [7 8 9]       [0 4 5 6 0]
    %               [0 7 8 9 0]
    %               [0 0 0 0 0]
    gambarbaru = zeros(row+2,col+2,z);
    for i = 1 : row
        for j = 1 : col
            gambarbaru(i+1,j+1,:) = image(i,j,:);
        end
    end
    [row, col, z] = size(gambarbaru);
    
    assignin('base','gambarbaru',gambarbaru);
    
    if strcmp(pilihan,'edge')
        kernel = [0 1 0;
            1 -4 1;
            0 1 0];
        for i = 2 : row - 1
            for j = 2 : col - 1
                hasil = gambarbaru(i-1,j-1)*kernel(1,1)+gambarbaru(i,j-1)*kernel(2,1)...
                    + gambarbaru(i+1,j-1)*kernel(3,1)+gambarbaru(i-1,j)*kernel(1,2)...
                    + gambarbaru(i,j)*kernel(2,2)+gambarbaru(i+1,j)*kernel(3,2)...
                    + gambarbaru(i-1,j+1)*kernel(1,3)+gambarbaru(i,j+1)*kernel(2,3)...
                    + gambarbaru(i+1,j+1)*kernel(3,3);
                gmb(i-1,j-1) = hasil;
            end
        end
    elseif strcmp(pilihan,'blur')
        kernel = [1/9 1/9 1/9;
            1/9 1/9 1/9;
            1/9 1/9 1/9];
        for i = 2 : row - 1
            for j = 2 : col - 1
                hasil = gambarbaru(i-1,j-1,:)*kernel(1,1,:)+gambarbaru(i,j-1,:)*kernel(2,1,:)...
                    + gambarbaru(i+1,j-1,:)*kernel(3,1,:)+gambarbaru(i-1,j,:)*kernel(1,2,:)...
                    + gambarbaru(i,j,:)*kernel(2,2,:)+gambarbaru(i+1,j,:)*kernel(3,2,:)...
                    + gambarbaru(i-1,j+1,:)*kernel(1,3,:)+gambarbaru(i,j+1,:)*kernel(2,3,:)...
                    + gambarbaru(i+1,j+1,:)*kernel(3,3,:);
                gmb(i-1,j-1,:) = hasil;
            end
        end
    elseif strcmp(pilihan,'sharpen')
        kernel = [0 -1 0;
            -1 5 -1;
            0 -1 0];
        for i = 2 : row -1
            for j = 2 : col -1
                hasil = gambarbaru(i-1,j-1,:)*kernel(1,1,:)+gambarbaru(i,j-1,:)*kernel(2,1,:)...
                    + gambarbaru(i+1,j-1,:)*kernel(3,1,:)+gambarbaru(i-1,j,:)*kernel(1,2,:)...
                    + gambarbaru(i,j,:)*kernel(2,2,:)+gambarbaru(i+1,j,:)*kernel(3,2,:)...
                    + gambarbaru(i-1,j+1,:)*kernel(1,3,:)+gambarbaru(i,j+1,:)*kernel(2,3,:)...
                    + gambarbaru(i+1,j+1,:)*kernel(3,3,:);
                gmb(i-1,j-1,:) = hasil;
            end
        end
    end
    assignin('base','gmb',uint8(gmb));
    
    konvolusi = uint8(gmb);
end
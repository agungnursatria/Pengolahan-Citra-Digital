% RegionGrowth
function rg = regionGrowth_singleColor(img, newImg, Y, X, topTreshold, botTreshold)    
    newImg(Y,X) = 255;
    [row, col] = size(img);
    
    % cek sisi bawah gambar
    if Y+1 <= row
        if img(Y+1,X) >= botTreshold && img(Y+1,X) <= topTreshold && newImg(Y+1,X) ~= 255
            newImg = regionGrowth_singleColor(img, newImg, (Y+1), X, topTreshold, botTreshold);
        end 
    end
    
    % cek sisi kanan gambar
    if X+1 <= col
        if img(Y,X+1) >= botTreshold && img(Y,X+1) <= topTreshold && newImg(Y,X+1) ~= 255
            newImg = regionGrowth_singleColor(img, newImg, Y, (X+1), topTreshold, botTreshold);
        end
    end
    
    % cek sisi atas gambar
    if Y-1 > 0
        if img(Y-1,X) >= botTreshold && img(Y-1,X) <= topTreshold && newImg(Y-1,X) ~= 255
            newImg = regionGrowth_singleColor(img, newImg, (Y-1), X, topTreshold, botTreshold);
        end
    end
    
    % cek sisi kanan gambar
    if X-1 > 0
        if img(Y,X-1) >= botTreshold && img(Y,X-1) <= topTreshold && newImg(Y,X-1) ~= 255
            newImg = regionGrowth_singleColor(img, newImg, Y, (X-1), topTreshold, botTreshold);
        end
    end

    assignin('base','rg',newImg);
    rg = newImg;
end
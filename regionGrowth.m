% Region Growth
function regionGrowth = regionGrowth(img, isGrayscale, Y, X, thresholdR, thresholdG, thresholdB)
    if isGrayscale == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        [row,col,~] = size(img);
        zeroMatrix = zeros(row,col);
        
        topTresholdR = uint8(R(Y,X)+thresholdR);
        botTresholdR = uint8(R(Y,X)-thresholdR);
        newR = regionGrowth_singleColor(R, zeroMatrix, Y, X, topTresholdR, botTresholdR);
        
        topTresholdG = uint8(G(Y,X)+thresholdG);
        botTresholdG = uint8(G(Y,X)-thresholdG);
        newG = regionGrowth_singleColor(G, zeroMatrix, Y, X, topTresholdG, botTresholdG);
        
        topTresholdB = uint8(B(Y,X)+thresholdB);
        botTresholdB = uint8(B(Y,X)-thresholdB);
        newB = regionGrowth_singleColor(B, zeroMatrix, Y, X, topTresholdB, botTresholdB);
        newImg = cat(3, newR, newG, newB);
    else
        [row,col] = size(img);
        zeroMatrix = zeros(row,col);
        topTresholdR = uint8(img(Y,X)+thresholdR);
        botTresholdR = uint8(img(Y,X)-thresholdR);
        newImg = regionGrowth_singleColor(img, zeroMatrix, Y, X, topTresholdR, botTresholdR);
    end
    
    regionGrowth = newImg;
end
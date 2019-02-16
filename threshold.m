% Threshold
function threshold = threshold(img, isGrayscale, batasBawahR, batasAtasR, batasBawahG, batasAtasG, batasBawahB, batasAtasB)
    if isGrayscale == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        newR = threshold_singleColor(R, batasBawahR, batasAtasR);
        newG = threshold_singleColor(G, batasBawahG, batasAtasG);
        newB = threshold_singleColor(B, batasBawahB, batasAtasB);
        newImg = cat(3, newR, newG, newB);
    else
        colorOfGrayscale = img;
        newImg = threshold_singleColor(colorOfGrayscale, batasBawahR, batasAtasR);
    end
    
    threshold = newImg;
end
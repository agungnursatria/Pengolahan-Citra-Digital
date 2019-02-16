function [ histR, histG, histB ] = histogram(img, isGrayscale)
    if isGrayscale == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        histR = histogram_singleColor(R);
        histG = histogram_singleColor(G);
        histB = histogram_singleColor(B);
    else
        colorOfGrayscale = img;
        histR = histogram_singleColor(colorOfGrayscale);
        histG = histR;
        histB = histR;
    end
    
end
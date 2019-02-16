function brightness = brightness(img, isGrayscale, value, pilihan)
    if isGrayscale == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        newR = brightness_singleColor(R, value, pilihan);
        newG = brightness_singleColor(G, value, pilihan);
        newB = brightness_singleColor(B, value, pilihan);
        newImg = cat(3, newR, newG, newB);
    else
        colorOfGrayscale = img;
        newImg = brightness_singleColor(colorOfGrayscale, value, pilihan);
    end
    
    brightness = newImg;
end
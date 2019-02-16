% Geser Gambar
function geser = geser(img, isGrayscale, valueGeser, arah)
    if isGrayscale == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        newR = geser_singleColor(R, valueGeser, arah);
        newG = geser_singleColor(G, valueGeser, arah);
        newB = geser_singleColor(B, valueGeser, arah);
        newImg = cat(3, newR, newG, newB);
    else
        colorOfGrayscale = img;
        newImg = geser_singleColor(colorOfGrayscale, valueGeser, arah);
    end
    
    geser = newImg;
end
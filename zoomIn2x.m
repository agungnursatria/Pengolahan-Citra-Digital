function zoomIn2x = zoomIn2x(img, pilihan)
    if pilihan == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        newR = zoomIn_singlecolor(R);
        newG = zoomIn_singlecolor(G);
        newB = zoomIn_singlecolor(B);
        newImg = cat(3, newR, newG, newB);
    else
        colorOfGrayscale = img;
        newImg = zoomIn_singlecolor(colorOfGrayscale);
    end
    
    zoomIn2x = newImg;
end
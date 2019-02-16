function zoomOut2x = zoomOut2x(img, pilihan)
    if pilihan == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        newR = zoomOut_singlecolor(R);
        newG = zoomOut_singlecolor(G);
        newB = zoomOut_singlecolor(B);
        newImg = cat(3, newR, newG, newB);
    else
        colorOfGrayscale = img(:,:);
        newImg = zoomOut_singlecolor(colorOfGrayscale);
    end
    
    zoomOut2x = newImg;
end
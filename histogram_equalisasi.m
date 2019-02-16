function [ histR, histG, histB ] = histogram_equalisasi(img, isGrayscale, indexTertinggiBaru, indexTerendahBaru)
    if isGrayscale == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        histR = histogram_equalisasi_singleColor(R, indexTertinggiBaru, indexTerendahBaru);
        histG = histogram_equalisasi_singleColor(G, indexTertinggiBaru, indexTerendahBaru);
        histB = histogram_equalisasi_singleColor(B, indexTertinggiBaru, indexTerendahBaru);
    else
        colorOfGrayscale = img;
        histR = histogram_equalisasi_singleColor(colorOfGrayscale, indexTertinggiBaru, indexTerendahBaru);
        histG = histR;
        histB = histR;
    end
    
end
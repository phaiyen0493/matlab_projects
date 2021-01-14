%Name: Yen Pham
%Project 3

image=imread('noisy-elliptical-object.tif'); %read the image

% 1. the original Fourier transform as an image
image1 = image(:,:,2);
F=fft2(double(image1));%fourier transform
Output1=log(1+abs(fftshift(F))); 
figure,imshow(real(Output1),[]); %show the image
imwrite(mat2gray(Output1), 'Output1.jpg'); %output the image

% 2. the modified – zeroed center – Fourier transform as an image
L=F;
[row, column] = size(L);

for x = 1:50 %put black dot to the side
    for y = 1:50
        if (sqrt((x)^2 + (y)^2) <=50)
            L(x,y)= 0;
        end
    end
end

for x = 593:643 %put black dot to the side
    for y = 1:50
        if (sqrt((643-x)^2 + (y)^2) <=50)
            L(x,y)= 0;
        end
    end
end

for x = 1:50 %put black dot to the side
    for y = 625:675
        if (sqrt((x)^2 + (675-y)^2) <=50)
            L(x,y)= 0;
        end
    end
end

for x = 593:643 %put black dot to the side
    for y = 625:675
        if (sqrt((643-x)^2 + (675-y)^2) <=50)
            L(x,y)= 0;
        end
    end
end

Output2=log(1+abs(fftshift(L))); 
figure,imshow(real(Output2),[]); %show the image
imwrite(mat2gray(Output2), 'Output2.jpg'); %output the image

% 3. the spatial image obtained through the inverse Fourier transform (the transform which was not modified)
Output3 = ifft2(F); %convert back from fourier to spatial
figure,imshow(real(Output3), []); %show the image
imwrite(mat2gray(Output3), 'Output3.jpg'); %output the image

% 4.  the spatial image obtained through the inverse transform (the transform having the zeroed center).
Output4 = ifft2(L); %convert back from fourier to spatial
Output4 = Output4/max(Output4(:));
figure,imshow(real(Output4), []); %show the image
imwrite(real(Output4), 'Output4.jpg'); %output the image

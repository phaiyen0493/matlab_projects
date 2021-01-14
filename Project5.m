image = imread("woman.tif"); %read image
image = image(:,:,1:3); % convert the image into RGB type
imshow(image);
gray_image = rgb2gray(image); %convert to 2d grayscale image
[row column] = size(gray_image); %get row and column of image 1

%For each pixel, f(x,y),replace with (-1)^(x+y)*f(x,y)
for x = 1:row
    for y = 1:column
        gray_image(x,y) = ((-1)^(x+y))*gray_image(x,y);
    end
end

%Compute the Fourier transform of f
F=fft2(double(gray_image));%fourier transform
Output1=log(1+abs(fftshift(F))); 

%Take the complex conjugate of F(u,v)
complex_conj_image = conj(F);

%Compute the inverse transform of the F from above step
inverse_transform = ifft2(F);

%For each pixel, g(x,y), replace with (-1)^(x+y) * g(x,y)
[row1 column1] = size(inverse_transform);
for x1 = 1:row1
    for y1 = 1:column1
        inverse_transform(x1,y1) = ((-1)^(x1+y1))*inverse_transform(x1,y1);
    end
end
imshow(inverse_transform);
imwrite(inverse_transform, "output.jpg");

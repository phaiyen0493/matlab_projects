%Name:Yen Pham
%Programming assignment 6

image = imread("building.png"); %read image
gray_image = rgb2gray(image); %convert to 2d grayscale image

%Compute the Fourier transform of f
F=fft2(double(gray_image));%fourier transform
fourier_output=log(1+abs(fftshift(F))); 
figure,imshow(real(fourier_output),[]); %show the image
imwrite(mat2gray(fourier_output), "fourier_output.jpg");

%Compute the magnitude form of the array
magnitude = real(F);

%Get the inverse of magnitude
inverse_magnitude = ifft2(magnitude);
figure, imshow(mat2gray(inverse_magnitude)); %show the image
imwrite(mat2gray(inverse_magnitude), "inverse_magnitude.jpg"); %write the image

%Compute the phase angle of the aray
phase = angle(F);

%Get the inverse of phase angle
inverse_angle = ifft2(1j*phase);
figure, imshow(mat2gray(inverse_angle)); %show the image
imwrite(mat2gray(inverse_angle), "inverse_angle.jpg");
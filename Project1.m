% Read the image
image = imread('noisy-elliptical-object.tif');

% Convert the image into RGB type
image = image(:,:,1:3);
[row column depth] = size(image);

% Grayscale the pixels in the middle
for x = 1:row
    for y = 1:column
        if (sqrt((row/2-x)^2 + (column/2-y)^2) <50)
            image(x,y,1)= 0;
            image(x,y,2)= 0;
            image(x,y,3)= 0;
        end
    end
end

% Show the image
imshow(image);

%Export the image
imwrite(image,'new_image.jpg');
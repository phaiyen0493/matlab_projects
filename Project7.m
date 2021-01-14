%Name: Yen Pham
%Project 7

%I.Training phase
%Compute average chord length for ellipse_training.png image

grayImage = imread('ellipse_training.png'); %read ellipse training image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 50231], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
ellipse_signature = (chord_array(1, 500) + chord_array(1, 501))/2;

%Compute average chord length for circle_training.png image

grayImage = imread('circle_training.png'); %read circle training image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 43283], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
circle_signature = (chord_array(1, 500) + chord_array(1, 501))/2;

%Compute average chord length for square_training.png image

grayImage = imread('square_training.png'); %read ellipse training image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 40128], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
square_signature = (chord_array(1, 500) + chord_array(1, 501))/2;

%Compute average chord length for triangle_training.png image

grayImage = imread('triangle_training.png'); %read ellipse training image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 74039], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
triangle_signature = (chord_array(1, 500) + chord_array(1, 501))/2;

% II.Operational phase

% Compute average chord length for first unlabeled image
%(ellipse_test_1.png)

grayImage = imread('ellipse_test_1.png'); %read ellipse ttest 1 image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 31324], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
ellipse_test1 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- ellipse_test1));
minVal= signature_array(idx);

%display result
if (abs(ellipse_test1 - minVal) > 0.000025)
    disp('The shape of ellipse_test_1 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of ellipse_test_1 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of ellipse_test_1 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of ellipse_test_1 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of ellipse_test_1 image is triangle');
    figure, imshow(grayImage);
end
    
% Compute average chord length for second unlabeled image
%(ellipse_test_2.png)

grayImage = imread('ellipse_test_2.png'); %read ellipse test 2 image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 31324], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
ellipse_test2 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- ellipse_test2));
minVal= signature_array(idx);

%display result
if (abs(ellipse_test2 - minVal) > 0.000025)
    disp('The shape of ellipse_test_2 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of ellipse_test_2 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of ellipse_test_2 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of ellipse_test_2 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of ellipse_test_2 image is triangle');
    figure, imshow(grayImage);
end

% Compute average chord length for third unlabeled image
%(square_test_1.png)

grayImage = imread('square-test_1.png'); %read square test 1 image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 5400], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
square_test1 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- square_test1));
minVal= signature_array(idx);

if (abs(square_test1 - minVal) > 0.000025)
    disp('The shape of square_test_1 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of square_test_1 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of square_test_1 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of square_test_1 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of square_test_1 image is triangle');
    figure, imshow(grayImage);
end

% Compute average chord length for fourth unlabeled image
%(square_test_2.png)

grayImage = imread('square-test_2.png'); %read square test 2 image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 20453], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
square_test2 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- square_test2));
minVal= signature_array(idx);

if (abs(square_test2 - minVal) > 0.000025)
    disp('The shape of square_test_2 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of square_test_2 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of square_test_2 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of square_test_2 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of square_test_2 image is triangle');
    figure, imshow(grayImage);
end

% Compute average chord length for fifth unlabeled image
%(triangle_test_1.png)

grayImage = imread('triangle_test_1.png'); %read triangle test 1 image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 74039], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
triangle_test1 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- triangle_test1));
minVal= signature_array(idx);

if (abs(triangle_test1 - minVal) > 0.000025)
    disp('The shape of triangle_test_1 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of triangle_test_1 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of triangle_test_1 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of triangle_test_1 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of triangle_test_1 image is triangle');
    figure, imshow(grayImage);
end

% Compute average chord length for 6th unlabeled image
%(triangle_test_2.png)

grayImage = imread('triangle_test_2.png'); %read triangle test 2 image
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 25493], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
triangle_test2 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- triangle_test2));
minVal= signature_array(idx);

if (abs(triangle_test2 - minVal) > 0.000025)
    disp('The shape of triangle_test_1 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of triangle_test_2 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of triangle_test_2 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of triangle_test_2 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of triangle_test_2 image is triangle');
    figure, imshow(grayImage);
end

% Compute average chord length for 6th unlabeled image
%(cicle_test_1.png)

grayImage = imread('circle_test_1.png'); %read circle test 2 image
grayImage = real(rgb2gray(grayImage)); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 4335], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
circle_test1 = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- circle_test1));
minVal= signature_array(idx);

if (abs(circle_test1 - minVal) > 0.000025)
    disp('The shape of circle_test_1 image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of circle_test_1 image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of circle_test_1 image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of circle_test_1 image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of circle_test_1 image is triangle');
    figure, imshow(grayImage);
end

% Compute average chord length for 7th unlabeled image
%(septagon.tif)

grayImage = imread('septagon.tif'); %read circle test 2 image
grayImage = real(mat2gray(grayImage)); %convert to 2d grayscale image
[row, column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 0)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

chord_array = [];
chord_length_sum = 0;

for k = 1:1000
    randIndex = randi([1 173943], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    chord_array = [chord_array, chord_length];
    chord_length_sum = chord_length_sum + chord_length; %get sum of chord length
end

for n= 1:1000
    chord_array(1, n) = chord_array(1, n)/chord_length_sum;
end

chord_array = sort(chord_array);
septagon_test = (chord_array(1, 500) + chord_array(1, 501))/2;

%compare the test image with the signatures by getting the signature that is closest to the signature of the test
%image
signature_array = [ellipse_signature circle_signature square_signature triangle_signature];
[val,idx] = min(abs(signature_array- septagon_test));
minVal= signature_array(idx);

if (abs(septagon_test - minVal) > 0.000025)
    disp('The shape of septagon_test image is unknown');
    figure, imshow(grayImage);
elseif(minVal == circle_signature)
    disp('The shape of septagon_test image is circle');
    figure, imshow(grayImage);
elseif(minVal == square_signature)
    disp('The shape of septagon_test image is square');
    figure, imshow(grayImage);
elseif(minVal == ellipse_signature)
    disp('The shape of septagon_test image is ellipse');
    figure, imshow(grayImage);
elseif(minVal == triangle_signature)
    disp('The shape of septagon_test image is triangle');
    figure, imshow(grayImage);
end

%Compute average chord length for ellipse_edges_1.png image

grayImage = imread('ellipse_edges_1.png'); %read image 1
grayImage = rgb2gray(grayImage); %convert to 2d grayscale image
[row column] = size(grayImage); %get row and column of image 1

array = [];

for x=1:row
    for y = 1: column
        if (grayImage(x,y) > 150)
            array= [array; [x,y]]; %append border cordinates
        end
    end
end

avg_chord_length = 0;

for k = 1:1000
    randIndex = randi([1 637], 2,1); %get 2 random border array indexes
    chord_length = sqrt((array(randIndex(1,1), 1)- array(randIndex(2,1), 1))^2 + (array(randIndex(1,1), 2)- array(randIndex(2,1), 2))^2); %calculate chord length
    avg_chord_length = avg_chord_length+ chord_length; %get sum of chord length
end

avg_chord_length = avg_chord_length/1000; %get average chord length of image 1
disp(avg_chord_length); %display average chord length of image 1

%Compute average chord length for ellipse_edges_2.png image

grayImage2 = imread('ellipse_edges_2.png'); %read image 2
grayImage2 = rgb2gray(grayImage2); %convert to 2d grayscale image 
[row2 column2] = size(grayImage2); %get column and row of image 2

array2 = [];

for x2=1:row2
    for y2 = 1: column2
        if (grayImage2(x2,y2) > 150)
            array2= [array2; [x2,y2]]; %append border cordinates
        end
    end
end

avg_chord_length2 = 0;

for k2 = 1:1000
    randIndex2 = randi([1 637], 2,1); %get 2 random border array indexes 
    chord_length2 = sqrt((array2(randIndex2(1,1), 1)- array2(randIndex2(2,1), 1))^2 + (array2(randIndex2(1,1), 2)- array2(randIndex2(2,1), 2))^2); %calculate chord length
    avg_chord_length2 = avg_chord_length2+ chord_length2; %get sum of chord length
end

avg_chord_length2 = avg_chord_length2/1000; %get average chord length of image 2
disp(avg_chord_length2); %display average chord length of image 2



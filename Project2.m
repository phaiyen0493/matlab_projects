%Read the image
image = imread('astronaut-interference.png');
%Output 1
H = fspecial('Gaussian',[3 3]);
Output1 = imfilter(image,H);
figure,imshow(Output1); %show output 1 with built in Gaussian function
imwrite(Output1, 'Output1.png');

%Output2
[row column depth] = size(image);
g = [1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];%initialize the Gaussian kernel values
%c = [-1 0 1];
Output2 = zeros(row, column); %initialize values for output2

%dummy convolution code
for i=1:row
    for j=1:column
        if (i-1) < 1 || (j-1) < 1 || (i+1) > row || (j+1) > column %ignore the border
            Output2(i,j,1) = image(i,j,1);
            Output2(i,j,2) = image(i,j,2);
            Output2(i,j,3) = image(i,j,3);
        else %calculate the convolution sum
            Output2(i,j,1) = image(i-1,j-1,1)*g(1,1)+image(i-1,j,1)*g(1,2)+image(i-1,j+1,1)*g(1,3)+image(i,j-1,1)*g(2,1)+image(i,j,1)*g(2,2)+image(i,j+1,1)*g(2,3)+image(i+1,j-1,1)*g(3,1)+image(i+1,j,1)*g(3,2)+image(i+1,j+1,1)*g(3,3);
            Output2(i,j,2) = image(i-1,j-1,2)*g(1,1)+image(i-1,j,2)*g(1,2)+image(i-1,j+1,2)*g(1,3)+image(i,j-1,2)*g(2,1)+image(i,j,2)*g(2,2)+image(i,j+1,2)*g(2,3)+image(i+1,j-1,2)*g(3,1)+image(i+1,j,2)*g(3,2)+image(i+1,j+1,2)*g(3,3);
            Output2(i,j,3) = image(i-1,j-1,3)*g(1,1)+image(i-1,j,3)*g(1,2)+image(i-1,j+1,3)*g(1,3)+image(i,j-1,3)*g(2,1)+image(i,j,3)*g(2,2)+image(i,j+1,3)*g(2,3)+image(i+1,j-1,3)*g(3,1)+image(i+1,j,3)*g(3,2)+image(i+1,j+1,3)*g(3,3);
        end
    end
end
%This way is smarter but for complex
%for i= 1:row
%    for j=1:column
%        temp = 0;
%        for m=1:3
%            mp = c(m) - 2;
%            for n=1:3
%                np= c(n) - 2;
%                if (i-mp) > 1 && (i-mp) < row && (j-np) > 1 && (j-np) < column
%                    temp = temp + image(i-mp,j-np)* g(m,n);
%                end
%            end
%        end
%            Output2(i,j) = temp;
%    end
%end
Output2 = mat2gray(Output2);
figure;imshow(Output2);
imwrite(Output2, 'Output2.png');

%Output 3
Output3 = zeros(row, column);
for n = 1:row
    for m = 1:column
        Output3(i,j) = abs(Output1(i,j) - Output2(i,j)); %find the difference of pixels magnitude of 2 images 
    end
end
figure;imshow(Output3);
imwrite(Output3, 'Output3.png');



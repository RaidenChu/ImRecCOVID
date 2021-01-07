function [inputGray,outputGray,outputGraywithFragment,BW,BWwithFragment,outputRGB,outputRGBwithFragment] = imageReadSeg(inputFileName,inputFormatName)


inputName = strcat(inputFileName,inputFormatName);
%read original image
inputRGB = imread(inputName);

%present the figures and output the images to subfolders
figure;imshow(inputRGB),title(inputFileName);

%get grayscaled selfie image and its value
if size(inputRGB,3) > 2
inputGray = rgb2gray(inputRGB);
end
%figure;imshow(inputGray),title(sprintf('%s Gray',inputFileName));
imwrite(inputGray,sprintf('Output/%s/%s Gray.png',inputFileName,inputFileName));


[BW,~] = segmentImage(inputRGB);

%imshow(BW),title('aa');
%BBWnoBorder = imclearborder(BW,4);
%imshow(BBWnoBorder),title('abb');

BWnoBorder = BW;
BWnoBorder = imclearborder(BWnoBorder,4);
%BWgray = rgb2gray(uint(double(BWnoBorder)));
%figure,imshow(BWnoBorder),title(sprintf('%s Mask no Fragment',inputFileName));
imwrite(BWnoBorder,sprintf('Output/%s/%s Mask no Fragment.png',inputFileName,inputFileName));


outputRGB = double(BWnoBorder) .* double(inputRGB);
outputRGB = uint8(outputRGB);
outputGray = rgb2gray(outputRGB);
%figure,imshow(outputGray),title(sprintf('%s Segmented no Fragment',inputFileName));
imwrite(outputGray,sprintf('Output/%s/%s Segmented no Fragment.png',inputFileName,inputFileName));


BWwithFragment = bwareaopen(~BW,2000);
BWwithFragment = imclearborder(~BWwithFragment,4);
% I = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
%BWwithFragmentGray = rgb2gray(uint(double(BWwithFragment)));
%figure,imshow(BWwithFragment),title(sprintf('%s Mask',inputFileName));
imwrite(BWwithFragment,sprintf('Output/%s/%s Mask.png',inputFileName,inputFileName));

outputRGBwithFragment = double(BWwithFragment) .* double(inputRGB);
outputRGBwithFragment = uint8(outputRGBwithFragment);
outputGraywithFragment = rgb2gray(outputRGBwithFragment);
figure,imshow(outputGraywithFragment),title(sprintf('%s Segmented',inputFileName));
imwrite(outputGraywithFragment,sprintf('Output/%s/%s Segmented.png',inputFileName,inputFileName));





%find original image size and output image.
%[M,N]=size(inputGray);



end





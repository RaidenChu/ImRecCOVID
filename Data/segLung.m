function [] = segLung(outputGraywithFragment,inputFileName)



NumberOfWholeLung = nnz(outputGraywithFragment);


%simply use the values of grayscale for its height map
%figure;surf(outputGraywithFragment),title('Grayscale Tissue Height Map');
%figure;imhist(outputGraywithFragment),title('Grayscale Tissue Height Map');

segLungGray = outputGraywithFragment;

segLungGray (segLungGray > 100) = 0;

NumberOfHealthyLung = nnz(segLungGray);
percentageOfHealthyArea = (NumberOfHealthyLung/NumberOfWholeLung)*100;

%figure,imshow(segLungGray),title(sprintf('%s Healthy Lung Tissue',inputFileName));
%figure,imshow(segLungGray),title(sprintf('%s Healthy Lung Tissue Percentage is %.4f%%',inputFileName,percentageOfHealthyArea));
imwrite(segLungGray,sprintf('Output/%s/%s Healthy Lung Tissue.png',inputFileName,inputFileName));



segInfectedGray = outputGraywithFragment;

segInfectedGray (segInfectedGray < 100) = 0;

segInfectedGray = imerode(segInfectedGray,ones(2));

NumberOfInfectedLung = nnz(segInfectedGray);

percentageOfInfectedArea = (NumberOfInfectedLung/NumberOfWholeLung)*100;


figure,imshow(segInfectedGray),title(sprintf('%s Infected Lung Tissue Percentage is %.4f%%',inputFileName,percentageOfInfectedArea));
imwrite(segInfectedGray,sprintf('Output/%s/%s Infected Lung Tissue.png',inputFileName,inputFileName));


%header = ["symbol_1" "symbol_2" "symbol_3" "symbol_4" "symbol_5"];
%values = [1 2 3 4 5; 6 7 8 9 10];


end
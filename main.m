%ENSC 474 Final Project%
%by Han, QiaoChu%
%-----------------------------------------%

clear variables; %clear al0000l variables
close all; % close all figures
clc; %clear command windows
%-----------------------------------------%

%set the directory of current main.m as folder
folder = fileparts(which(mfilename)); 
%include all current folder and subfolders into workspace
path = addpath(genpath(folder));




inputFormatName = '.jpg';

%From 1 to 12
numberOfPatient = 1;

%%
%input Original Image 

for i = 1:numberOfPatient
inputFileNameStart =  'Patient'; 
inputFileNameEnd = sprintf( '%03d', i ) ;
inputFileName = strcat(inputFileNameStart,inputFileNameEnd);

%inputFileName = 'Patient001';

[inputGray,outputGray,outputGraywithFragment,BW,BWwithFragment,outputRGB,outputRGBwithFragment] = imageReadSeg(inputFileName,inputFormatName);

segLung(outputGray,inputFileName);
end


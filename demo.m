% DEMO Code
% Version 0.1,  12.2022, by Hangwei Chen @ NBU
% -----------------------------------------------------------------------------
% You can run this m file in MATLAB>=2020:
% -----------------------------------------------------------------------------
% Paper citation information:
% Author: Hangwei Chen, Feng Shao, Xiongli Chai, Yuese Gu, Qiuping Jiang, Xiangchao Meng, and Yo-Sung Ho, 
% Title: "Quality Evaluation of Arbitrary Style Transfer: Subjective Study and Objective Metric"
%  
% IEEE TRANSACTIONS ON CIRCUITS AND SYSTEMS FOR VIDEO TECHNOLOGY, Accept, 2022.
%-----------------------------------------------------------------------------
clc;
clear all;

img_content=imread('content.jpg');
img_style=imread('style.jpg');
img_result=imread('stylized_AdaIN.png');

use_gpu = 1;% 0:No, 1:Yes; Using GPU can save a lot of time

[Q_content,Q_style,Q_overall] = SRQE(img_content,img_style,img_result,use_gpu);
% Higher scores mean better quality
disp(['Content preservation score = ' num2str(Q_content, '%0.4f')]);
disp(['Style resemblance score = ' num2str(Q_style, '%0.4f')]);
disp(['Overall vision score = ' num2str(Q_overall, '%0.4f')]);

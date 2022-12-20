function output = Q_style_calculate(img_s,img_r,use_gpu)

Gram_style=gram_data_extract(img_s,use_gpu);
Gram_stylized=gram_data_extract(img_r,use_gpu);

%Loading dictionary
SD1=importdata('.\Qstyle_function\SD\SD1.mat');
%Sparse Feature Similarity Measure:
output1 = compute_SS(Gram_style{1}, Gram_stylized{1}, SD1);

SD2=importdata('.\Qstyle_function\SD\SD2.mat');
output2 = compute_SS(Gram_style{2}, Gram_stylized{2}, SD2);

SD3=importdata('.\Qstyle_function\SD\SD3.mat');
output3 = compute_SS(Gram_style{3}, Gram_stylized{3}, SD3);

SD4=importdata('.\Qstyle_function\SD\SD4.mat');
output4 = compute_SS(Gram_style{4}, Gram_stylized{4}, SD4);

SD5=importdata('.\Qstyle_function\SD\SD5.mat');
output5 = compute_SS(Gram_style{5}, Gram_stylized{5}, SD5);

Qstyle = output1.*output2.*output3.*output4.*output5;
output=Qstyle;
end


function Gram_cell = gram_data_extract(img,use_gpu) 
Gram_cell=cell(1);
net_params = load('net_param.mat');
weights = load('alpha_beta.mat');
resize_img = 0; 


stylized_features = extract_features( img, net_params, resize_img, use_gpu);
%fd1=extractdata(stylized_features{1});
fd2=extractdata(stylized_features{2});
fd3=extractdata(stylized_features{3});
fd4=extractdata(stylized_features{4});
fd5=extractdata(stylized_features{5});
fd6=extractdata(stylized_features{6});


A=[];
[m,n,c]=size(fd2);
for i=1:c
R=fd2(:,:,i);
Ii=reshape(R,1,m*n);
A=[A;Ii];
end
Gram2=A*A';
Gram_cell{1}=Gram2;


A=[];
[m,n,c]=size(fd3);
for i=1:c
R=fd3(:,:,i);
Ii=reshape(R,1,m*n);
A=[A;Ii];
end
Gram3=A*A';
Gram_cell{2}=Gram3;


A=[];
[m,n,c]=size(fd4);
for i=1:c
R=fd4(:,:,i);
Ii=reshape(R,1,m*n);
A=[A;Ii];
end
Gram4=A*A';
Gram_cell{3}=Gram4;


A=[];
[m,n,c]=size(fd5);
for i=1:c
R=fd5(:,:,i);
Ii=reshape(R,1,m*n);
A=[A;Ii];
end
Gram5=A*A';
Gram_cell{4}=Gram5;

A=[];
[m,n,c]=size(fd6);
for i=1:c
R=fd6(:,:,i);
Ii=reshape(R,1,m*n);
A=[A;Ii];
end
Gram6=A*A';
Gram_cell{5}=Gram6;

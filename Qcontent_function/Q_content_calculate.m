function output = Q_content_calculate(Raw_content,stylized)
scale=3;

% DOG decomposition
[ref_DOG_octave1,ref_DOG_octave2,ref_DOG_octave3,ref_DOG_octave4] = DOG_img_extract(Raw_content,scale);    
[stylized_DOG_octave1,stylized_DOG_octave2,stylized_DOG_octave3,stylized_DOG_octave4] = DOG_img_extract(stylized,scale);

%Loading dictionary
DOG_octave1_CD=importdata('.\Qcontent_function\CD\CD1.mat');
DOG_octave2_CD=importdata('.\Qcontent_function\CD\CD2.mat');
DOG_octave3_CD=importdata('.\Qcontent_function\CD\CD3.mat');
DOG_octave4_CD=importdata('.\Qcontent_function\CD\CD4.mat');

Q1 = zeros(1,scale);
for band = 1:scale  
    D1=DOG_octave1_CD(:,:,band); 
    Q1(band)=compute_CS(ref_DOG_octave1{band}, stylized_DOG_octave1{band},D1);
end
Out_Q1=mean(Q1);

 Q2 = zeros(1,scale);
for band = 1:scale    
    D2=DOG_octave2_CD(:,:,band); 
    Q2(band)=compute_CS(ref_DOG_octave2{band}, stylized_DOG_octave2{band},D2);
end
Out_Q2=mean(Q2);

 Q3 = zeros(1,scale);
for band = 1:scale    
    D3=DOG_octave3_CD(:,:,band); 
    Q3(band)=compute_CS(ref_DOG_octave3{band}, stylized_DOG_octave3{band},D3);
end
Out_Q3=mean(Q3);

 Q4 = zeros(1,scale);
for band = 1:scale    
    D4=DOG_octave4_CD(:,:,band);
    Q4(band)=compute_CS(ref_DOG_octave4{band}, stylized_DOG_octave4{band},D4);
end
Out_Q4=mean(Q4);

output =  Out_Q1.*Out_Q2.*Out_Q3.*Out_Q4;






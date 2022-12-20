function [DOG_octave1,DOG_octave2,DOG_octave3,DOG_octave4] = DOG_img_extract(A1,scale)
S=scale+1;
sigma=1.6;
hsize=[20,20]; 
k=2^(1/S);  
%% %%%%%%%% produce several octaves of gaussian filter %%%%%%%%%%
gauKernel1=cell(1);
gauKernel2=cell(1);
gauKernel3=cell(1);
gauKernel4=cell(1);

for i=1:S
    gauKernel1{i}=fspecial('gaussian',hsize,k^(i-1)*sigma);   %Octave 1
    gauKernel2{i}=fspecial('gaussian',hsize,2*k^(i-1)*sigma); %Octave 2
    gauKernel3{i}=fspecial('gaussian',hsize,4*k^(i-1)*sigma); %Octave 3
    gauKernel4{i}=fspecial('gaussian',hsize,8*k^(i-1)*sigma); %Octave 4

end

%% %%%% down-sampling the image, %%%%%%%%%%%%%%%
%% %%%% and set as the next octave of reference image %%%%%%%%%%%
A2=conv2(A1,gauKernel1{S},'same');  %s-2
A2=A2(1:2:end,1:2:end);
A3=conv2(A2,gauKernel2{S},'same');
A3=A3(1:2:end,1:2:end);
A4=conv2(A3,gauKernel3{S},'same');
A4=A4(1:2:end,1:2:end);


%% %%%%%%%%%%%%%% DoG scale space  %%%%%%%%%%%%%%%%%
DoGA1=cell(1);
DoGA2=cell(1);
DoGA3=cell(1);
DoGA4=cell(1);

octaveA1=cell(1);
octaveA2=cell(1);
octaveA3=cell(1);
octaveA4=cell(1);

for i=1:S-1
    DoGA1{i}=gauKernel1{i+1}-gauKernel1{i};
    DoGA2{i}=gauKernel2{i+1}-gauKernel2{i};
    DoGA3{i}=gauKernel3{i+1}-gauKernel3{i};
    DoGA4{i}=gauKernel4{i+1}-gauKernel4{i};

        
    octaveA1{i}=conv2(A1,DoGA1{i},'same');
    octaveA2{i}=conv2(A2,DoGA2{i},'same');
    octaveA3{i}=conv2(A3,DoGA3{i},'same');
    octaveA4{i}=conv2(A4,DoGA4{i},'same');


end
DOG_octave1=octaveA1;
DOG_octave2=octaveA2;
DOG_octave3=octaveA3;
DOG_octave4=octaveA4;

function output =compute_CS(r,d,D)
%   r:content DoG image
%   d:stylized DoG image
%   D:dictionary 
patchsize=size(D,1)^0.5;  
c=0.0004;
r=im2col(r,[patchsize patchsize] ,'distinct');                    
rcoef=pinv(D)*r;                                             

vt=0*mean2(rcoef.^2);
selectp=find(mean(rcoef.^2,1)>vt); 
rcoef=rcoef(:,selectp);

d=im2col(d,[patchsize patchsize],'distinct');
dcoef=pinv(D)*d;  
dcoef=dcoef(:,selectp);
       
%Sparse Feature Similarity Measure:
CS=mean((sum(abs(rcoef.*dcoef),1)+c)./((sum(rcoef.^2,1).*sum(dcoef.^2,1)).^0.5+c));  
output=CS;
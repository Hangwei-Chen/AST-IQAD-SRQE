function output =compute_SS(style_gram,stylized_gram,D)

c=0.02;
rcoef=pinv(D)*style_gram;                    
dcoef=pinv(D)*stylized_gram;

SS=mean((sum(abs(rcoef.*dcoef),1)+c)./((sum(rcoef.^2,1).*sum(dcoef.^2,1)).^0.5+c));
%  bb=mean(1-(sum((rcoef-dcoef).^2,1).^0.5+c)./(sum(rcoef.^2,1).^0.5+sum(dcoef.^2,1).^0.5+c));
%  SSIM = mean(mean((2*rcoef.*dcoef+c) ./(rcoef.^2 + dcoef.^2+c)));
 output=SS;
function [Q_content,Q_style,Q_overall] = SRQE(img_content,img_style,img_result,use_gpu)
img_c=rgb2gray(img_content);
img_r=rgb2gray(img_result);
Q_content = Q_content_calculate(img_c,img_r);
Q_style = Q_style_calculate(img_style,img_result,use_gpu);
Q_overall = (Q_content.^0.4).*(Q_style.^0.6);

end


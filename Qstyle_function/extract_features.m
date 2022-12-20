function features = extract_features(I, params, resize, gpu)
    if resize && min(size(I,1),size(I,2))>256
        I = imresize(I,256/min(size(I,1),size(I,2)));
    end
    if gpu
        I = gpuArray(I);
    end
    I = dlarray(double(I)/255,'SSC');
    
    features = cell(6,1);
    % stage 0
    features{1} = I;
    dlX = (I - params.vgg_mean)./params.vgg_std;
    
    % stage 1
    weights = dlarray(params.conv1_1_weight);
    bias = dlarray(params.conv1_1_bias');
    dlY = relu(dlconv(dlX,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv1_2_weight);
    bias = dlarray(params.conv1_2_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    features{2} = dlY;
    
    % stage 2
    weights = dlarray(params.L2pool_1);
    dlY = dlconv(dlY.^2,weights,0,'Stride',2,'Padding',[1, 1; 0, 0]);
    dlY = sqrt(dlY);
    % dlY = avgpool(dlY,2,'Stride',2);
    
    weights = dlarray(params.conv2_1_weight);
    bias = dlarray(params.conv2_1_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv2_2_weight);
    bias = dlarray(params.conv2_2_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    features{3} = dlY;
    
    % stage 3
    weights = dlarray(params.L2pool_2);
    dlY = dlconv(dlY.^2,weights,0,'Stride',2,'Padding',[1, 1; 0, 0]);
    dlY = sqrt(dlY);
    % dlY = avgpool(dlY,2,'Stride',2);
    
    weights = dlarray(params.conv3_1_weight);
    bias = dlarray(params.conv3_1_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv3_2_weight);
    bias = dlarray(params.conv3_2_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv3_3_weight);
    bias = dlarray(params.conv3_3_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    features{4} = dlY;
    
    % stage 4
    weights = dlarray(params.L2pool_3);
    dlY = dlconv(dlY.^2,weights,0,'Stride',2,'Padding',[1, 1; 0, 0]);
    dlY = sqrt(dlY);
    % dlY = avgpool(dlY,2,'Stride',2);
    
    weights = dlarray(params.conv4_1_weight);
    bias = dlarray(params.conv4_1_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv4_2_weight);
    bias = dlarray(params.conv4_2_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv4_3_weight);
    bias = dlarray(params.conv4_3_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    features{5} = dlY;
    
    % stage 5
    weights = dlarray(params.L2pool_4);
    dlY = dlconv(dlY.^2,weights,0,'Stride',2,'Padding',[1, 1; 0, 0]);
    dlY = sqrt(dlY);
    % dlY = avgpool(dlY,2,'Stride',2);
    
    weights = dlarray(params.conv5_1_weight);
    bias = dlarray(params.conv5_1_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv5_2_weight);
    bias = dlarray(params.conv5_2_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    weights = dlarray(params.conv5_3_weight);
    bias = dlarray(params.conv5_3_bias');
    dlY = relu(dlconv(dlY,weights,bias,'Stride',1,'Padding','same'));
    
    features{6} = dlY;
    
    
end
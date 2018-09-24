function [endmembers, P] = run_SPICE()
    
    parameters = SPICEParameters();
    select = input('0. for ExampleData \n1. for Muulf_gulfport... \nChoice: ');
    if (select == 0)
        d = load('ExampleData.mat');
        inputData = d.inputData;
    elseif (select == 1)
        d = load('muufl_gulfport_campus_w_lidar_1.mat');
%         inputData = d.hsi.Data;
%         sz = size(inputData);
%         inputData = transpose(reshape(inputData, [sz(3),sz(1)*sz(2)]));
        inputData = (d.hsi.Data);
        [X,Y,Z] = ndgrid(1:size(inputData,1), 1:size(inputData,2), 1:size(inputData,3));
        pointsize = 30;
        scatter3(X(:), Y(:), Z(:), pointsize, inputData(:));
        
        sz = size(inputData);
        inputData = transpose(reshape(inputData, [ sz(3), sz(1)*sz(2)]));

    end
    
    [endmembers, P] = SPICE(inputData,parameters);
end

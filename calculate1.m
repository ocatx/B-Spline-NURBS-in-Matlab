%%-------------------------------------------------------------------
%% This method is to calculate the number the connected components 
%% and the percent of diffrent type components
%%--------------------------------------------------------------------
clear all
clc

%%read image
I=imread('bw.jpg');

%%convert image to binary image
bwI=im2bw(I,0.5);

%%output the binary image to a file
imwrite(bwI, 'bwnew.jpg');

%%label connected components in 2-D binary image
%%the input parameter 4 specifies 4-connected objects
[L, num]=bwlabel(bwI,4);


%%define three types of connected components
%% small: <=50
%% medium: >50 & <=100
%% large: >100
smallConnectedCompPixel = 0;
mediumConnectedCompPixel = 0;
largeConnectedCompPixel = 0;

smallConnectedCompNum = 0;
mediumConnectedCompNum = 0;
largeConnectedCompNum = 0;

%%go through all the connected components
for j=1:num
    [r,c] = find(L==j)
    connectedCompSize(j) = length(r);
    if connectedCompSize(j)<100000
        if connectedCompSize(j)<=50
            smallConnectedCompPixel = smallConnectedCompPixel + connectedCompSize(j);
            smallConnectedCompNum = smallConnectedCompNum + 1;
        elseif connectedCompSize(j)>50 & connectedCompSize(j)<=100
            mediumConnectedCompPixel = mediumConnectedCompPixel + connectedCompSize(j);
            mediumConnectedCompNum = mediumConnectedCompNum + 1;
        elseif connectedCompSize(j)>100
            largeConnectedCompPixel = largeConnectedCompPixel + connectedCompSize(j);
            largeConnectedCompNum = largeConnectedCompNum + 1;
        end
    end    
end

imageSize = size(bwI);
totalImagePixel = imageSize(1)*imageSize(2);
smallConnectedCompPercent = smallConnectedCompPixel/totalImagePixel;
mediumConnectedCompPercent = mediumConnectedCompPixel/totalImagePixel;
largeConnectedCompPercent = largeConnectedCompPixel/totalImagePixel;
allConnectedCompPercent = (smallConnectedCompPixel + mediumConnectedCompPixel +largeConnectedCompPixel)/totalImagePixel;

%%output the result to file result.txt
fid = fopen('result.txt', 'w');
fprintf(fid, '==========number of connected components ==========\r\n');
fprintf(fid, 'allConnectedCompNum       -- %d\r\n', num);
fprintf(fid, 'smallConnectedCompNum     -- %d\r\n', smallConnectedCompNum);
fprintf(fid, 'mediumConnectedCompNum    -- %d\r\n', mediumConnectedCompNum);
fprintf(fid, 'largeConnectedCompNum     -- %d\r\n', largeConnectedCompNum);

fprintf(fid, '\r\n\r\n==========size of connected components ==========\r\n');
fprintf(fid, 'totalImagePixel            -- %d\r\n', totalImagePixel);
fprintf(fid, 'allConnectedCompPixel      -- %d\r\n', smallConnectedCompPixel + mediumConnectedCompPixel + largeConnectedCompPixel);
fprintf(fid, 'smallConnectedCompPixel    -- %d\r\n', smallConnectedCompPixel);
fprintf(fid, 'mediumConnectedCompPixel   -- %d\r\n', mediumConnectedCompPixel);
fprintf(fid, 'largeConnectedCompPixel    -- %d\r\n', largeConnectedCompPixel);

fprintf(fid, '\r\n\r\n==========percent of connected components ==========\r\n');
fprintf(fid, 'allConnectedCompPercent       -- %d%%\r\n', allConnectedCompPercent*100);
fprintf(fid, 'smallConnectedCompPercent     -- %d%%\r\n', smallConnectedCompPercent*100);
fprintf(fid, 'mediumConnectedCompPercent    -- %d%%\r\n', mediumConnectedCompPercent*100);
fprintf(fid, 'largeConnectedCompPercent     -- %d%%\r\n', largeConnectedCompPercent*100);

fclose('all');

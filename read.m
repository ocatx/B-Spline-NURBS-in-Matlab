% Purpose: read the *.mat file for fiber boundary (one slice) and output only
% the coordinates of the boundary points
%
% Input: *.mat file
% Ouput: specified output file
% Usage: read('infile.in','outfile.out')
%
% Xuefeng (Sean) Zhao, IUPUI
% Copyright (c) 2010
%
function []=read(infile)
  fileID=fopen(infile,'r');
  nopid=fopen('nums_of_points.out','wt');
  l=1;
  while (~feof(fileID))
    tline = fgets(fileID);
    [A,count]=sscanf (tline, '%f %f %f %*f %*f %f %f %f %f %*f %*f %*f %*f %*f %*f %*f %*f %*f %f %f %f %f %f %*f %*f %*f %*f %*f %*f %*f %*f %*s %*s %*s %d');
    npoints = A(count);
    if (npoints ~= 0)
    remain = tline;
    sstr = '0.000000000,0.000000000,0.00000000';
    l0 = length(sstr);

% contruct a cell array 
    j = 1;
    while (j <= npoints)
      cstrpts(j) = cellstr(sstr);
      j = j + 1;
    end

% parse the lines to coordinate triplets (string)
    i = 1;
    while true
       [str, remain] = strtok(remain, '()');
       if isempty(str),  break;  end
       if (length(str) <= l0) & (length(str) > 1),
           %disp(sprintf('%s', str));
           cstrpts(i) = cellstr(str);
           disp(cstrpts{i});
           i=i+1;
       end
    end


% convert string to numerics (row vectors)
    points = cell(npoints,1);
    for k=1:npoints
        points{k} = str2num(cstrpts{k});
    end


% output the point coodinates
    outname = sprintf('slice_%d.txt',l)
    fid = fopen(outname,'wt');
    %fid = fopen(outfile,'wt');
    for k = 1:npoints
        fprintf(fid,'%10.4f %10.4f %10.4f \n', points{k}); 
    end
    fprintf(fid,'%10.4f %10.4f %10.4f', points{1}); 
    fclose(fid);
    fprintf(nopid,'%d\n', npoints);  
    l=l+1;
    end
  end
  fclose(fileID)
  fclose(nopid)
end

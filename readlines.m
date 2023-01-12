fileID=fopen('data.mat','r');
l=1;
while (~feof(fileID))
tline = fgets(fileID);
[A,count]=sscanf (tline, '%f %f %f %*f %*f %f %f %f %f %*f %*f %*f %*f %*f %*f %*f %*f %*f %f %f %f %f %f %*f %*f %*f %*f %*f %*f %*f %*f %*s %*s %*s %d');
npoints = A(count);
remain = tline;
sstr = '10.44280000,4.328730000,14.15160000';
l0 = length(sstr);

j = 1;
while (j <= npoints)
    cstrpts(j) = cellstr(sstr);
    j = j + 1;
end

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
%fclose('all');

points = cell(npoints,1);
for k=1:npoints
    points{k} = str2num(cstrpts{k});
end
outname = sprintf('slice_%d.txt',l)
fid = fopen(outname,'wt');
for k = 1:npoints
    fprintf(fid,'%10.4f %10.4f %10.4f \n', points{k}); 
end
fclose(fid);
l=l+1;
end

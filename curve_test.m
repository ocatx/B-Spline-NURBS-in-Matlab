points = dlmread('file.txt',','); % read all the points from text file
pointsT = points'; % get the transpose of the read points

p1 = [4.0 44.0;
      1.0 7.0;
      0.0 0.0];
crv1 = nrbmak(p1, [0 0 1 1]);


% the following gets the point coordinates of each curve
for k = 1:10,
    for n = 1:18,
        for m = 1:3,
            r = k - 1;
            pnts(m,n,k) = pointsT(m,r*18+n);
        end
    end
end

p2 = [2.0 4.0;
      2.0 4.0;
      0.0 0.0];
crv2 = nrbmak(p2, [0 0 1 1]);

p3 = [pnts(1,1,1)*0.1 pnts(1,18,1)*0.1;
      pnts(2,1,1)*0.1 pnts(2,18,1)*0.1;
      pnts(3,1,1) pnts(3,18,1)];
crv3 = nrbmak(p3, [0 0 1 1]);

p4 = [40.9607*0.1 44.4606*0.1;
      3.6896*0.1  6.6809*0.1;
      0.0     0.0];
crv4 = nrbmak(p4, [0 0 1 1]);

p5 = [40.0 44.0;
      4.0 7.0;
      0.0 0.0];
crv5 = nrbmak(p5, [0 0 1 1]);

for k = 1:10  
    lin(k) = nrbline(pnts(:,1,k),pnts(:,18,k));
end

for k = 1:10
    for m = 1:3
        vec(m,k) = pnts(m,18,k) - pnts(m,1,k);
    end
end
%pnts(:,:,1) = [16.630554 15.573772 14.791847 14.398629 14.280268 14.161907 13.768689 12.986764 11.929981 10.873199 10.091274 9.698056 9.579695 9.461334 9.068116 8.286191 7.229409;
%        26.565552 26.557714 26.859757 27.600038 28.650200 29.700362 30.440644 30.742687 30.734848 30.727010 31.029053 31.769334 32.819497 33.869659 34.609940 34.911983 34.904145;
%        0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
%pnts(:,:,2) = [27.589417 28.032600 28.639018 29.476282 30.476779 31.477277 32.314541 32.920958 33.364142 33.807326 34.413743 35.251007 36.251504 37.252002 38.089266 38.695683 39.138867;
%        11.152649 12.112044 12.690745 12.731063 12.390688 12.050313 12.090632 12.669333 13.628728 14.588122 15.166823 15.207142 14.866767 14.526392 14.566710 15.145411 16.104806;
%        0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
for j=1:10,
  crv(j) = nrbmak(pnts(:,1:17,j),[0 0 0 1/15 2/15 3/15 4/15 5/15 6/15 7/15 8/15 9/15 10/15 11/15 12/15 13/15 14/15 1 1 1]); % make nurbs curve
  plot(crv(j).coefs(1,:),crv(j).coefs(2,:),'ro'); % draw the control points
  hold on;
  nrbplot(crv(j),48); % draw the curve
  hold on;
  %nrbplot(lin(j),48);
end
crvall = {crv(1),crv(2),crv(3),crv(4),crv(5),crv(6),crv(7),crv(8),crv(9),crv(10)};
linall = {lin(1),lin(2),lin(3),lin(4),lin(5),lin(6),lin(7),lin(8),lin(9),lin(10)};
all = {crv1,crv(1),crv(2),crv(3),crv(4),crv(5),crv(6),crv(7),crv(8),crv(9),crv(10),lin(1),lin(2),lin(3),lin(4),lin(5),lin(6),lin(7),lin(8),lin(9),lin(10)};
igesout(crvall,'curve_all');
igesout(linall,'line_all');
for j = 1:10
    srf(j) = nrbextrude(crv(j),[vec(1,j),vec(2,j),vec(3,j)]);
end
%nrbplot(crv1,48);
%hold on;
nrbplot(crv2,48);
%srfall = {srf(1),srf(2),srf(3),srf(4),srf(5),srf(6),srf(7),srf(8),srf(9),srf(10)};
%igesout(srfall,'TestIGES_surface');

%igesout(srfall,'TestIGES_surface');

    


%fid=fopen('file.txt', 'rt');   %open the file, 'rt': read
%title = fgetl(fid);  %read in the header
%for j = 1:10,
%    for k = 1:18,
%        for m = 1:3,
%            points(j,k,m) = fscanf(fid, '%f');
%        end
%    end
%end

%fclose(fid);   %close the file
%[data,count]=fscanf(fid, '%f',[3,3]);   %read in data%plot(crv1.coefs(1,:),crv1.coefs(2,:),'ro');
%plot(crv2.coefs(1,:),crv2.coefs(2,:),'r+');
%title('Arbitrary Test 2D Curve.');
%hold on;
%plot(crv1.coefs(1,:),crv1.coefs(2,:),'r--');
%plot(crv2.coefs(1,:),crv2.coefs(2,:),'r-');

% plot the nurbs curve
%nrbplot(crv1,48);
%nrbplot(crv2,48);
%hold off;


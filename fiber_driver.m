% Curve fitting application using B-spline
%   -- reconstructing the 3D geometry of collagen fibers
%
%    X. Zhao
%    Copyright (c) 2009
%
%
% inputs:
% ns   :  number of sections (slices) to reconstruct  
% np(ns):  number of points in each section to be fit to
% r = 3:  3D problem
% p = 3:  degree of the curve
% Q(r,n): coordinate array of the points (will be read from data files)
%
% read from file the number of points in each section to be fit to
ns = 122; % 122 sections in total to process
np = dlmread('nums_of_points.txt'); % read numbers of points
r = 3; % 3D problem
p = 3; % degree 3 
% read the coordinatearray from text
%
all_curves={}; % initialize a null cell to store all curves 
for j = 1:ns
    fname = sprintf('slice_%d.txt',j); % write section ID to a string
    points = dlmread(fname); % read points
    Q = points';
    [m,U,P]=GlobalCurveInterpClosed(np(j),Q,r,p); % call function to fit points
    crv(j) = nrbmak(P,U); % contruct the curves
    all_curves = [all_curves crv(j)]; % concatenate new curves to the cell of all curves
    plot(Q(1,:),Q(2,:),'r*'); % plot points in 2D x-y space
    hold on;
    nrbplot(crv(j),48); % plot the obtained curve
    hold on;
end
igesout(all_curves,'all_curves'); % export all curves to an IGES file
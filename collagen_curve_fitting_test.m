% Curve fitting application using B-spline
%   -- reconstructing the 3D geometry of collagen fibers
%
%    X. Zhao
%    Copyright (c) 2009
%
%
% inputs:
% n = 15: n+1 (16 here) points to be fit to
% r = 3:  3D problem
% p = 3:  degree of the curve
% Q(r,n): coordinate array of the points (will be read from)
%
% read the coordinate array from text
%
n = 16;
r = 3;
p = 3;
points = dlmread('slice_1.txt');
Q = points';

% call curve fitting subroutine
% input the number of points, n+1, the dimension of the problem
% , r=3 for 3D, the degree of the curve, p, and the coordinates 
% of the points, Q[r,n+1].
%
% return the knot vector, U, and the solved control points, P.
%
[m,U,P]=GlobalCurveInterpClosed(n,Q,r,p);
%[m,U,P]=GlobalCurveInterpOpen(n,Q,r,p);
%[U,P]=UnClampCurve(n,p,U,P)

% construct B-spline curve using the fit results
crv = nrbmak(P,U);

% plot the points to be fit to
plot(Q(1,:),Q(2,:),'r*')
hold on;
% plot the control points
%plot(crv.coefs(1,:),crv.coefs(2,:),'ro');
%title('Fit points using a NURBS curve.');
%hold on;
% plot the control polygon
%plot(crv.coefs(1,:),crv.coefs(2,:),'r--');

% plot the nurbs curve
nrbplot(crv,48);
hold off;
igesout(crv,'slice_1');
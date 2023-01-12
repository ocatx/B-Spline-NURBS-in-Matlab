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
n = 8;
p = 2;
P = [1.0 1.0 0.0 -1.0 -1.0 -1.0 0.0 1.0 1.0;
     0.0 1.0 1.0 1.0 0.0 -1.0 -1.0 -1.0 0.0;
     0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
%Q = [1.0 1.0 0.0 -1.0 -1.0 -1.0 0.0 1.0 1.0;
%     -0.5 1.0 1.0 1.0 0.0 -1.0 -1.0 -1.0 0.5;
%     0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
U = [0.0 0.0 0.0 0.25 0.25 0.5 0.5 0.75 0.75 1.0 1.0 1.0];
%V = [-0.25 -0.25 0.0 0.25 0.25 0.5 0.5 0.75 0.75 1.0 1.25 1.25];
%crv = nrbmak(P,U);
% call curve fitting subroutine
% input the number of points, n+1, the dimension of the problem
% , r=3 for 3D, the degree of the curve, p, and the coordinates 
% of the points, Q[r,n+1].
%
% return the knot vector, U, and the solved control points, P.
%
%[m,U,P]=GlobalCurveInterpOpen(n,Q,r,p)
%[Up,Pp]=UnClampCurve(n,p,U,P)
%[U,P]=UnClampCurve(n,p,U,P)
% construct B-spline curve using the fit results

% plot the control points
plot(crv.coefs(1,:),crv.coefs(2,:),'ro');
title('Fit points using a NURBS curve.');
hold on;
% plot the control polygon
plot(crv.coefs(1,:),crv.coefs(2,:),'r--');

% plot the nurbs curve
%nrbplot(crv,48);
%hold off;
%igesout(crv,'slice_1');
%igesout(crv,'slice_1');
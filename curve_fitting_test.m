% Curve fitting application using B-spline
%
%    X. Zhao
%    Copyright (c) 2009
%
%
% inputs:

n = 5; % n+1 (5 here) points to be fit to
r = 3; % 3D problem
p = 3; % degree of the curve


Q = [  0.0  3.0 -1.0 -4.0 -4.0 0.0;
       0.0  4.0  4.0  0.0 -3.0 0.0;
       0.0  0.0  0.0  0.0  0.0 0.0];

% call curve fitting subroutine
% input the number of points, n+1, the dimension of the problem
% , r=3 for 3D, the degree of the curve, p, and the coordinates 
% of the points, Q[r,n+1].
%
% return the knot vector, U, and the solved control points, P.
%
[m,U,P]=GlobalCurveInterpOpen(n,Q,r,p)

% construct B-spline curve using the fit results
crv = nrbmak(P,U);

% plot the points to be fit to
plot(Q(1,:),Q(2,:),'r*')
hold on;
% plot the control points
plot(crv.coefs(1,:),crv.coefs(2,:),'ro');
title('Fit points using a NURBS curve.');
hold on;
% plot the control polygon
plot(crv.coefs(1,:),crv.coefs(2,:),'r--');

% plot the nurbs curve
nrbplot(crv,48);
hold off;
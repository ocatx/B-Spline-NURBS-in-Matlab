%function GlobalCurveInterp(n,Q,r,p,m,U,P)
% Purpose: Fit a set of points using NURBS curves
%
%    input:
%      n - n+1 points are to be fit to
%      Q - points (vectors) to be fit to
%      r - number of coordinates (=3 for 3D problem)
%      p - degree of the curve
%    output:
%      m - number of control points
%      U - knot vector
%      P - control points (vectors)
%
%    Algorithm A9.1 from 'The NURBS Book' p.369
%
%    Code written by Xuefeng Zhao
%    Copyright (c) 2009
%
n = 4; % five points
r = 3; % 2D problem
p = r + 1; % p >= r + 1


%Q = [ 0  0]; % coordinates of the first point
%Q(:,:,2) = [ 3  4]; % coordinate of the second point
%Q(:,:,3) = [-1  4];
%Q(:,:,4) = [-4  0];
%Q(:,:,5) = [-4 -3];
Q = [  0.0  3.0 -1.0 -4.0 -4.0;
       0.0  4.0  4.0  0.0 -3.0;
       0.0  0.0  0.0  0.0  0.0 ];
    
m = n + p + 1;

% compute the uk; eq. (9.5)

uk(1) = 0;
uk(n+1) = 1;
d = 0.0; % initialize the chord length
for j = 1:n % numbering of vectors starts from 1, i.e., the vector from the first point to the second point is vQ(1)
%  vQ(:,:,j) = Q(:,:,j+1) - Q(:,:,j); % vectors connecting adjacent points
%  vQnorm(j) = norm(vQ(:,:,j)); % compute the norm of the vectors
  for k = 1:r
    vQ(k) = Q(k,j+1) - Q(k,j); % vectors connecting adjacent points
  end
  vQnorm(j) = norm(vQ(:)); % compute the norm of the vectors
  d = d + vQnorm(j); % add to the chord length
end

for j = 2:n
  uk(j) = uk(j-1) + vQnorm(j-1)/d;
end
function [m,U,P]=GlobalCurveInterpOpen(n,Q,r,p)
%
% Purpose: Fit a set of points using open NURBS curves
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
%    X. Zhao
%    Copyright (c) 2009
%
   
m = n + p + 1;

% compute the uk; eq. (9.5)

uk(1) = 0;
uk(n+1) = 1;
d = 0.0; % initialize the chord length
for j = 1:n % numbering of vectors starts from 1, i.e., the vector from the first point to the second point is vQ(1)
  for k = 1:r
    vQ(k) = Q(k,j+1) - Q(k,j); % vectors connecting adjacent points
  end
  vQnorm(j) = norm(vQ(:)); % compute the norm of the vectors
  d = d + vQnorm(j); % add to the chord length
end

for j = 2:n
  uk(j) = uk(j-1) + vQnorm(j-1)/d;
end

% compute the knot vector U (eq. (9.8))

for j = 1:p+1
  U(j) = 0; % u_0=...=u_p=0
  U(m-p+j) = 1; % u_{m-p}=...=u_m=1
end

for j = 2:n-p+1
  uksum = 0.0; % initialize the summation of uk in eq. (9.8)
  for k = j:j+p-1
    uksum = uksum + uk(k); 
  end
  U(j+p) = uksum/p; % eq. (9.8)
end

% initialize array A to zero
A=zeros(n+1,n+1);
for j = 1:n+1
    span = findspan(n,p,uk(j),U);
    A(j,span-p+1:span+1)=basisfun(span,uk(j),p,U); % get j-th row
end
X = A\Q'; % solve the equation
P = X';
    
end
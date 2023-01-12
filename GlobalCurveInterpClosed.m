function [m,U,P]=GlobalCurveInterpClosed(n,Q,r,p)
%
% Purpose: Fit a set of points using closed NURBS curves
%
%    input:
%      n - n+1 points are to be fit to
%      Q - points (vectors) to be fit to
%      r - number of coordinates (=3 for 3D problem)
%      p - degree of the curve
%    output:
%      m - number of knots - 1
%      U - knot vector of dimension m+1
%      P - n+p+1 control points (vectors)
%
%    Algorithm A9.1 from 'The NURBS Book' p.369
%
%    X. Zhao
%    Copyright (c) 2009
%   
m = n + p + 3;

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

for j = 1:n-p+2
  uksum = 0.0; % initialize the summation of uk in eq. (9.8)
  for k = j:j+p-1
    uksum = uksum + uk(k); 
  end
  U(j+p+1) = uksum/p; % eq. (9.8)
end

% initialize arrays A(n+1,n+1) and Ap(n+3,n+3) to zero
A=zeros(n+1,n+1);
Ap=zeros(n+3,n+3);
for j = 1:n+1
    span = findspan(n+2,p,uk(j),U); % n+3 control points
    A(j,span-p+1:span+1)=basisfun(span,uk(j),p,U); % get j-th row
end
%
% compute the unit tangent direction at the starting and end point
%
T = (Q(:,2) - Q(:,n))/norm(Q(:,2) - Q(:,n));
%
% estimate the first derivative at the starting and end point
% see Eq. (9.18) on Page 373
%
D = T*d; 
%
% set up equations (9.11) and (9.12) on Page 371
%
temp1 = D*U(p+2)/p;
temp2 = D*(1-U(m-p))/p;
%
% copy the elements of A to Ap according to their corresponding location
%
for j = 1:n+3
   Ap(1,j) = A(1,j);
   Ap(n+3,j) = A(n+1,j);
end
%
for j = 1:n+3
    for k = 3:n+1
       Ap(k,j) = A(k-1,j);
    end
end
%
% insert the two additional equations (9.11) and (9.12) to the
% second and next to the last equations of original equation, 
% i.e., add elements to the second the next to the last rows
% of matrix Ap.
%
Ap(2,1) = -1.0;
Ap(2,2) =  1.0;
Ap(n+2,n+2) = -1.0;
Ap(n+2,n+3) =  1.0;
%
% reconstruct the RHS of the equations
%
R(:,1) = Q(:,1);
R(:,n+3) = Q(:,n+1);
for j = 3:n+1
    R(:,j) = Q(:,j-1);
end
%
R(:,2) = temp1(:);
R(:,n+2) = temp2(:);
%
X = Ap\R'; % solve the equations
%
P = X' % transpose the solution matrix to get the control points
end


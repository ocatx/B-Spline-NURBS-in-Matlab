%function [m,U,P]=GlobalCurveInterpClosed(n,Q,r,p)
%
% Purpose: Fit a set of points using closed NURBS curves
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
n = 5; % five points
r = 3; % 2D problem
p = 3;


%Q = [ 0  0]; % coordinates of the first point
%Q(:,:,2) = [ 3  4]; % coordinate of the second point
%Q(:,:,3) = [-1  4];
%Q(:,:,4) = [-4  0];
%Q(:,:,5) = [-4 -3];
Q = [  0.0  3.0 -1.0 -4.0 -4.0 0.0;
       0.0  4.0  4.0  0.0 -3.0 0.0;
       0.0  0.0  0.0  0.0  0.0 0.0];
%Q = [  3.0 -1.0 -4.0 -4.0 0.0 3.0;
%       4.0  4.0  0.0 -3.0 0.0 4.0;
%       0.0  0.0  0.0  0.0 0.0 0.0];
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

% initialize array A(n+3,n+3) to zero
A=zeros(n+1,n+1);
Ap=zeros(n+3,n+3);
for j = 1:n+1
    span = findspan(n+2,p,uk(j),U); % n+3 control points
    A(j,span-p+1:span+1)=basisfun(span,uk(j),p,U); % get j-th row
end
%
% compute the unit tangent direction at the starting and end point
%
T=(Q(:,n) - Q(:,2))/norm((Q(:,n) - Q(:,2)));
%
% estimate the first derivative at the starting and end point
% see Eq. (9.18) on Page 373
%
D = d*T; 
%
% set up equations (9.11) and (9.12) on Page 371
%
temp1 = -D*U(p+2)/p;
temp2 = -D*(1-U(m-p))/p;
%
% copy the elements of A to Ap according to their right positions
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
R(:,2) = temp1(:);
R(:,n+2) = temp2(:);
for j = 1:r
    X = Ap\R'; % solve the equation
end
P = X';

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
%hold off;
igesout(crv,'slice_1');

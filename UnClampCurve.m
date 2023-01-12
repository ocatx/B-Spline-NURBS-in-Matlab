function [U,Pw]=UnClampCurve(n,p,U,Pw)
%
% Purpose: Unclamp a clamped curve
%
%    input:
%      n - n+1
%      p - degree
%      U - knot vector of the clamped curve
%      Pw - control points of the clamped curve
%
%    output:
%      Up - knot vector of the unclamped curve
%      Pwp - control points of the unclamped curve
%
%    Algorithm A12.1 from 'The NURBS Book' p.577
%
%    X. Zhao
%    Copyright (c) 2009
%
% ===============================================
% Unclamp at left end
%
for j = 0:p-2
    U(p-j) = U(p-j+1) - (U(n-j+2) - U(n-j+1));
    k = p-1;
    for l = j:-1:0
        alfa = (U(p+1)-U(k+1))/(U(p+l+2)-U(k+1));
        Pw(:,l+1) = (Pw(:,l+1)-alfa*Pw(:,l+2))/(1.0-alfa);
        k = k-1;
    end
end
%
% Set first knot
%
U(1) = U(2) - (U(n-p+3) - U(n-p+2));
%
% ===============================================
%
% +++++++++++++++++++++++++++++++++++++++++++++++
% Unclamp at right end
%
for j = 0:p-2
    U(n+j+3) = U(n+j+2) + (U(p+j+2) - U(p+j+1));
    for l = j:-1:0
        alfa = (U(n+2)-U(n-l+1))/(U(n-l+j+3)-U(n-l+1));
        Pw(:,n-l+1) = (Pw(:,n-l+1)-(1.0-alfa)*Pw(:,n-l))/alfa;
    end
end
%
% Set first knot
%
U(n+p+2) = U(n+p+1) + (U(2*p+1) - U(2*p));
%
% +++++++++++++++++++++++++++++++++++++++++++++++
end

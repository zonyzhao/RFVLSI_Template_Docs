
%set upper and lower bound
%   [Wm fg Vi Witv Fgitv Ritc]
%lb = [1   40   1   1   30]
%ub = [10  180  30  30  80]

lb = [1    40	0.3 1   1];
ub = [5   180	1.5 20  30];
xin = [2   125	1   6   10]';

sigma = ((ub - lb)*(1/3))';
%set guesaoptimsetss value


opts.LBounds = lb';
opts.UBounds = ub';
opts.MaxIter = 20;
opts.DispModulo = 10;

disp(xin);
%disp('temp');
%disp(temp);
tic;
[x fval] = cmaes('Optimize_six_stage', xin, sigma, opts);

% if (ww==1)
%csvwrite('C:\Users\Chatrpol\Research\Battery charger\MATLAB\cmaes_fval.csv',fval);
%csvwrite('C:\Users\Chatrpol\Research\Battery charger\MATLAB\cmaes_X.csv',x);
% else 
%   csvwrite('D:/NCTU 5054 Sigma delta mod/Hw6/cs200SR300.csv',FOM);   
% end
t=toc;
disp('fval = ');
disp(fval);
disp('x = ');
disp(x);
disp('time to compute = ');
disp(t);
%   
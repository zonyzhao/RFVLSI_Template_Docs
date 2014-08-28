% This program executes the model fitting by minimizing the s-parameter
% difference between the target and the model. The work is done by lsqnonlin
% function which finds the minimum value returned by the user-defined
% function.

% Begin: Main
clear;
display('Begin: Main');

Port_Num = 2;

% Begin: Generate sp data from the Target (schematic_Target.ocn)
Spectre = unix('ocean -restore /home/childish/OA65/Ocean_Scripts/tb_xfm2p_1to1_OD90/schematic_Target.ocn'); % Run SpectreRF
while (Spectre~=0)
end
Target = 'Target.txt';                                                      % Input File
Target_arranged = 'Target_arranged.txt';                                    % Output File
Target_result = Func_File_Arrangement(Target, Target_arranged, Port_Num);      % File Arrangement Function
% End: Generate sp data from the Target (schematic_Target.ocn)

% Begin: Optimization
% Begin: Define input variables and their bounds
% [C12; C13; C14; C24; C32; C34; Cs1; Cs2; Cs3; Cs4; Cs5; Cs6; Cs7; Cs8; k; L1; L2; L3; L4; R1; R2; R3; R4; Rs5; Rs6; Rs7; Rs8]
InputVar = [0; 0; 0; 0; 0; 0; 8.1; 8.1; 7.8; 7.8; 4.6; 4.6; 5.3; 5.3; 0.72;   	1; 10; 1; 10;       1.3; 6.7; 3.4; 0.5;     2.3; 2.3; 2.5; 2.5];                                                       
LowerBound = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0;                      0; 0; 0; 0;         0; 0; 0; 0;             0; 0; 0; 0];          
UpperBound = [10; 10; 10; 10; 10; 10; 10; 10; 10; 10; 10; 10; 10; 10; 1;        4; 20; 4; 20;       5; 10; 5; 10;           5; 5; 5; 5];
Options = Optimset('TolX', 1e-3, 'TolFun', 1e-3, 'DiffMinChange', 1e-2, 'DiffMaxChange', 20, 'MaxFunEvals', 1000, 'MaxIter', 2000);
% End: Define input variables and their bounds

% Begin: lsqnonlin
tic;                                                                        % Compute execution time
XMIN = lsqnonlin(@(x) Func_Model_Fitting(x, Port_Num), InputVar, LowerBound, UpperBound, Options);
t = toc;                                                                    % Compute execution time
% End: lsqnonlin
% End: Optimization

disp('XMIN = ');
disp(XMIN);
disp('Time to compute = ');
disp(t);

% Begin: Print Result Data
Result = fopen('Result.txt','w');
fprintf(Result, 'C12 = %f fF \n', XMIN(1));
fprintf(Result, 'C13 = %f fF \n', XMIN(2));
fprintf(Result, 'C14 = %f fF \n', XMIN(3));
fprintf(Result, 'C24 = %f fF \n', XMIN(4));
fprintf(Result, 'C32 = %f fF \n', XMIN(5));
fprintf(Result, 'C34 = %f fF \n', XMIN(6));
fprintf(Result, 'Cs1 = %f fF \n', XMIN(7));
fprintf(Result, 'Cs2 = %f fF \n', XMIN(8));
fprintf(Result, 'Cs3 = %f fF \n', XMIN(9));
fprintf(Result, 'Cs4 = %f fF \n', XMIN(10));
fprintf(Result, 'Cs5 = %f fF \n', XMIN(11));
fprintf(Result, 'Cs6 = %f fF \n', XMIN(12));
fprintf(Result, 'Cs7 = %f fF \n', XMIN(13));
fprintf(Result, 'Cs8 = %f fF \n', XMIN(14));
fprintf(Result, 'k = %f \n', XMIN(15));
fprintf(Result, 'L1 = %f pH \n', XMIN(16)*100);
fprintf(Result, 'L2 = %f pH \n', XMIN(17)*100);
fprintf(Result, 'L3 = %f pH \n', XMIN(18)*100);
fprintf(Result, 'L4 = %f pH \n', XMIN(19)*100);
fprintf(Result, 'R1 = %f ohms \n', XMIN(20));
fprintf(Result, 'R2 = %f ohms \n', XMIN(21));
fprintf(Result, 'R3 = %f ohms \n', XMIN(22));
fprintf(Result, 'R4 = %f ohms \n', XMIN(23));
fprintf(Result, 'Rs5 = %f ohms \n', XMIN(24)*100);
fprintf(Result, 'Rs6 = %f ohms \n', XMIN(25)*100);
fprintf(Result, 'Rs7 = %f ohms \n', XMIN(26)*100);
fprintf(Result, 'Rs8 = %f ohms \n', XMIN(27)*100);
fprintf(Result, 'Computation Time = %e \n', t);
fclose(Result);
% End: Print Result Data

display('End: Main');
% End: Main
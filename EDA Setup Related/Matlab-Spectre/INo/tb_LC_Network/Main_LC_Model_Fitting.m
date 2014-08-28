% This program executes the model fitting by minimizing the s-parameter
% difference between the target and the model. The work is done by cmaes
% function which finds the minimum value returned by the user-defined
% function. A simple LC network model fitting case is carried out.
%%%%% Begin: Main %%%%%
clear;
display('Begin: Main');

%%%%% Begin: Generate sp data from the Target (schematic.ocn) %%%%%
Spectre = unix('ocean -restore /home/childish/OA65/Ocean_Scripts/tb_LC_Network/schematic.ocn'); % Run SpectreRF
while (Spectre~=0)
end
schematic_sp = 'schematic_sp.txt';                                          % Input File
schematic_sp_arranged = 'schematic_sp_arranged.txt';                        % Output File
schematic_sp_result = Func_File_Arrangement(schematic_sp, schematic_sp_arranged); % File Arrangement Function
%%%%% End: Generate sp data from the Target (schematic.ocn) %%%%%

%%%%% Begin: Optimization %%%%%
%%%%% Begin: Define input variables and their bounds %%%%%
LowerBound = [0.5;1];                                                       % Should be a column vector
UpperBound = [2;3];                                                         % Should be a column vector
InputVar = [0.8;2.2];                                                         % Should be a column vector
sigma = ((UpperBound - LowerBound)*(1/3));                                  % Should be a column vector
opts.LBounds = LowerBound;                                                  % opts value setup
opts.UBounds = UpperBound;                                                  % opts value setup
opts.MaxIter = 20;                                                          % opts value setup
opts.DispModulo = 10;                                                       % opts value setup
%%%%% End: Define input variables and their bounds %%%%%

%%%%% Begin: cmaes %%%%%
%%%%% cmaes finds the minimum value returned by 'Func_LC_Model_Fitting' %%%%%
tic;                                                                        % Compute execution time
[XMIN FMIN COUNTEVAL STOPFLAG OUT BESTEVER] = cmaes('Func_LC_Model_Fitting', InputVar, sigma, opts);
t = toc;                                                                    % Compute execution time
%%%%% End: cmaes %%%%%
%%%%% End: Optimization %%%%%

disp('XMIN = ');
disp(XMIN);
disp('FMIN = ');
disp(FMIN);
disp('COUNTEVAL = ');
disp(COUNTEVAL);
disp('Time to compute = ');
disp(t);

%%%%% Begin: Print Result Data %%%%%
Result = fopen('Result.txt','w');
fprintf(Result, 'XMIN = %f \n\n', XMIN);
fprintf(Result, 'FMIN = %f \n\n', FMIN);
fprintf(Result, 'COUNTEVAL = %f \n\n', COUNTEVAL);
fprintf(Result, 'Computation Time = %e \n\n', t);
fclose(Result);
%%%%% End: Print Result Data %%%%%

display('End: Main');
%%%%% End: Main %%%%%
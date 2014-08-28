% This program executes the model fitting by minimizing the s-parameter
% difference between the target and the model. The work is done by lsqnonlin
% function which finds the minimum value returned by the user-defined
% function. A simple LC network model fitting case is carried out.
%%%%% Begin: Main %%%%%
clear;
display('Begin: Main');

%%%%% Begin: Generate sp data from the Target (schematic.ocn) %%%%%
Spectre = unix('ocean -restore /home/childish/OA65/Ocean_Scripts/tb_LC_Network_lsqnonlin/schematic.ocn'); % Run SpectreRF
while (Spectre~=0)
end
schematic_sp = 'schematic_sp.txt';                                          % Input File
schematic_sp_arranged = 'schematic_sp_arranged.txt';                        % Output File
schematic_sp_result = Func_File_Arrangement(schematic_sp, schematic_sp_arranged); % File Arrangement Function
%%%%% End: Generate sp data from the Target (schematic.ocn) %%%%%

%%%%% Begin: Optimization %%%%%
%%%%% Begin: Define input variables and their bounds %%%%%
InputVar = [1; 1.3];                                                        % Should be a column vector
LowerBound = [0.5; 1];                                                      % Should be a column vector
UpperBound = [2; 3];                                                        % Should be a column vector
Options = Optimset('TolX', 1e-3, 'TolFun', 1e-3, 'DiffMinChange', 1e-1, 'DiffMaxChange', 5, 'MaxFunEvals', 1000, 'MaxIter', 5000);
%%%%% End: Define input variables and their bounds %%%%%

%%%%% Begin: lsqnonlin %%%%%
tic;                                                                        % Compute execution time
XMIN = lsqnonlin(@Func_LC_Model_Fitting_lsqnonlin, InputVar, LowerBound, UpperBound, Options);
t = toc;                                                                    % Compute execution time
%%%%% End: lsqnonlin %%%%%
%%%%% End: Optimization %%%%%

disp('XMIN = ');
disp(XMIN);
disp('Time to compute = ');
disp(t);

%%%%% Begin: Print Result Data %%%%%
Result = fopen('Result.txt','w');
fprintf(Result, 'XMIN = %f \n\n', XMIN);
fprintf(Result, 'Computation Time = %e \n\n', t);
fclose(Result);
%%%%% End: Print Result Data %%%%%

display('End: Main');
%%%%% End: Main %%%%%
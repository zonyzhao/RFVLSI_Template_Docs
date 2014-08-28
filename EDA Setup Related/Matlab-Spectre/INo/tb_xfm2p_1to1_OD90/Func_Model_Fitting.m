% This function computes the difference between model and the tatget
% "Result" (Type: Array) = Difference between model and the target for each frequency
% "InputVar" (Type: Array) = Input variables for the SpectreRF simulation
% "Target" (Type: Array) = Model S parameters
function Result = Func_Model_Fitting(InputVar, Port_Num)                           
    
    % Begin: Arrange file and generate array (Target)
    Target = 'Target.txt';                                                   % Input File
    Target_arranged = 'Target_arranged.txt';                                 % Output File
    Target_result = Func_File_Arrangement(Target, Target_arranged, Port_Num);  % File Arrangement Function
    % End: Arrange file and generate array (Target)
        
    % Begin: Assign input values to input file for SpectreRF simulation
    C12 = InputVar(1)*1e-15;
    C13 = InputVar(2)*1e-15;
    C14 = InputVar(3)*1e-15;
    C24 = InputVar(4)*1e-15;
    C32 = InputVar(5)*1e-15;
    C34 = InputVar(6)*1e-15;
    Cs1 = InputVar(7)*1e-15;
    Cs2 = InputVar(8)*1e-15;
    Cs3 = InputVar(9)*1e-15;
    Cs4 = InputVar(10)*1e-15;
    Cs5 = InputVar(11)*1e-15;
    Cs6 = InputVar(12)*1e-15;
    Cs7 = InputVar(13)*1e-15;
    Cs8 = InputVar(14)*1e-15;
    k = InputVar(15);
    L1 = InputVar(16)*1e-12*100;
	L2 = InputVar(17)*1e-12*100;
    L3 = InputVar(18)*1e-12*100;
	L4 = InputVar(19)*1e-12*100;
    R1 = InputVar(20);
	R2 = InputVar(21);
    R3 = InputVar(22);
	R4 = InputVar(23);
	Rs5 = InputVar(24)*100;
	Rs6 = InputVar(25)*100;
	Rs7 = InputVar(26)*100;
	Rs8 = InputVar(27)*100;
    
    schematic_Fit_InputVar = fopen('schematic_Fit_InputVar.txt', 'w+');
    if schematic_Fit_InputVar ~= -1
        fprintf(schematic_Fit_InputVar, 'C12 \t %e \n', C12);                   % Assign valus to input variables
        fprintf(schematic_Fit_InputVar, 'C13 \t %e \n', C13);                 % "%e" is the scientific notation
        fprintf(schematic_Fit_InputVar, 'C14 \t %e \n', C14);
        fprintf(schematic_Fit_InputVar, 'C24 \t %e \n', C24);
        fprintf(schematic_Fit_InputVar, 'C32 \t %e \n', C32);
        fprintf(schematic_Fit_InputVar, 'C34 \t %e \n', C34);
        fprintf(schematic_Fit_InputVar, 'Cs1 \t %e \n', Cs1);
        fprintf(schematic_Fit_InputVar, 'Cs2 \t %e \n', Cs2);
        fprintf(schematic_Fit_InputVar, 'Cs3 \t %e \n', Cs3);
        fprintf(schematic_Fit_InputVar, 'Cs4 \t %e \n', Cs4);
        fprintf(schematic_Fit_InputVar, 'Cs5 \t %e \n', Cs5);
        fprintf(schematic_Fit_InputVar, 'Cs6 \t %e \n', Cs6);
        fprintf(schematic_Fit_InputVar, 'Cs7 \t %e \n', Cs7);
        fprintf(schematic_Fit_InputVar, 'Cs8 \t %e \n', Cs8);
        fprintf(schematic_Fit_InputVar, 'k \t %e \n', k);
        fprintf(schematic_Fit_InputVar, 'L1 \t %e \n', L1);
		fprintf(schematic_Fit_InputVar, 'L2 \t %e \n', L2);
        fprintf(schematic_Fit_InputVar, 'L3 \t %e \n', L3);
		fprintf(schematic_Fit_InputVar, 'L4 \t %e \n', L4);
        fprintf(schematic_Fit_InputVar, 'R1 \t %e \n', R1);
		fprintf(schematic_Fit_InputVar, 'R2 \t %e \n', R2);
        fprintf(schematic_Fit_InputVar, 'R3 \t %e \n', R3);
		fprintf(schematic_Fit_InputVar, 'R4 \t %e \n', R4);
		fprintf(schematic_Fit_InputVar, 'Rs5 \t %e \n', Rs5);
		fprintf(schematic_Fit_InputVar, 'Rs6 \t %e \n', Rs6);
		fprintf(schematic_Fit_InputVar, 'Rs7 \t %e \n', Rs7);
		fprintf(schematic_Fit_InputVar, 'Rs8 \t %e \n', Rs8);
    end
    fclose(schematic_Fit_InputVar);
    % End: Assign input values to input file for SpectreRF simulation
    
    % Begin: Generate sp data from the model fitting (schematic_Fit.ocn)
    Spectre = unix('ocean -restore /home/childish/OA65/Ocean_Scripts/tb_xfm2p_1to1_OD90/schematic_Fit.ocn'); % Run SpectreRF
    while (Spectre~=0)
    end
    % Begin: Arrange file and generate array (Model Fitting)
    Model = 'schematic_Fit_sp.txt';                              % Input File
    Model_arranged = 'schematic_Fit_sp_arranged.txt';            % Output File
    Model_result = Func_File_Arrangement(Model, Model_arranged, Port_Num); % File Arrangement Function
    % End: Arrange file and generate array (Model Fitting)
    % End: Generate sp data from the model fitting (schematic_Fit.ocn)
    
    % Begin: sp data computation
    Result = abs(Target_result - Model_result);                             % Take positive value (Type: Array)
    % End: sp data computation
    display(Result);

    % Begin: Print the model error value
    Error = sum(Result(:));
	display(Error);
    Result_Error = fopen('Error.txt', 'w+');
    if schematic_Fit_InputVar ~= -1
        fprintf(Result_Error, 'Error: %f \n', Error);
    end
    % End: Print the model error value
    
end
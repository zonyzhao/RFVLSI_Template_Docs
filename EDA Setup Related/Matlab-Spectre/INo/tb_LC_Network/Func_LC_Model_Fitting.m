% This function computes the difference between model and the tatget
% "Result" (Type: Number) = Difference between model and the target
% "InputVar" (Type: Array) = Input variables for the SpectreRF simulation
% "Target" (Type: Array) = Model S parameters
function Result = Func_LC_Model_Fitting(InputVar)                           
        
    %%%%% Begin: Arrange file and generate array (Target) %%%%%
    schematic_sp = 'schematic_sp.txt';                                      % Input File
    schematic_sp_arranged = 'schematic_sp_arranged.txt';                    % Output File
    schematic_sp_result = Func_File_Arrangement(schematic_sp, schematic_sp_arranged); % File Arrangement Function
    %%%%% End: Arrange file and generate array (Target) %%%%%
        
    %%%%% Begin: Assign input values to input file for SpectreRF simulation %%%%%
    L = round(InputVar(1)*10)/10*100*1e-12;                                    	% Unit: H
    C = round(InputVar(2)*10)/10*100*1e-15;                                     % Unit: F
    schematic_Fit_InputVar = fopen('schematic_Fit_InputVar.txt', 'w+');
    if schematic_Fit_InputVar ~= -1
        fprintf(schematic_Fit_InputVar, 'L \t %e \n', L);                   % Assign valus to input variables
        fprintf(schematic_Fit_InputVar, 'C \t %e \n', C);                   % "%e" is the scientific notation
    end
    fclose(schematic_Fit_InputVar);
    %%%%% End: Assign input values to input file for SpectreRF simulation %%%%%
    
    %%%%% Begin: Generate sp data from the model fitting (schematic_Fit.ocn) %%%%%
    Spectre = unix('ocean -restore /home/childish/OA65/Ocean_Scripts/tb_LC_Network/schematic_Fit.ocn'); % Run SpectreRF
    while (Spectre~=0)
    end
    %%%%% Begin: Arrange file and generate array (Model Fitting) %%%%%
    schematic_Fit_sp = 'schematic_Fit_sp.txt';                              % Input File
    schematic_Fit_sp_arranged = 'schematic_Fit_sp_arranged.txt';            % Output File
    schematic_Fit_sp_result = Func_File_Arrangement(schematic_Fit_sp, schematic_Fit_sp_arranged); % File Arrangement Function
    %%%%% End: Arrange file and generate array (Model Fitting) %%%%%
    %%%%% End: Generate sp data from the model fitting (schematic_Fit.ocn) %%%%%
    
    %%%%% Begin: sp data computation %%%%%
    Indicator = abs(schematic_sp_result - schematic_Fit_sp_result);         % Take positive value (Type: Array)
    Result = sum(Indicator(:));                                             % Sum all elements (Type: Number)
    %%%%% End: sp data computation %%%%%
    display(Result);
    
end
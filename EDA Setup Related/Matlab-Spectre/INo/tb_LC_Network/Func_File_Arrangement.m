% This function rearranges the sp file generated by SpectreRF to an array
% type file and generate the sp data in array "OutputArray"
% "OutputArray" (Type: Array) = Result data array
% "Input_String" (Type: String) = Name of the input file (Before rearranged)
% "Output_String" (Type: String) = Name of the output file
function OutputArray = Func_File_Arrangement(Input_String, Output_String)
    InputFile = fopen(Input_String);                                        % Open the orginal file from ocnPrint (Call it A)
    OutputFile = fopen(Output_String, 'w');                                 % Open a new file. Save new data to this file (Call it B)
    Count = 0;                                                              % Top 4 lines in File A are not desired
    while ~feof(InputFile)                                                  % Check End of File
        Line = fgetl(InputFile);                                            % Get line information
        Count = Count + 1;                                                  
        if Count > 4                                                        % Top 4 lines in File A are not desired
          	fprintf(OutputFile, '%s\n', Line);                              % Write data to File B
        	continue;                                                       % Move on to the next line (while)
        end
    end
    fclose(InputFile);
    fclose(OutputFile);
    
    %%%%% Begin: Turn the sp file into an array type %%%%%
    Content = fileread(Output_String);
    Parsed = textscan(Content,'%f complex( %f , %f ) complex( %f , %f ) complex( %f , %f ) complex( %f , %f )');
    Parsed_1 = Parsed{1,1};                                                 % Frequency
    Parsed_2 = Parsed{1,2};                                                 % Real(S11)
    Parsed_3 = Parsed{1,3};                                                 % Imag(S11)
    Parsed_4 = Parsed{1,4};                                                 % Real(S12)
    Parsed_5 = Parsed{1,5};                                                 % Imag(S12)
    Parsed_6 = Parsed{1,6};                                                 % Real(S21)
    Parsed_7 = Parsed{1,7};                                                 % Imag(S21)
    Parsed_8 = Parsed{1,8};                                                 % Real(S22)
    Parsed_9 = Parsed{1,9};                                                 % Imag(S22)   
    OutputArray = [Parsed_2+i*Parsed_3 Parsed_4+i*Parsed_5 Parsed_6+i*Parsed_7 Parsed_8+i*Parsed_9];
    %%%%% End: Turn the sp file into an array type %%%%%
end
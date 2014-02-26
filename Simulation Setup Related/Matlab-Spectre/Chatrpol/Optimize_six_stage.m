function fx = Optimize_six_stage(xin)
%------------------------------------------------------
%disp('This program is used to calculated the ideal swith RC circuit ');

%Initial dat
global OMEGA vi0;
%
Wm = round(xin(1)*10)/10*1e-6;
fg = round(xin(2));
vi = round(xin(3)*10)/10;
Witv = round(xin(4)*10)/10*1e-6;
fgitv = round(xin(5));
%Ritc = round(xin(5)*10)/10*1e-6;


fName = 'out_mat.txt';         %# A file name
fid = fopen(fName,'w+');            %# Open the file
if fid ~= -1
    formatSpec = 'Wmin \t %e\n';
    fprintf(fid,formatSpec,Wm)
    formatSpec = 'fgin \t %u\n';
    fprintf(fid,formatSpec,fg);
	formatSpec = 'viin \t %u\n';
    fprintf(fid,formatSpec,vi);
    formatSpec = 'Witvin \t %e\n';
    fprintf(fid,formatSpec,Witv);
    formatSpec = 'fgitvin \t %u\n';
    fprintf(fid,formatSpec,fgitv);
    %formatSpec = 'Ritcin \t %e\n';
    %fprintf(fid,formatSpec,Ritc);
    fclose(fid);                     %# Close the file
    
end

S = unix('ocean -restore ~/OA65/Ocean_scripts/Harmonic25.ocn');
while (S ~= 0)
end

fid2=fopen('out_pss.txt');
if fid2 ~= -1
%note the order is 'Pout,Pin,Pratio,Iout,Rout'   
    [pssout,count] = fscanf(fid2,'%f %f %f %f %f',5);
      
    fclose(fid2);                     %# Close the file
end
disp(pssout);

fx = -pssout(3);
disp(fx);

end

%=====================  C-R-C circuit Response ===========================

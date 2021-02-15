function data = import_onedof_log(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DATA = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  DATA = IMPORTFILE(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  data = importfile("C:\Users\valer\OneDrive - Politecnico di Milano\MATLAB\AGREE-Adaptive-Control\onedof_log\onedof-esmacat-2021-02-03-17-25-17.csv", [3, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 03-Feb-2021 18:06:02

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [3, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 15);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["J_command", "J_status", "J_elapsed_time_ms", "J_0_position_rad", "J_0_velocity_rad_s", "J_0_velocity_rad_s_driver", "T_0_torque_loadcell", "T_0_torque_des", "T_0_torque_grav", "I_0_position_des_rad", "I_0_stiffness", "I_0_damping", "E_0_position_des_rad", "E_0_stiffness", "E_0_damping"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
data = readtable(filename, opts);

end
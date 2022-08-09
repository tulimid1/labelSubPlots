function spLabels = labelSubPlots(varargin)
%{
labelSubPlots - Assign a letter to each subplot in ascending order of
subplots 

INPUTS:
varargin:
    figH: figure handle, (default: current figure handle)
    assignments: character vector of text to assign, (default: ascending 
    capital letters)
    assignPosX: x position for each label, (default: 0.05)
    assignPosY: y position for each label, (default: 0.99) 

OUTPUT:
spLabels: label handles 
%}

%% Input parse and check %% 
p = inputParser();
%% Validation Functions
fighandle = getFigureHandle(varargin);
axs = flip(findobj(fighandle, 'type', 'axes'));
nAxs = length(axs); 
assignmentValidationFcn = @(x) any(ischar(x)) & length(x) == nAxs; 
positionValidationFcn = @(x) any(isreal(x)) & any(isnumeric(x)) & ...
    any(isfinite(x)) & any(~isnan(x)) & length(x)==nAxs;
%% Parse
% figure handle 
addParameter(p, 'figH', gcf(), @(x) strcmpi(class(x), 'matlab.ui.Figure')); 
% assignment 
addParameter(p, 'assignments', 'A':char('A'+nAxs-1), assignmentValidationFcn);
% assignment positions
varargin = convertScalar2Vector(varargin, 'assignPosX', nAxs);
addParameter(p, 'assignPosX', repelem(0.05, nAxs), positionValidationFcn); 
varargin = convertScalar2Vector(varargin, 'assignPosY', nAxs);
addParameter(p, 'assignPosY', repelem(0.98, nAxs), positionValidationFcn);

parse(p, varargin{:});

%% Add visuals 
txtParams = {'Units', 'Normalized', 'VerticalAlignment', 'Top'}; 
spLabels = gobjects(nAxs,1);
for iAx = 1:nAxs
    spLabels(iAx) = text(axs(iAx), ...
        p.Results.assignPosX(iAx), p.Results.assignPosY(iAx), ...
        append(p.Results.assignments(iAx), '.'), txtParams{:});
end

end

%% Local functions 
function fighandle = getFigureHandle(varargin)
if any(strcmp(varargin, 'figH'))
    paramIdx = find(strcmpi(varargin, 'figH'));
    fighandle = varargin{paramIdx+1}; 
else
    fighandle = gcf();
end
end

function out = convertScalar2Vector(in, field, n)
out=in;
if any(strcmp(in, field))
    paramIdx = find(strcmpi(in, field));
    if isscalar(in{paramIdx+1})
        out{paramIdx+1} = repelem(in{paramIdx+1}, n);
    end
end
end
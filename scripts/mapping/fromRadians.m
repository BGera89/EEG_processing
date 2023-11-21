function varargout = fromRadians(toUnits, varargin)

varargout = {};
if strcmp(toUnits,'degrees')
    for var = 1:size(varargin,2)
        varargout = [varargout {radtodeg(varargin{var})}];
    end
else
    varargout = varargin;
end

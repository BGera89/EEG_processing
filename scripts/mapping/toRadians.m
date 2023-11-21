function varargout = toRadians(fromUnits, varargin)

varargout = {};
if strcmp(fromUnits,'degrees')
    for var = 1:size(varargin,2)
        varargout = [varargout {degtorad(varargin{var})}];
    end
else
    varargout = varargin;
end

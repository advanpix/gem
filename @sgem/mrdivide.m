% mrdivide - right division A/B
%
% Only simplest cases are supported at the moment
function result = mrdivide(this, varargin)
    % This is a function which involves a second instance of a similar object,
    % so we check if this second instance was also provided
    if length(varargin) ~= 1
        error('Wrong number of arguments in sgem::mrdivide');
    end
    
    % We check that the denominator is a scalar
    if numel(varargin{1}) == 1
        result = this./varargin{1};
        return;
    end
    
    % We call mldivide
    result = mldivide(varargin{1}, this);
end

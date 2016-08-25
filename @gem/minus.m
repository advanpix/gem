% minus - substracts two matrices
function result = minus(this, varargin)
    % This is a function which involves a second instance of a similar object,
    % so we check if this second instance was also provided
    if length(varargin) ~= 1
        error('Wrong number of arguments in gem::minus');
    end

    % We need to check that the operation is possible (the c++
    % library might give bad errors otherwise). So we request the
    % dimensions of each matrix
    size1 = size(this);
    size2 = size(varargin{1});

    if (~isequal(size1, size2)) && (prod(size1) ~= 1) && (prod(size2) ~= 1)
        error('Incompatible size for matrix substraction');
    end

    % Now we also check whether both objects are of type gem,
    % otherwise we convert them
    if ~isequal(class(this), 'gem')
        this = gem(this);
    elseif ~isequal(class(varargin{1}), 'gem')
        varargin{1} = gem(varargin{1});
    end

    % Now we call the substraction procedure. Since the function creates a
    % new object with the result, we keep the corresponding handle...
    newObjectIdentifier = gem_mex('minus', this.objectIdentifier, varargin{1}.objectIdentifier);

    % ...  and create a new matlab object to keep this handle
    result = gem('encapsulate', newObjectIdentifier);
end
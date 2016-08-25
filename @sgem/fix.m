% fix - rounds towards zeros
function result = fix(this)
    % We call the trunc procedure. Since the function creates a
    % new object with the result, we keep the corresponding handle...
    newObjectIdentifier = sgem_mex('trunc', this.objectIdentifier);

    % ...  and create a new matlab object to keep this handle
    result = sgem('encapsulate', newObjectIdentifier);
end

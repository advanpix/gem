% conj - computes the complex conjugate
function result = conj(this)
    % We call the conj procedure. Since the function creates a
    % new object with the result, we keep the corresponding handle...
    newObjectIdentifier = sgem_mex('conj', this.objectIdentifier);

    % ...  and create a new matlab object to keep this handle
    result = sgem('encapsulate', newObjectIdentifier);
end

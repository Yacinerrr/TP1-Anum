// Function 1: f(x) = e^x - x - 2
function y = f1(x)
    y = exp(x) - x - 2;
endfunction

function y = df1(x)
    y = exp(x) - 1;
endfunction

function y = d2f1(x)
    y = exp(x);
endfunction

// Fixed point iterations for f1
function y = g1(x)
    y = exp(x) - 2;
endfunction

function y = g2(x)
    y = log(x + 2);
endfunction

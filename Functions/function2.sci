// Function 2: f(x) = cos(x) - x
function y = f2(x)
    y = cos(x) - x;
endfunction

function y = df2(x)
    y = -sin(x) - 1;
endfunction

function y = d2f2(x)
    y = -cos(x);
endfunction

// Custom fixed point iteration
function y = g_custom(x)
    y = cos(x);
endfunction

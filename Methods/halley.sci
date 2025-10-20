function [y, n] = HALLEY(f, df, d2f, x0, e)
    // Halley's method implementation
    // Input:
    //   f: function
    //   df: first derivative
    //   d2f: second derivative  
    //   x0: initial guess
    //   e: tolerance
    //   max_iter: maximum iterations (optional, default=100)
    // Output:
    //   y: approximate root
    //   n: number of iterations
    //   history: iteration history
    
    
    max_iter = 100;
   
    
    n = 0;
    y = x0;
  
    
    while n < max_iter
        n = n + 1;
        f_y = f(y);
        df_y = df(y);
        d2f_y = d2f(y);
        
        denominator = 2 * df_y^2 - f_y * d2f_y;
        
        // Check if denominator is zero
        if abs(denominator) < 1e-15 then
            disp('Halley Warning: Denominator too small at iteration ' + string(n));
            break;
        end
        
        y_new = y - (2 * f_y * df_y) / denominator;
     
        
        // Check convergence
        if abs(y_new - y) < e then
            y = y_new;
            break;
        end
        
        y = y_new;
    end
    
    if n == max_iter then
        disp('Halley Warning: Maximum iterations reached');
    end
endfunction

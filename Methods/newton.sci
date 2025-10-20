function [y, n] = NEWTON(f, df, x0, e)
    // Newton's method implementation
    // Input:
    //   f: function
    //   df: derivative function  
    //   x0: initial guess
    //   e: tolerance
    //   max_iter: maximum iterations (optional, default=100)
    // Output:
    //   y: approximate root
    //   n: number of iterations

    
   
    max_iter = 100;
    
    
    n = 0;
    y = x0;
    history = [y];
    
    while n < max_iter
        n = n + 1;
        f_y = f(y);
        df_y = df(y);
        
        // Check if derivative is zero
        if abs(df_y) < 1e-15 then
            disp('Newton Warning: Derivative too small at iteration ,it diverges at the iteration ' + string(n));
            break;
        end
        
        y_new = y - f_y / df_y;
     
        
        // Check convergence
        if abs(y_new - y) < e then
            y = y_new;
            break;
        end
        
        y = y_new;
    end
    
    if n == max_iter then
        disp('Newton Warning: Maximum iterations reached');
    end
endfunction

function [y] = SECANTE(r0, r1, fonc, n)
    // Secant method implementation
    // Input:
    //   r0, r1: initial guesses
    //   fonc: function
    //   n: number of iterations
    // Output:
    //   y: approximate root
    //   history: iteration history
    
    x_prev = r0;
    x_curr = r1;
  
    
    for i = 1:n
        f_prev = fonc(x_prev);
        f_curr = fonc(x_curr);
        
        // Avoid division by zero
        if abs(f_curr - f_prev) < 1e-15 then
            y = x_curr;
            return;
        end
        
        x_next = x_curr - f_curr * (x_curr - x_prev) / (f_curr - f_prev);
       
        
        x_prev = x_curr;
        x_curr = x_next;
    end
    
    y = x_curr;
endfunction

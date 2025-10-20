function plot_convergence()
    disp(' ');
    disp('=== CONVERGENCE ANALYSIS PLOTS ===');
    disp('1. f(x) = e^x - x - 2');
    disp('2. f(x) = cos(x) - x');
    disp('3. f(x) = x^2 - 2 (sqrt(2))');
    choice = input('Choose function: ');
    
    select choice
    case 1
        f_func = f1; df_func = df1; d2f_func = d2f1;
        func_name = 'e^x - x - 2';
        x0 = 1.0; r0 = 0.5; r1 = 1.5;
        true_root = 1.146193220620583;
    case 2
        f_func = f2; df_func = df2; d2f_func = d2f2;
        func_name = 'cos(x) - x';
        x0 = 0.5; r0 = 0.4; r1 = 0.6;
        true_root = 0.739085133215161;
    case 3
        f_func = f3; df_func = df3; d2f_func = d2f3;
        func_name = 'x^2 - 2';
        x0 = 1.5; r0 = 1.0; r1 = 1.5;
        true_root = sqrt(2);
    else
        disp('Invalid choice!');
        return;
    end
    
    // Generate convergence data
    errors_newton = [];
    errors_secant = [];
    errors_halley = [];
    
    for i = 1:max_iter
        // Newton
        [root_n, iter_n] = NEWTON(f_func, df_func, x0, 1e-12);
        errors_newton(i) = abs(root_n - true_root);
        
        // Secant
        root_s = SECANTE(r0, r1, f_func, i);
        errors_secant(i) = abs(root_s - true_root);
        
        // Halley
        [root_h, iter_h] = HALLEY(f_func, df_func, d2f_func, x0, 1e-12);
        errors_halley(i) = abs(root_h - true_root);
    end
    
    // Plot
    clf();
    iterations = 1:max_iter;
    
    plot(iterations, errors_newton, 'ro-', 'LineWidth', 2, 'MarkerSize', 6);
    plot(iterations, errors_secant, 'bs-', 'LineWidth', 2, 'MarkerSize', 6);
    plot(iterations, errors_halley, 'g^-', 'LineWidth', 2, 'MarkerSize', 6);
    
    xlabel('Iterations', 'fontsize', 3);
    ylabel('Absolute Error', 'fontsize', 3);
    title('Convergence Analysis: ' + func_name, 'fontsize', 3);
    legend(['Newton', 'Secant', 'Halley'], 'upper right');
    grid on;
    
    // Set y-axis to logarithmic scale for better visualization
    gca().log_flags = "lnn";
    
    disp('Convergence plot displayed!');
    input('Press Enter to continue...', 's');
endfunction

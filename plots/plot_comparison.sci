function plot_comparison()
    disp(' ');
    disp('=== METHOD COMPARISON PLOT ===');
    disp('Comparing all methods on all functions...');
    
    clf();
    
    // Test all functions and collect iteration counts
    functions = list(f1, f2, f3);
    derivatives = list(df1, df2, df3);
    second_derivatives = list(d2f1, d2f2, d2f3);
    func_names = ['e^x - x - 2'; 'cos(x) - x'; 'x^2 - 2'];
    initial_guesses = [1.0, 0.5, 1.5];
    secant_pairs = [0.5, 1.5; 0.4, 0.6; 1.0, 1.5];
    
    newton_iters = [];
    secant_iters = max_iter * ones(1, 3); // Secant uses fixed iterations
    halley_iters = [];
    
    for i = 1:3
        [root_n, iter_n] = NEWTON(functions(i), derivatives(i), initial_guesses(i), tolerance);
        [root_h, iter_h] = HALLEY(functions(i), derivatives(i), second_derivatives(i), initial_guesses(i), tolerance);
        
        newton_iters(i) = iter_n;
        halley_iters(i) = iter_h;
    end
    
    // Create bar plot
    x = 1:3;
    bar(x, [newton_iters', secant_iters', halley_iters'], 0.8);
    
    xlabel('Functions', 'fontsize', 3);
    ylabel('Iterations to Converge', 'fontsize', 3);
    title('Method Comparison: Iterations Required', 'fontsize', 3);
    
    // Set x-axis labels
    gca().x_ticks = tlist(["ticks", "locations", "labels"], x, func_names);
    
    legend(['Newton', 'Secant', 'Halley'], 'upper right');
    grid on;
    
    // Add value labels on bars
    for i = 1:3
        for j = 1:3
            select j
            case 1
                value = newton_iters(i);
            case 2
                value = secant_iters(i);
            case 3
                value = halley_iters(i);
            end
            xpos = i + (j-2)*0.25;
            ypos = value + 0.1;
            xstring(xpos, ypos, string(value));
        end
    end
    
    disp('Comparison plot displayed!');
    input('Press Enter to continue...', 's');
endfunction

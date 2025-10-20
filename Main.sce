// Numerical Analysis Lab 1 - Main File with Interactive Menu
// Root Finding Methods Comparison
// Academic Year: 2025-2026

clear; clc;

// Add paths to subdirectories
getd('methods/');
getd('functions/');
getd('plots/');

// Global parameters
tolerance = 1e-8;
max_iter = 20;

function display_menu()
    clc;
    disp('=== NUMERICAL ANALYSIS LAB 1 - INTERACTIVE MENU ===');
    disp(' ');
    disp('1. Test All Methods on All Functions');
    disp('2. Test Specific Function');
    disp('3. Plot Convergence Analysis');
    disp('4. Plot Cobweb Diagrams');
    disp('5. Plot Method Comparison');
    disp('6. Change Parameters (Current: tol=' + string(tolerance) + ', max_iter=' + string(max_iter) + ')');
    disp('7. Exit');
    disp(' ');
endfunction

function test_all_functions()
    disp(' ');
    disp('=== TESTING ALL METHODS ON ALL FUNCTIONS ===');
    
    // Test Function 1: e^x - x - 2
    disp(' ');
    disp('1. f(x) = e^x - x - 2');
    x0_f1 = 1.0; r0_f1 = 0.5; r1_f1 = 1.5;
    true_root1 = 1.146193220620583;
    
    [newton_root1, newton_iter1] = NEWTON(f1, df1, x0_f1, tolerance);
    secant_root1 = SECANTE(r0_f1, r1_f1, f1, max_iter);
    [halley_root1, halley_iter1] = HALLEY(f1, df1, d2f1, x0_f1, tolerance);
    
    disp(['   Newton:  ', string(newton_root1), ' (', string(newton_iter1), ' iterations)']);
    disp(['   Secant:  ', string(secant_root1), ' (', string(max_iter), ' iterations)']);
    disp(['   Halley:  ', string(halley_root1), ' (', string(halley_iter1), ' iterations)']);
    disp(['   True:    ', string(true_root1)]);
    
    // Test Function 2: cos(x) - x
    disp(' ');
    disp('2. f(x) = cos(x) - x');
    x0_f2 = 0.5; r0_f2 = 0.4; r1_f2 = 0.6;
    true_root2 = 0.739085133215161;
    
    [newton_root2, newton_iter2] = NEWTON(f2, df2, x0_f2, tolerance);
    secant_root2 = SECANTE(r0_f2, r1_f2, f2, max_iter);
    [halley_root2, halley_iter2] = HALLEY(f2, df2, d2f2, x0_f2, tolerance);
    
    disp(['   Newton:  ', string(newton_root2), ' (', string(newton_iter2), ' iterations)']);
    disp(['   Secant:  ', string(secant_root2), ' (', string(max_iter), ' iterations)']);
    disp(['   Halley:  ', string(halley_root2), ' (', string(halley_iter2), ' iterations)']);
    disp(['   True:    ', string(true_root2)]);
    
    // Test Function 3: x^2 - 2 (sqrt(2))
    disp(' ');
    disp('3. f(x) = x^2 - 2 (for sqrt(2))');
    x0_f3 = 1.5; r0_f3 = 1.0; r1_f3 = 1.5;
    true_root3 = sqrt(2);
    
    [newton_root3, newton_iter3] = NEWTON(f3, df3, x0_f3, tolerance);
    secant_root3 = SECANTE(r0_f3, r1_f3, f3, max_iter);
    [halley_root3, halley_iter3] = HALLEY(f3, df3, d2f3, x0_f3, tolerance);
    
    disp(['   Newton:  ', string(newton_root3), ' (', string(newton_iter3), ' iterations)']);
    disp(['   Secant:  ', string(secant_root3), ' (', string(max_iter), ' iterations)']);
    disp(['   Halley:  ', string(halley_root3), ' (', string(halley_iter3), ' iterations)']);
    disp(['   True:    ', string(true_root3)]);
    
    input('Press Enter to continue...', 's');
endfunction

function test_specific_function()
    disp(' ');
    disp('=== TEST SPECIFIC FUNCTION ===');
    disp('1. f(x) = e^x - x - 2');
    disp('2. f(x) = cos(x) - x');
    disp('3. f(x) = x^2 - 2 (sqrt(2))');
    disp('4. h(x) = e^{-x} + 0.5*x^2');
    choice = input('Choose function (1-4): ');
    
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
    case 4
        f_func = f4; df_func = df4; d2f_func = d2f4;
        func_name = 'e^{-x} + 0.5*x^2';
        x0 = 0.5; r0 = 0.0; r1 = 1.0;
        true_root = 0.351733; // Approximate minimum
    else
        disp('Invalid choice!');
        return;
    end
    
    disp(' ');
    disp('Testing: ' + func_name);
    
    [newton_root, newton_iter] = NEWTON(f_func, df_func, x0, tolerance);
    secant_root = SECANTE(r0, r1, f_func, max_iter);
    [halley_root, halley_iter] = HALLEY(f_func, df_func, d2f_func, x0, tolerance);
    
    disp(['Newton:  ', string(newton_root), ' (', string(newton_iter), ' iterations)']);
    disp(['Secant:  ', string(secant_root), ' (', string(max_iter), ' iterations)']);
    disp(['Halley:  ', string(halley_root), ' (', string(halley_iter), ' iterations)']);
    if choice ~= 4 then
        disp(['True:    ', string(true_root)]);
    end
    
    input('Press Enter to continue...', 's');
endfunction

function change_parameters()
    global tolerance max_iter;
    disp(' ');
    disp('Current parameters:');
    disp(['Tolerance: ', string(tolerance)]);
    disp(['Max iterations: ', string(max_iter)]);
    disp(' ');
    
    new_tol = input('Enter new tolerance (e.g., 1e-8): ');
    new_max_iter = input('Enter new max iterations: ');
    
    if new_tol > 0 then
        tolerance = new_tol;
    end
    if new_max_iter > 0 then
        max_iter = new_max_iter;
    end
    
    disp('Parameters updated!');
    input('Press Enter to continue...', 's');
endfunction

// Main menu loop
while %t
    display_menu();
    choice = input('Enter your choice (1-7): ');
    
    select choice
    case 1
        test_all_functions();
    case 2
        test_specific_function();
    case 3
        plot_convergence();
    case 4
        plot_cobweb();
    case 5
        plot_comparison();
    case 6
        change_parameters();
    case 7
        disp('Goodbye!');
        break;
    else
        disp('Invalid choice! Please try again.');
        input('Press Enter to continue...', 's');
    end
end

function plot_cobweb()
    disp(' ');
    disp('=== COBWEB DIAGRAMS ===');
    disp('1. g(x) = ln(x + 2) for f(x) = e^x - x - 2');
    disp('2. g(x) = cos(x) for f(x) = cos(x) - x');
    disp('3. g(x) = e^x - 2 for f(x) = e^x - x - 2');
    choice = input('Choose function: ');
    
    clf();
    
    select choice
    case 1
        // g(x) = ln(x + 2)
        x = 0:0.01:2;
        g_x = log(x + 2);
        title_text = 'Cobweb: g(x) = ln(x + 2)';
        xlabel_text = 'x_n';
        ylabel_text = 'x_{n+1} = ln(x_n + 2)';
        
    case 2
        // g(x) = cos(x)
        x = 0:0.01:1;
        g_x = cos(x);
        title_text = 'Cobweb: g(x) = cos(x)';
        xlabel_text = 'x_n';
        ylabel_text = 'x_{n+1} = cos(x_n)';
        
    case 3
        // g(x) = e^x - 2
        x = 0:0.01:2;
        g_x = exp(x) - 2;
        title_text = 'Cobweb: g(x) = e^x - 2';
        xlabel_text = 'x_n';
        ylabel_text = 'x_{n+1} = e^{x_n} - 2';
        
    else
        disp('Invalid choice!');
        return;
    end
    
    // Plot cobweb diagram
    plot(x, x, 'k-', 'LineWidth', 2);
    plot(x, g_x, 'r-', 'LineWidth', 2);
    
    xlabel(xlabel_text, 'fontsize', 3);
    ylabel(ylabel_text, 'fontsize', 3);
    title(title_text, 'fontsize', 3);
    legend(['y = x', 'g(x)'], 'lower right');
    grid on;
    
    // Add some cobweb lines for visualization
    if choice == 1 then
        // Example cobweb lines for g(x) = ln(x + 2)
        x_start = 0.5;
        for i = 1:5
            y_start = g2(x_start);
            plot([x_start, x_start], [x_start, y_start], 'b--', 'LineWidth', 1);
            plot([x_start, y_start], [y_start, y_start], 'b--', 'LineWidth', 1);
            x_start = y_start;
        end
    end
    
    disp('Cobweb diagram displayed!');
    input('Press Enter to continue...', 's');
endfunction

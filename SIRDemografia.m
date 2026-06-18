%Modelo SIR con demografía Endémico.
lambda = 100;
beta = 0.00002;
alpha = 0.1;
mu = 0.01;
poblacion = 10000;
f = @(t, x)[lambda-beta*x(1)*x(2)-mu*x(1); beta*x(1)*x(2) - alpha*x(2)-mu*x(2); alpha*x(2)-mu*x(3)];
N = 10000;
intervalo = [0,1000];
x0 = [9999; 1; 0];
[t, X] = RK4(f, N, intervalo, x0);

%% Gráficas

    % Solución en función del tiempo
    figure;
    plot(t, X', 'LineWidth', 1.5);
    xlabel('t');
    ylabel('(S, I, R)');
    title('SIR con Demografía Endémico');
    legend({'S (Susceptibles)', 'I (Infectados)', 'R (Recuperados)'}, 'Location','best');
    grid on;
    exportgraphics(gcf,'SIRDemografiaEnd.pdf', 'ContentType','vector')

    % Diagrama de fases (solo si dimensión >= 2)
    
        figure;
        plot(X(1,:), X(2,:), 'LineWidth', 1.5);
        xlabel('S');
        ylabel('I');
        title('Diagrama de fases S I');
        grid on;
        exportgraphics(gcf,'SIRDemografiaEndFasesSI.pdf', 'ContentType','vector')
        figure;
        plot(X(3,:), X(2,:),'LineWidth', 1.5)
        xlabel('R');
        ylabel('I');
        title('Diagrama de fases R I');
        grid on;
        exportgraphics(gcf,'SIRDemografiaEndFasesRI.pdf', 'ContentType','vector')
    

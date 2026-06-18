%Modelo SIRS Endémico.
beta = 0.0001;
alpha = 0.1;
nu = 0.01;
f = @(t, x)[-beta*x(1)*x(2)+nu*x(3); beta*x(1)*x(2) - alpha*x(2); alpha*x(2) - nu*x(3)];
N = 100000;
intervalo = [0,100];
x0 = [9999; 1; 0];
[t, X] = RK4(f, N, intervalo, x0);

%%REPRESENTACIÓN GRÁFICA

    % Solución en función del tiempo
    figure;
    plot(t, X', 'LineWidth', 1.5);
    xlabel('t');
    ylabel('(S, I, R)');
    title('SIRS endémico');
    legend({'S (Susceptibles)', 'I (Infectados)', 'R (Recuperados)'}, 'Location','best');
    grid on;
    exportgraphics(gcf,'SIRSEnd.pdf', 'ContentType','vector')

    % Diagrama de fases (solo si dimensión >= 2)
    
        figure;
        plot(X(1,:), X(2,:), 'LineWidth', 1.5);
        xlabel('S');
        ylabel('I');
        title('Diagrama de fases S I');
        grid on;
        exportgraphics(gcf,'SIRSEndFasesSI.pdf', 'ContentType','vector')
        figure;
        plot(X(3,:), X(2,:),'LineWidth', 1.5)
        xlabel('R');
        ylabel('I');
        title('Diagrama de fases R I');
        grid on;
        exportgraphics(gcf,'SIRSEndFasesRI.pdf', 'ContentType','vector')
    

function [t, X] = RK4(f, N, intervalo, x0)

    % Extraer extremos del intervalo
    t0 = intervalo(1);
    tf = intervalo(2);

    % Paso de malla
    h = (tf - t0)/(N-1);

    % Vector de tiempos
    t = linspace(t0, tf, N);

    % Dimensión del sistema
    m = length(x0);

    % Inicializar matriz solución
    X = zeros(m, N);
    X(:,1) = x0;

    % Método RK4
    for n = 1:N-1
        k1 = f(t(n), X(:,n));
        k2 = f(t(n) + h/2, X(:,n) + (h/2)*k1);
        k3 = f(t(n) + h/2, X(:,n) + (h/2)*k2);
        k4 = f(t(n) + h,   X(:,n) + h*k3);

        X(:,n+1) = X(:,n) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end

    
end
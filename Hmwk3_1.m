
alpha = 1.0; 
T = 5;
t = linspace(0, T, 1000);
sol = exp(-alpha*t);
tvals = [0.1 0.5 1 2 2.5 3];

figure;
hold on;

for dt = tvals
    y = fe(alpha, dt, T);
    x = linspace(0, T, length(y));
    plot(x, y, 'DisplayName', ['\Delta t = ' num2str(dt)]);
end

plot(t, sol, 'k--', 'DisplayName', 'Exact Solution');
xlabel('Time (t)');
ylabel('Solution (y)');
title('Forward Euler');
legend('Location', 'northeast');
grid on;
hold off;

function y = fe(alpha, dt, T)
    steps = floor(T/dt);
    y = zeros(1, steps + 1);
    y(1) = 1.0;
    for i = 1:steps
        y(i + 1) = y(i) - alpha * dt * y(i);
    end
end
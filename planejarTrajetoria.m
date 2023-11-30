function planejarTrajetoria()

    % Defina as dimensões do robô 3R (comprimentos dos elos)
    L1 = 5; % Comprimento do primeiro elo
    L2 = 3; % Comprimento do segundo elo
    L3 = 2; % Comprimento do terceiro elo
    
    % Defina o ponto de início e destino no espaço de configuração
    q_start = [0, 0, 0]; % Configuração inicial (ângulos das juntas)
    q_goal = [pi/2, pi/4, pi/2]; % Configuração desejada
    
    % Gere uma trajetória interpolada por splines cúbicas no espaço de configuração
    num_points = 100;
    q_interp = zeros(num_points, 3);
    
    for i = 1:3
        q_interp(:, i) = spline([0, num_points], [q_start(i), q_goal(i)], 1:num_points);
    end
    
    % Converta a trajetória interpolada no espaço de configuração para o espaço operacional
    caminho_operacional = zeros(num_points, 3);
    
    for i = 1:num_points
        caminho_operacional(i, :) = cineticaDireta3R(q_interp(i, :), L1, L2, L3);
    end
    
    % Visualize o resultado
    plot3(caminho_operacional(:, 1), caminho_operacional(:, 2), caminho_operacional(:, 3), 'LineWidth', 2);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on;

    function posicao_operacional = cineticaDireta3R(configuracao, L1, L2, L3)
    % Implemente a cinemática direta do robô 3R

    q1 = configuracao(1);
    q2 = configuracao(2);
    q3 = configuracao(3);

    % Cinemática direta
    x = L1 * cos(q1) + L2 * cos(q1 + q2) + L3 * cos(q1 + q2 + q3);
    y = L1 * sin(q1) + L2 * sin(q1 + q2) + L3 * sin(q1 + q2 + q3);
    z = 0; % Assumindo que o robô opera em um plano 2D

    posicao_operacional = [x, y, z];

    end
end


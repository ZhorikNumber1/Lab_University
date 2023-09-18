
 function [theta] = normalEqn(X, y)
% X - Матрица признаков размером (m x n), где m - количество обучающих примеров, n - количество признаков
% y - Вектор результатов размером (m x 1)
% theta - Вектор параметров размером (n x 1)
 %NORMALEQN Computes the closed-form solution to linear regression
 %   NORMALEQN(X,y) computes the closed-form solution to linear
 %   regression using the normal equations.
 % ====================== YOUR CODE HERE ======================
 % Instructions: Complete the code to compute the closed form solution
 %               to linear regression and put the result in theta.
 %
 % ---------------------- Sample Solution ----------------------
theta = zeros(size(X, 2), 1); % Инициализация вектора параметров theta

theta = inv(X' * X) * X' * y; % Вычисление значения theta с использованием нормального уравнения

end







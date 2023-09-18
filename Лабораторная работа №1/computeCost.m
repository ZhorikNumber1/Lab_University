function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
% Initialize some useful values
m = length(y); % number of training examples
% You need to return the following variables correctly
J = 0;
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


%Суммирование поэлементно
for i=1:m
  J=J+((X(i,2)*theta(2)+theta(1)-y(i))^2)/(2*m);
end


% С помощью функции Sum
% Вычислить функцию гипотезы
h_theta = X * theta;

% Вычислить квадратичную ошибку
squared_error = (h_theta - y).^2;

% Квадратичная ошибка
J = sum(squared_error) / (2 * m);


%Векторным способом
% Вычислить функцию гипотезы
h_theta = X * theta;

% Вычислить квадратичную ошибку
squared_error = (h_theta - y).^2;

% квадратичная ошибка
J = sum(squared_error) / (2 * m);


% =========================================================================

end

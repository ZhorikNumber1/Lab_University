%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  linear regression exercise.
%
%  You will need to complete the following functions in this
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear all; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


 %% ================ Part 2: Gradient Descent ================
%Поиск мин alpha и NumIters
theta = ones(3,1); 
NumIters = 100; % Количество итераций градиентного спуска
matrixAlpha = zeros(15, 8); 
Flag = 0; 
ComparablePrice = 0; 
ConstPrice = 293081; 

% Заполнение матрицы matrixAlpha значениями в соответствии с условием, используя матричные операции вместо циклов.
[I, J] = meshgrid(1:size(matrixAlpha, 1), 1:size(matrixAlpha, 2));
matrixAlpha = J ./ (3.^(I-1));

% Основной цикл
for k = 1:50
  for i=1:size(matrixAlpha, 2)
    for j = 1:size(matrixAlpha,1)
       % Градиентный спуск и получение значений theta и J_history
       [theta, J_history] = gradientDescentMulti(X,y,theta,matrixAlpha(j,i), NumIters + k);
       ComparablePrice = theta(1)+theta(2)*1650+theta(3)*3;
       % Проверка условия на разницу между посчитанной ценой и константной ценой
       if (abs(ConstPrice - ComparablePrice) < 1000)
         alpha = matrixAlpha(j,i);
         NumIters = NumIters + k; 
         Flag = 1; % Установка флага прерывания циклов
         fprintf('we found this! Congrats... \n'); % Печать сообщения о найденном значении
         break; 
       else
         theta = ones(3,1); 
       end
    end
    if Flag == 1 
      break; 
    end
  end
  if Flag == 1 
    break; 
  end
end

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha).
%
%               Your task is to first make sure that your functions -
%               computeCost and gradientDescent already work with
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Init Theta and Run Gradient Descent
theta = ones(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, NumIters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
price = theta(1)+theta(2)*1650+theta(3)*3; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form
%               solution for linear regression using the normal
%               equations. You should complete the code in
%               normalEqn.m
%
%               After doing so, you should complete this code
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = theta(1)+theta(2)*1650+theta(3)*3; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);


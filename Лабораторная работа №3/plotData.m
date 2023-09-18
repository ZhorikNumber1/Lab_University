
 function plotData(X, y)
 %PLOTDATA Plots the data points X and y into a new figure
 %   PLOTDATA(x,y) plots the data points with + for the positive examples
 %   and o for the negative examples. X is assumed to be a Mx2 matrix.
 % Create New Figure
 figure; hold on;
 % ====================== YOUR CODE HERE ======================
 % Instructions: Plot the positive and negative examples on a
 %               2D plot, using the option 'k+' for the positive
 %               examples and 'ko' for the negative examples.
 %
 m = length(y);
 IndexZerosClasses = find(~y);
 IndexOnesClasses = find(y);
 XZeros = zeros(length(IndexZerosClasses), size(X,2));
 XOnes = zeros(length(IndexOnesClasses), size(X,2));
 i = 1;
 j = 1;
 while (i + j) <=101
  if i <= length(IndexZerosClasses)
    XZeros(i,:) = X(IndexZerosClasses(i), :);
    i=i+1;
   else
    XOnes(j, :) = X(IndexOnesClasses(j), :);
    j=j+1;
   end
 end
 plot(XOnes(:,1), XOnes(:,2), 'k+', 'MarkerSize',10, 'MarkerEdgeColor' , 'black');
 plot(XZeros(:,1), XZeros(:, 2) , 'rs', 'MarkerSize',10, 'MarkerEdgeColor' , 'blue');
 % =========================================================================
 hold off;
 end





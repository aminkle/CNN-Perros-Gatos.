%CALCULO DE CENTROIDE EN PUNTOS DISPERSOS
%REALIZADO POR: Kevin Bravo
clear
clear all
%%creamos puntos al azar
rng default;
X = [randn(10,2)*0.75+ones(10,2);
    randn(10,2)*0.5-ones(10,2)];
%Graficamos los puntos dispersos
figure;
plot(X(:,1),X(:,2),'.');
title 'Puntos aleatorios';
%Separamos los puntos en 2 grupos de 10puntos cada uno
%y realizamos las iteraciones para calcular la distancia 
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
%Con k-means replicamos por separado los puntos con y marcamos los
%centorides y mandamos a graficar
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Grupo 1','Grupo 2','Centroides',...
       'Localizacion','NW')
title 'Centroides'
hold off
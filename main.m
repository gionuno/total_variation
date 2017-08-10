J = double(imread('lena.jpg'))/255.0;
J = J(1:4:end,1:4:end,:);
L =   5.0;
g =   5.0;
T =    20;
S =     5;

I = total_variation(J,g,L,T,S);

aux = J-I;
aux = aux - min(min(min(aux)));
aux = aux / (max(max(max(aux)))+1e-2);

figure;
subplot(1,3,1);
imshow(J);
subplot(1,3,2);
imshow(I);
subplot(1,3,3);
imshow(aux);
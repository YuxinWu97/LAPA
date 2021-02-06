set(0,'DefaultFigureWindowStyle','docked')
close all;

nx = 50;
ny = 50;
ni = 2500;
V = zeros(nx,ny);

SidesToZero = 1;
for k=1:ni
    for i=1:nx
        for j=1:ny
            %Boundary conditions
            if (j == 1)
                V(i,j) = 1; %Left
            elseif (j == ny)
                V(i,j) = 1;  %Right  
            elseif (i == 1)
                V(i,j) = (V(i+1,j)+V(i,j+1)+V(i,j-1))/4;  %Bottom Change 4 to 3 if 0 on right 
            elseif (i == nx) 
                V(i,j) = (V(i-1,j)+V(i,j+1)+V(i,j-1))/4;  %Bottom Change 4 to 3 if 0 on right    
            else
                 V(i,j) = (V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4;
            end
        
        end
        
        if mod(k,50) == 0
            surf(V)
            pause(0.01)
        end
    end
end
[Ex, Ey] = gradient(V);
figure
quiver(-Ey',-Ex',1)
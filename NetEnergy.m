function [E] = NetEnergy(Weights, States, Nodes, stateMag);
global N 
w = Weights; 
s = sign(States)*stateMag;
     E = 0;
            for i = 1:N;
                for j = 1:N;
                    if ne(i,j)
                    E = E + ( w(i,j)*s(i)*s(j));
                    end 
                end
            end
            E = -0.5 * sum(E);
            
            
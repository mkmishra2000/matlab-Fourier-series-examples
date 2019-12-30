function ass3q7a
    %define the time
    t=-1:0.001:1;
    
    %define the expression
    for i=1:length(t)
        if t(i)<0
            y(i)=0;
        else
            y(i)=1;
        end
    end
    
    w=(2*pi)/2;     % Angular frequency
    
    %calculating the first thirty coeficients
    for k=1:1:30
        A1(k)=(trapz(t,y.*exp(-1i*w*k*t)))/2;
    end
    
    k=0:1:30;   %indexing
    
    A0=1/2;     %zeroth coeficient
    
    A=[A0,A1];  %joining the fourier coefficients
    
    subplot(3,1,1);
    plot(t,y);
    axis([-1.01,1.01,-0.01,1.02]);
    grid on;
    
    subplot(3,1,2);
    stem(k,abs(A));
    grid on;
    
    subplot(3,1,3);
    stem(k,angle(A));
    grid on;
    
    
end
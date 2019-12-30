function ass3q7
    t=-1:0.001:1; %define the time
    
    %define the expression 
    for i=1:length(t)
        if t(i)<0
            y(i)=0;     %for negative part
        else
            y(i)=1;     %for positve part
        end
    end
    
    w=(2*pi)/2;     %Angular freqjuency
    
    %define the positive 10 coeficient part
    for k=1:1:10
        A1(k)=(trapz(t,y.*exp(-1i*w*k*t)))/2;
    end
    k=0:1:10;   %indexing
    
    A0=1/2;     %zeroth coefficient.
    
    A=[A0,A1];  %fourier coefficient.
    
    subplot(4,1,1);
    plot(t,y);
    grid on;
    axis([-1.01,1.01,-0.01,1.02]);
    
    subplot(4,1,2);
    stem(k,abs(A));
    grid on;
    
    subplot(4,1,3);
    stem(k,angle(A));
    grid on;
    
    subplot(4,1,4);
    stem(k,A);
    grid on;
    
end
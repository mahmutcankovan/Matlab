clc
clear all

%ana kod içinde Vs matrisi içindeki gerilimler faz-nötr gerilimleri. Burada
%da Vdc veya Vab deðil Van geriliminin elde edilmesi gerekiyor. 

%spwm
Ts = 1e-6                        %Örnekleme zamaný  (sn)
Tsim = 0.02                      %Simulasyon süresi (sn)
fswitch= 500;                    %Anahtarlama frekansý (Hz)
tswitch = 1 / fswitch           %Anahtarlama periyodu (sn)
lambda = 0.3;                    %PWM doluluk oraný
Vref = 0;
tcounter = 0;
tduty = tswitch * lambda
c = 0;
m = 0;

for t=0:Ts:Tsim 
c=c+1;
tcounter = tcounter + Ts;
if tcounter < tduty
    Vref = 1;
    elseif tcounter >= tduty 
        Vref = 0;
end
if tcounter >= tswitch
    tcounter = 0;
    m = 5
end


% if tcounter < tduty
%     Vref = 1;
% elseif tcounter >= tduty
%     Vref = 0;
% end
x(c)= t      ;             
y1(c) = Vref   ;       
y2(c) = tcounter   ;
y3(c) = 1.4;
end

figure
plot (x,y1)
ylim([0 1.2])
xlim([0 0.02])

grid on

figure
plot (x,y2)
grid on



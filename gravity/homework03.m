%% Adjustable parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EARTH AROUND STATIONARY SUN
mass1 = 2*10^30;                
mass2 = 5.97*10^24;             
initial_distance = [150000000000, 0]; 
velocity1 = [0, 0];           
velocity2 = [0, 30000];     
simulation_duration = 365 * 24 * 60 * 60;
time_step = 24 * 60 * 60;
simulation_speed = 30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[t, s] = bodyMotion2D(mass1, mass2, initial_distance, velocity1, velocity2, simulation_duration, time_step, simulation_speed);

% Plotting s vs t
figure(2);
plot(t, s, 'g');
xlabel('Time');
ylabel('Area swept');
title("Area Swept vs Time (2nd Kepler's Law)");
grid on;

%EARTH AROUND STATIONARY SUN
%mass1 = 2*10^30;                
%mass2 = 5.97*10^24;             
%initial_distance = [150000000000, 0]; 
%velocity1 = [0, 0];           
%velocity2 = [0, 30000];     
%simulation_duration = 365 * 24 * 60 * 60;
%time_step = 24 * 60 * 60;
%simulation_speed = 30;

%ELIPSE
%mass1 = 2*10^30;                
%mass2 = 5.97*10^24;             
%initial_distance = [150000000000, 0];
%velocity1 = [0, 0];           
%velocity2 = [0, 20000];     
%simulation_duration = 365 * 15 * 60 * 60;
%time_step = 24 * 60 * 60;
%simulation_speed = 30;

%NICE SPIRAL
%mass1 = 2*10^30;            
%mass2 = 5.97*10^24;           
%initial_distance = [150000000000 / 2, 0]; 
%velocity1 = [0, 9000];          
%velocity2 = [0, 30000];    
%simulation_duration = 31536000;
%time_step = 24 * 60 * 60;
%simulation_speed = 10;

%TWO ELIPSES MOVING TOGETHER
%mass1 = 15*10^24;               
%mass2 = 6*10^24;             
%initial_distance = [150000000, 0];    
%velocity1 = [100, 600];          
%velocity2 = [100, -1500];
%simulation_duration = 500000;
%time_step = 1440;
%simulation_speed = 10;
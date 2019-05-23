%% UKFSim
% Demonstrate an Unscented Kalman Filter.
%% Initialize
nSim = 5000; % Simulation steps

dT = 0.1; % Time step (sec)

d = RHSOscillator; % Get the default data structure
d.a = 0.1; % Disturbance acceleration
d.omega = 0.1;
d.zeta = 0.1; % Damping ratio
x = [0;0]; % Initial state [position;velocity]
y1Sigma = 1; % 1 sigma measurement noise
dMeas.baseline = 10; % Distance of sensor from start
xE = [0; 0]; % Estimated initial state

q = diag([0.1 0.001]);
p = diag([0.01 0.0001]);

dKF = KFInitialize( 'ukf','m',xE,'f',@RHSOscillator,'fData',d,...
    'r',y1Sigma^2,'q',q,'p',p,'hFun',@AngleMeasurement,'hData',y1Sigma,'dT',dT);

dKF = UKFWeight( dKF );
%% Simulation
xPlot = zeros(3,nSim);
for k = 1:nSim
%     % Measurements
    y = AngleMeasurement( x, y1Sigma ) + y1Sigma*randn;
%     % Update the Kalman Filter
    dKF.y = y;
    dKF = UKFUpdate(dKF);
    % Plot storage
    xPlot(:,k) = [x;y];
%     % Propagate (numerically integrate) the state equations
    x = RungeKutta(@RHSOscillator, x, dT, d);
%     % Propagate the Kalman Filter
    dKF = UKFPredict(dKF);
end

%% plot the results
t = 1:nSim;
name = {'position', 'velocity', 'measurements'};
plot_results(t, xPlot,name);
classdef Main < handle
    % Main class to handle the execution of the robot's tasks, environment setup,
    % and point cloud simulation. It contains methods to run the simulation and 
    % generate the workspace point cloud.

    methods (Static)
        function Run()
            % Run the main simulation for the robot task.
            % This method sets up the environment, bricks, gripper, and robot,
            % then executes the robot's trajectory while profiling the execution.
            
            % Clear the current figure and reset profiling data
            clf;  % Clear the current figure window
            profile clear;  % Clear previously collected profiling data
            profile on;  % Start profiling performance data
            
            % Set up the environment and bricks
            Environment();  % Create and display the environment
            bricks = Bricks();  % Initialize the Bricks object
            bricks.PlaceBricks();  % Place the bricks in the environment
            
            % Set up the gripper
            gripper = Gripper();  % Initialize the Gripper object
            
            % Set up the robot
            robot = LinearUR3e();  % Initialize the robot (Linear UR3e model)
            
            % Set up and run the robot trajectory, passing the robot, bricks, and gripper
            trajectory = RobotTrajectory(robot, bricks, gripper);  % Initialize RobotTrajectory
            trajectory.Run();  % Execute the robot's movement trajectory
            
            % End profiling and display performance data
            profile off;  % Stop profiling
            profile viewer;  % Display the profiling results in the viewer
        end

        function PointCloud()
            % Generate and display the robot's workspace point cloud.
            % This method sets up the robot, generates the point cloud based on the 
            % robot's joint limits, and plots the cloud in 3D. Profiling is enabled
            % to analyze the performance.

            % Clear the current figure and reset profiling data
            clf;  % Clear the current figure window
            profile clear;  % Clear previously collected profiling data
            profile on;  % Start profiling performance data

            % Create the robot instance (replace with your robot initialization)
            robot = LinearUR3e();  % Initialize the robot (Linear UR3e model)

            % Create an instance of WorkspacePointCloud for generating the point cloud
            pointCloudSim = WorkSpaceCloud(robot);  % Initialize the point cloud simulation

            % Generate the point cloud
            pointCloudSim.GeneratePointCloud();  % Compute the point cloud based on joint limits

            % Plot the point cloud in 3D
            pointCloudSim.CalculateAndPlotPointCloud();  % Display the computed point cloud in 3D

            % End profiling and display performance data
            profile off;  % Stop profiling
            profile viewer;  % Display the profiling results in the viewer
        end
    end
end

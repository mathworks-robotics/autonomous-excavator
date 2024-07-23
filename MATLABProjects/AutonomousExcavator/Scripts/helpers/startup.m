
%% update all Simulation 3D Scene Configuration blocks to point to a valid Unreal scene

prj = currentProject;
unreal_path=erase(prj.RootFolder,"\MATLABProjects\AutonomousExcavator")+"\Unreal\Build\Windows\AutonomousExcavator.exe";
load_system("testLidarSensorPlacement")
set_param("testLidarSensorPlacement/Excavator Scene","ProjectName",unreal_path)
load_system("followPlannedTrajectory_MechanicsOnly")
set_param("followPlannedTrajectory_MechanicsOnly/Excavator Scene","ProjectName",unreal_path)


clear;

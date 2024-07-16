
%% update all Simulation 3D Scene Configuration blocks to point to a valid Unreal scene

prj = currentProject;
unreal_path=erase(prj.RootFolder,"\MATLABProjects\AutonomousExcavator")+"\Unreal\Build\Windows\AutonomousExcavator.exe";
load_system("ExcavatorUnrealExecutableSceneConfiguration")
set_param("ExcavatorUnrealExecutableSceneConfiguration/Simulation 3D Scene Configuration","ProjectName",unreal_path);
load_system("testLidarSensorPlacement")
set_param("testLidarSensorPlacement/Excavator Scene","ProjectName",unreal_path)
load_system("followPlannedTrajectory_MechanicsOnly")
set_param("followPlannedTrajectory_MechanicsOnly/Excavator Scene","ProjectName",unreal_path)



%% Check if the Simulation 3D Scene Configuration block points to a valid Unreal scene
pathToUnrealProject = get_param("ExcavatorUnrealExecutableSceneConfiguration/Simulation 3D Scene Configuration", "ProjectName");

if exist(pathToUnrealProject, "file") == 2

else 
    open_system("ExcavatorUnrealExecutableSceneConfiguration")
    errordlg("Could not find ""AutonomousExcavator.exe"" at the given path. Open the Simulation 3D Scene Configuration block and browse to the Unreal Executable, then save the model.")
end

clear;


%% Check if the Simulation 3D Scene Configuration block points to a valid Unreal scene

load_system("ExcavatorUnrealExecutableSceneConfiguration")
pathToUnrealProject = get_param("ExcavatorUnrealExecutableSceneConfiguration/Simulation 3D Scene Configuration", "ProjectName");

if exist(pathToUnrealProject, "file") == 2

else 
    open_system("ExcavatorUnrealExecutableSceneConfiguration")
    errordlg("Could not find ""AutonomousExcavator.exe"" at the given path. Open the Simulation 3D Scene Configuration block and browse to the Unreal Executable, then save the model.")
end

clear;
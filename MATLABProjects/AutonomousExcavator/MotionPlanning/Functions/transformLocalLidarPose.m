function [transformedTranslation, transformedRotation] = transformLocalLidarPose(translation, rotation)
    % The local coordinate system of the excavator is x=right and
    % -y=forward. Transform the pose to the convention used for the motion
    % planner (x=forward, y=right).
    transformedTranslation = [translation(2) -translation(1) translation(3)];
    transformedRotation = [rotation(1) rotation(2) rotation(3)-90];    

end


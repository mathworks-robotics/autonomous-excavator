function rbtTransformed = setRigidBodyTreeRotation(rbt, tform)
    %% Change the transform of a rigid body tree (RBT) by creating an empty RBT, creating an empty body with a rotator, set the rotation and adding the original RBT as a subtree 
    rbtTransformed = rigidBodyTree;
    addBody(rbtTransformed, rigidBody("baseRotator"), "base");
    rbtTransformed.getBody('baseRotator').Joint.setFixedTransform(tform);
    
    addSubtree(rbtTransformed, "baseRotator", rbt, "ReplaceBase",false)
end


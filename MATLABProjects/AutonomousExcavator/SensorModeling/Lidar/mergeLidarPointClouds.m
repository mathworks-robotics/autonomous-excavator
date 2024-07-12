%% Merge all point clouds from the excavator lidars together
function mergedPointCloud = mergeLidarPointClouds(pointCloudData)
    
    fnames = fieldnames(pointCloudData);

    clear alignedPointClouds;
    for ii=1:numel(fnames)
        translation = pointCloudData.(fnames{ii}).LocalTranslation;
        rotation = pointCloudData.(fnames{ii}).LocalRotation;
        currentPointCloud = pointCloud(pointCloudData.(fnames{ii}).Point_Cloud);

        tform = rigidtform3d(rotation, translation);
        alignedPointClouds(ii) = pctransform(currentPointCloud, tform);
    end      
    
    %% Merge the point clouds 
    mergedPointCloud = alignedPointClouds(1);
    
    if numel(alignedPointClouds)>1
        gridStep = 0.05;
        for ii=2:numel(alignedPointClouds)
            mergedPointCloud = pcmerge(mergedPointCloud, alignedPointClouds(ii), gridStep);
        end
    end

end


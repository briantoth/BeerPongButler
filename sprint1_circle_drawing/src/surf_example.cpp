#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <opencv2/nonfree/features2d.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <string>
#include <iostream>


bool findObjectSURF( cv::Mat objectMat, cv::Mat sceneMat, int hessianValue )
{
    bool objectFound = false;
    float nndrRatio = 0.7f;
    //vector of keypoints
    vector< cv::KeyPoint > keypointsO;
    vector< cv::KeyPoint > keypointsS;

    Mat descriptors_object, descriptors_scene;

    //-- Step 1: Extract keypoints
    SurfFeatureDetector surf(hessianValue);
    surf.detect(sceneMat,keypointsS);
    if(keypointsS.size() < 7) return false; //Not enough keypoints, object not found
    surf.detect(objectMat,keypointsO);
    if(keypointsO.size() < 7) return false; //Not enough keypoints, object not found

    //-- Step 2: Calculate descriptors (feature vectors)
    SurfDescriptorExtractor extractor;
    extractor.compute( sceneMat, keypointsS, descriptors_scene );
    extractor.compute( objectMat, keypointso, descriptors_object );

    //-- Step 3: Matching descriptor vectors using FLANN matcher
    cv::FlannBasedMatcher matcher;
    descriptors_scene.size(), keypointsO.size(), keypointsS.size());
    std::vector<std::vector<cv::DMatch> > matches;
    matcher.knnMatch( descriptors_object, descriptors_scene, matches, 2 );
    vector< cv::DMatch > good_matches;
    good_matches.reserve(matches.size());

    for (size_t i = 0; i < matches.size(); ++i)
    {
        if (matches[i].size() < 2)
            continue;

        const cv::DMatch &m1 = matches[i][0];
        const cv::DMatch &m2 = matches[i][1];

        if(m1.distance <= nndrRatio * m2.distance)
            good_matches.push_back(m1);
    }



    if( (good_matches.size() >=7))
    {
        std::cout << "OBJECT FOUND!" << std::endl;

        std::vector< cv::Point2f > obj;
        std::vector< cv::Point2f > scene;

        for( unsigned int i = 0; i < good_matches.size(); i++ )
        {
            //-- Get the keypoints from the good matches
            obj.push_back( keypointsO[ good_matches[i].queryIdx ].pt );
            scene.push_back( keypointsS[ good_matches[i].trainIdx ].pt );
        }

        Mat H = findHomography( obj, scene, CV_RANSAC );

        //-- Get the corners from the image_1 ( the object to be "detected" )
        std::vector< Point2f > obj_corners(4);
        obj_corners[0] = cvPoint(0,0); obj_corners[1] = cvPoint( objectMat.cols, 0 );
        obj_corners[2] = cvPoint( objectMat.cols, objectMat.rows ); obj_corners[3] = cvPoint( 0, objectMat.rows );
        std::vector< Point2f > scene_corners(4);

        perspectiveTransform( obj_corners, scene_corners, H);


        //-- Draw lines between the corners (the mapped object in the scene - image_2 )
        line( objectMat, scene_corners[0] , scene_corners[1], color, 2 ); //TOP line
        line( objectMat, scene_corners[1] , scene_corners[2], color, 2 );
        line( objectMat, scene_corners[2] , scene_corners[3], color, 2 );
        line( objectMat, scene_corners[3] , scene_corners[0] , color, 2 );
        objectFound=true;
    } else {
        std::cout << "OBJECT NOT FOUND!" << std::endl;
    }

    std::cout << "Matches found: " << matches.size() << std::endl;
    std::cout << "Good matches found: " << good_matches.size() << std::endl;

    return objectFound;
}

int main(int argc, const char* argv[])
{
    const cv::Mat input = cv::imread("input.jpg", 0); //Load as grayscale
    const cv::Mat outImg= cv::imread("input.jpg", 0); //Load as grayscale

    findObjectSURF(input, outImg, 1500);

    // Add results to image and save.
    cv::Mat output;
    cv::drawKeypoints(input, keypoints, output);
    cv::imwrite("sift_result.jpg", output);

    return 0;
}

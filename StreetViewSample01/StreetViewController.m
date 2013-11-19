//
//  StreetViewController.m
//  StreetViewSample01
//
//  Created by honjo2 on 2013/11/19.
//  Copyright (c) 2013 honjo2. All rights reserved.
//

#import "StreetViewController.h"

@interface StreetViewController () <GMSPanoramaViewDelegate>

@end

@implementation StreetViewController {
  GMSPanoramaView *view_;
  BOOL configured_;
}

@synthesize coordinate = _coordinate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  
  view_ = [GMSPanoramaView panoramaWithFrame:CGRectZero
                              nearCoordinate:self.coordinate];
  view_.backgroundColor = [UIColor grayColor];
  view_.delegate = self;
  self.view = view_;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GMSPanoramaDelegate

- (void)panoramaView:(GMSPanoramaView *)panoramaView
       didMoveCamera:(GMSPanoramaCamera *)camera {
//  NSLog(@"Camera: (%f,%f,%f)",
//        camera.orientation.heading, camera.orientation.pitch, camera.zoom);
}

- (void)panoramaView:(GMSPanoramaView *)view
   didMoveToPanorama:(GMSPanorama *)panorama {
  if (!configured_) {
    GMSMarker *marker = [GMSMarker markerWithPosition:self.coordinate];
    marker.icon = [GMSMarker markerImageWithColor:[UIColor purpleColor]];
    marker.panoramaView = view_;
    
    CLLocationDegrees heading = GMSGeometryHeading(self.coordinate, self.coordinate);
    view_.camera =
    [GMSPanoramaCamera cameraWithHeading:heading pitch:0 zoom:1];
    
    configured_ = YES;
  }
}

@end

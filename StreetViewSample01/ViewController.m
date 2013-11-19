//
//  ViewController.m
//  StreetViewSample01
//
//  Created by honjo2 on 2013/11/19.
//  Copyright (c) 2013 honjo2. All rights reserved.
//

#import "ViewController.h"
#import "StreetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  MMMapView *mapView = [[MMMapView alloc] initWithFrame:[[self view] bounds] key:@"06a885fd92433087ae783a825da576f2"];
  mapView.delegate = self;
  
  [mapView setZoom:17];
  mapView.centerCoordinate = CLLocationCoordinate2DMake(35.628222, 139.738694);
  
  [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MMMapViewDelegate

- (void)longSingleTap:(MMMapView *)mapView point:(CGPoint)point {
  
  CLLocationCoordinate2D coordinate = [mapView pixelToCoordinate:point];
  
  UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"StreetViewController"];
  StreetViewController *streetViewController = (StreetViewController *)controller;
  streetViewController.coordinate = coordinate;
  [self.navigationController pushViewController:streetViewController animated:YES];
}

@end

//
//  NearByViewController.m
//  TeddyAPP
//
//  Created by Ctrip on 14-4-21.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import "NearByViewController.h"
#import "Place.h"
#import "URBAlertView.h"
#import "ARClusteredMapView.h"

@interface NearByViewController ()

@property (assign, nonatomic) NSInteger selectedRow;
@property (strong, nonatomic) NSMutableArray *places;

@end

@implementation NearByViewController

@synthesize mapView = _mapView;

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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://api.map.baidu.com/place/v2/search/?q=%E9%A5%AD%E5%BA%97&region=%E5%8C%97%E4%BA%AC&output=json&ak=807c895c330132fd6ddbd6be67561039"
        parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //NSLog(@"URL: %@",[manager baseURL]);
            //NSLog(@"JSON: %@", responseObject);  ---> print Json Entity
            NSArray *results = [responseObject objectForKey:@"results"];
            _places = [[NSMutableArray alloc] init];
            for(NSDictionary *result in results)
            {
                Place *place = [Place alloc];
                place.name = [result valueForKey:@"name"];
                place.address = [result valueForKey:@"address"];
                place.lat = [result valueForKeyPath:@"location.lat"];
                place.lng = [result valueForKeyPath:@"location.lng"];
                [_places addObject:place];
            }
            [_tabelView reloadData];
            //_tabelView.dataSource = responseObject;
    }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [_tabelView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    _tabelView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"congruent_outline.png"]];
  

}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    self.mapView.showsUserLocation = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_places count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idetifier = @"PlaceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    NSInteger row = [indexPath row];
    
    Place *place = _places[row];
    
    UILabel* nameLabel = (UILabel *)[cell.contentView viewWithTag:1];
    nameLabel.text = place.name;
    UILabel* addressLabel = (UILabel *)[cell.contentView viewWithTag:2];
    addressLabel.text = place.address;
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"congruent_outline.png"]];
    [cell setUserInteractionEnabled:YES];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    Place *place = _places[row];
    NSString* temp = [NSString stringWithFormat:@"Name: %@ \n Address: %@ \n Lat: %@ \n Lng: %@",place.name,place.address,place.lat,place.lng];
    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:@"Detail"
														  message:temp
												cancelButtonTitle:@"Cancel"
												otherButtonTitles: @"OK", nil];
    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
        [alertView hideWithCompletionBlock:^{
            
        }];
    }];

    [alertView showWithAnimation:URBAlertAnimationSlideLeft];
}
- (void)viewDidUnload {
    [super viewDidUnload];
	
	self.mapView = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark MKMapViewDelegate methods

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
	[self.mapView animateAnnotationViews:views];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
	[self.mapView updateClustering];
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //NSString *lat=[[NSString alloc] initWithFormat:@"%f",userLocation.coordinate.latitude];
    //NSString *lng=[[NSString alloc] initWithFormat:@"%f",userLocation.coordinate.longitude];
    
    CLLocationCoordinate2D coordinate;
    coordinate.longitude = userLocation.coordinate.longitude;
    coordinate.latitude = userLocation.coordinate.latitude;
    
	[self.mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, 40000, 40000) animated:YES];
    
    NSMutableArray *pins = [NSMutableArray array];
    
    for(int i=0;i<300;i++) {
        CGFloat latDelta = rand()*0.125/RAND_MAX - 0.08;
        CGFloat lonDelta = rand()*0.130/RAND_MAX - 0.08;
        
        CGFloat lat = coordinate.latitude;
        CGFloat lng = coordinate.longitude;
        
        CLLocationCoordinate2D newCoord = {lat+latDelta, lng+lonDelta};
        ARClusteredAnnotation *pin = [[ARClusteredAnnotation alloc] init];
        pin.title = [NSString stringWithFormat:@"Pin %i",i+1];;
        pin.subtitle = [NSString stringWithFormat:@"Pin %i subtitle",i+1];
        pin.coordinate = newCoord;
        [pins addObject:pin];
    }
    
    [self.mapView addAnnotations:pins];
    
}
@end

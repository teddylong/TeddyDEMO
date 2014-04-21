//
//  NearByViewController.m
//  TeddyAPP
//
//  Created by Ctrip on 14-4-21.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import "NearByViewController.h"
#import "Place.h"

@interface NearByViewController ()

@property (assign, nonatomic) NSInteger selectedRow;
@property (strong, nonatomic) NSMutableArray *places;

@end

@implementation NearByViewController

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
        NSLog(@"JSON: %@", responseObject);
            
            
            //NSLog(results[@"result"]);
            //Place* one =  [Place alloc];
            //[_places addObject:(one)];
            NSArray *results = [responseObject objectForKey:@"results"];
            _places = [[NSMutableArray alloc] init];
            for(NSDictionary *result in results)
            {
                Place *place = [Place alloc];
                place.name = [result valueForKey:@"name"];
                place.address = [result valueForKey:@"address"];
                [_places addObject:place];
            }
            [_tabelView reloadData];
            //_tabelView.dataSource = responseObject;
    }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
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

    
    
    [cell setUserInteractionEnabled:YES];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

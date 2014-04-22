//
//  NearByViewController.h
//  TeddyAPP
//
//  Created by Ctrip on 14-4-21.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "ARClusteredMapView.h"


@interface NearByViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (nonatomic,strong) IBOutlet ARClusteredMapView *mapView;

@end

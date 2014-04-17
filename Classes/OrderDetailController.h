//
//  OrderDetailController.h
//  TeddyAPP
//
//  Created by Ctrip on 14-4-17.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyOrder.h"

@interface OrderDetailController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)backBtn:(id)sender;

@property (nonatomic, strong) MyOrder *order;

@end

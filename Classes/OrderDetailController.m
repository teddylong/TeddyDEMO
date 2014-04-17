//
//  OrderDetailController.m
//  TeddyAPP
//
//  Created by Ctrip on 14-4-17.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import "OrderDetailController.h"

@interface OrderDetailController ()


@end

@implementation OrderDetailController

@synthesize order;

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
    _nameLabel.text = order.name;
    _descLabel.text = order.desc;
    NSString *dateString = [NSDateFormatter localizedStringFromDate:order.lastmodifytime
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterFullStyle];
    _dateLabel.text = dateString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtn:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end

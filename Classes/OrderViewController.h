//
//  OrderViewController.h
//  TeddyAPP
//
//  Created by Ctrip on 14-4-17.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController :  UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

//
//  ButtonClickViewController.h
//  TeddyAPP
//
//  Created by 龙 轶群 on 14-3-31.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HVTableView.h"

@interface ButtonClickViewController : UIViewController<HVTableViewDelegate, HVTableViewDataSource>
{
    HVTableView* myTable;
	NSArray* cellTitles;
}
- (IBAction)backBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) NSString *valueLabeltext;

@end

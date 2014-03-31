//
//  ButtonClickViewController.h
//  TeddyAPP
//
//  Created by Ctrip on 14-3-31.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import <UIKit/UIKit.h>



@class ButtonClickViewController;

@protocol ButtonClickViewControllerDelegate <NSObject>
- (void)buttonClickViewControllerDidCancel:
(ButtonClickViewController *)controller;

@end

@interface ButtonClickViewController : UITableViewController

@property (nonatomic, weak) id <ButtonClickViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
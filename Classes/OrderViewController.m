//
//  OrderViewController.m
//  TeddyAPP
//
//  Created by Ctrip on 14-4-17.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderDetailController.h"
#import "MyOrder.h"
#import "STDb.h"
#import "NSDate+Exts.h"


@interface OrderViewController ()

@property (assign, nonatomic) NSInteger selectedRow;
@property (strong, nonatomic) NSMutableArray *orders;

@end

@implementation OrderViewController

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
    _tableView.editing = YES;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _orders = [MyOrder allDbObjects];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_orders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idetifier = @"OrderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    NSInteger row = [indexPath row];
    
    MyOrder *order = _orders[row];
    
    //UIImageView *headImgView = (UIImageView *)[cell.contentView viewWithTag:1];
    //headImgView.image = [UIImage imageWithData:user.image];
    //cell.textLabel.text = order.name;
    UILabel* nameLabel = (UILabel *)[cell.contentView viewWithTag:1];
    nameLabel.text = order.name;
    UILabel* descLabel = (UILabel *)[cell.contentView viewWithTag:2];
    descLabel.text = order.desc;
    UILabel* dateLabel = (UILabel *)[cell.contentView viewWithTag:3];
    dateLabel.text = order.lastmodifytime.timeString;
    UIImageView *headImgView = (UIImageView *)[cell.contentView viewWithTag:4];
    headImgView.image = [UIImage imageWithData:order.image];
    

    [cell setUserInteractionEnabled:YES];
    
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄:%d", user.age];
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedRow = [indexPath row];
    return indexPath;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger row = [indexPath row];
        
        // 要删除的数据
        MyOrder *order = _orders[row];
        // 从数据库中删除数据
        if ([order removeFromDb]) {
            // 数据库数据删除成功
            
            [tableView beginUpdates];
            
            // 删除数据源中的数据
            [_orders removeObjectAtIndex:row];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [tableView endUpdates];
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    //return row != 0;   --->  only first can't edit
    return row == 1;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *idetifier = segue.identifier;
    
    if ([idetifier isEqualToString:@"orderList_orderDetail"]) {
        OrderDetailController *detail = segue.destinationViewController;
        detail.order = _orders[_selectedRow];
    }
}

@end

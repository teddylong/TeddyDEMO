//
//  ButtonClickViewController.m
//  TeddyAPP
//
//  Created by 龙 轶群 on 14-3-31.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import "ButtonClickViewController.h"
#import "MyOrder.h"


@interface ButtonClickViewController ()

@property (strong, nonatomic) NSMutableArray *orders;

@end

@implementation ButtonClickViewController
@synthesize valueLabeltext;
@synthesize valueLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

-(void)tableView:(UITableView *)tableView expandCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
	[[cell.contentView viewWithTag:10] removeFromSuperview];
	UIButton* purchaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	purchaseButton.frame = CGRectMake(125, 95, 80, 20);
	purchaseButton.alpha = 0;
	[purchaseButton setTitle:@"Purchase Now!" forState:UIControlStateNormal];
	purchaseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:11];
	purchaseButton.backgroundColor = [UIColor grayColor];
	[purchaseButton setTintColor:[UIColor whiteColor]];
    [purchaseButton addTarget:self action:@selector(purchaseButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[cell.contentView addSubview:purchaseButton];
	purchaseButton.tag = 10;
	
	[UIView animateWithDuration:.5 animations:^{
		cell.detailTextLabel.text = @"If I am your style, CHOOSE ME!";
		purchaseButton.frame = CGRectMake(125, 95, 80, 20);
		purchaseButton.alpha = 0.8;
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(3.14);
	}];
}

-(void)purchaseButtonClick
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Done" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"$1/Month",@"$10/Year", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* msg;
    if(buttonIndex == 1)
    {
        msg = [NSString stringWithFormat:@"Your has selected $1/Month"];
        MyOrder *order = [[MyOrder alloc] init];
        order.name = @"$1/Month";
        order.desc = @"For one month, pay one dollar.";
        UIImage* image = [UIImage imageNamed:@"teddy.jpg"];
        order.image = UIImageJPEGRepresentation(image, 1.0);
        order.lastmodifytime = [NSDate date];
        
        if ([order insertToDb])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:msg message:@"Success" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

    }
    else
    {
        msg = [NSString stringWithFormat:@"Your has selected $10/Year"];
        MyOrder *order = [[MyOrder alloc] init];
        order.name = @"$10/Year";
        order.desc = @"For one year, pay ten dollar.";
        UIImage* image = [UIImage imageNamed:@"candy.jpg"];
        order.image = UIImageJPEGRepresentation(image, 1.0);
        order.lastmodifytime = [NSDate date];
        
        if ([order insertToDb])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:msg message:@"Success" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

    }
}

-(void)tableView:(UITableView *)tableView collapseCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
	[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(0);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isexpanded
{
	//you can define different heights for each cell. (then you probably have to calculate the height or e.g. read pre-calculated heights from an array
	if (isexpanded)
		return 125;
	
	return 75;
}

- (void)viewDidLoad
{
 
    valueLabel.text = valueLabeltext;
    
    myTable = [[HVTableView alloc] initWithFrame:CGRectMake(0, 81, 320, 440) expandOnlyOneCell:YES enableAutoScroll:YES];
    myTable.HVTableViewDelegate = self;
    myTable.HVTableViewDataSource = self;
    [myTable reloadData];
    [self.view addSubview:myTable];
    [myTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint* myTableWidthCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:320];
    NSLayoutConstraint* myTableBottomCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
   NSLayoutConstraint* myTableCenterXCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint* myTableTopCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:81];
    [self.view addConstraints:@[myTableBottomCon, myTableCenterXCon, myTableWidthCon, myTableTopCon]];
    
    ////////////storing the title labels in an array so we will use it in cellForRowAtIndexPath
    cellTitles = @[@"Teddy", @"Candy", @"Chris", @"Septen", @"MikeD", @"Andy", @"Apirl", @"Soda", @"Tayor",@"Whatever"];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backBtn:(UIButton *)sender {
    [self dismissModalViewControllerAnimated:YES];
    //[self.navigationController popViewControllerAnimated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isExpanded
{
	static NSString *CellIdentifier = @"aCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIImageView* expandGlyph = [[UIImageView alloc] initWithFrame:CGRectMake(290, 10, 15, 10)];
		expandGlyph.image = [UIImage imageNamed:@"expandGlyph.png"];
		expandGlyph.tag = 7;
		[cell.contentView addSubview:expandGlyph];
		cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
		cell.detailTextLabel.numberOfLines = 0;
	}
	
	//alternative background colors for better division ;)
	if (indexPath.row %2 ==1)
		cell.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
	else
		cell.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1];
	
    cell.textLabel.text = [cellTitles objectAtIndex:indexPath.row % 10];
	NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
	NSString* imageFileName = [NSString stringWithFormat:@"%d.jpg", indexPath.row % 10 + 1];
	cell.imageView.image = [[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", bundlePath, imageFileName]];
    
	
	if (!isExpanded) //prepare the cell as if it was collapsed! (without any animation!)
	{
		cell.detailTextLabel.text = @"See More...";
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(0);
	}
	else ///prepare the cell as if it was expanded! (without any animation!)
	{
		cell.detailTextLabel.text = @"If I am your style, CHOOSE ME!";
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(3.14);
		
		[[cell.contentView viewWithTag:10] removeFromSuperview];
		UIButton* purchaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		purchaseButton.frame = CGRectMake(200, 150, 80, 40);
		[purchaseButton setTitle:@"Purchase Now!" forState:UIControlStateNormal];
		purchaseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:10];
		purchaseButton.backgroundColor = [UIColor grayColor];
		[purchaseButton setTintColor:[UIColor whiteColor]];
		[cell.contentView addSubview:purchaseButton];
		purchaseButton.tag = 10;
	}
	return cell;
}
@end

//
//  ViewController.h
//  EAIntroView
//
//  Created by Evgeny Aleksandrov on 14.09.13.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"
#import "ButtonClickViewController.h"

//@interface ViewController: UITableViewController <ButtonClickViewControllerDelegate>
//
//@end


@interface ViewController : UIViewController <EAIntroDelegate>
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) IBOutlet UILabel *label1;

- (IBAction)CallPhone:(UIButton *)sender;


@end

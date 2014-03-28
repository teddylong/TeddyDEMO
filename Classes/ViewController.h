//
//  ViewController.h
//  EAIntroView
//
//  Created by Evgeny Aleksandrov on 14.09.13.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"

@interface ViewController : UIViewController <EAIntroDelegate>
@property (strong, nonatomic) IBOutlet UIButton *button1;
- (IBAction)CallPhone:(UIButton *)sender;

@end

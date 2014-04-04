#import "ViewController.h"
#import "CycleScrollView.h"
#import "URBAlertView.h"

#import "UIButton+Curled.h"
#import "UIImageView+Curled.h"

#import "CUSFlashLabel.h"
#import "ButtonClickViewController.h"

@interface ViewController ()
@property (nonatomic , retain) CycleScrollView *mainScorllView;


@end

@implementation ViewController
@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize label1;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1.5];
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //UIImage* temp = [UIImage imageNamed:@"icon_39787.png"];
    //temp = [temp resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];
    
    //UIButton* myBtn = (UIButton*)[self.view viewWithTag:11];
    //[self.button1 setBackgroundColor:[UIColor redColor]];
    //[self.button1 setBackgroundColor:[UIColor blueColor]];
    UIColor *viewBg = [UIColor colorWithPatternImage:[UIImage imageNamed:@"stardust.png"]];
    self.view.backgroundColor = viewBg;
    
    [button1 setContentMode:UIViewContentModeScaleToFill];
    [button1 setImage:[UIImage imageNamed:@"button1.jpg"] borderWidth:3.0 shadowDepth:15.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];
    
    //[button1 setImage:[UIImage imageNamed:@"icon_39624.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateHighlighted];
    [button2 setContentMode:UIViewContentModeScaleToFill];
    [button2 setImage:[UIImage imageNamed:@"button2.jpg"] borderWidth:3.0 shadowDepth:15.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];
    [button3 setContentMode:UIViewContentModeScaleToFill];
    [button3 setImage:[UIImage imageNamed:@"button3.jpg"] borderWidth:3.0 shadowDepth:15.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];

    [button4 setContentMode:UIViewContentModeScaleToFill];
    [button4 setImage:[UIImage imageNamed:@"button4.jpg"] borderWidth:3.0 shadowDepth:15.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];

    [button5 setContentMode:UIViewContentModeScaleToFill];
    [button5 setImage:[UIImage imageNamed:@"button5.jpg"] borderWidth:3.0 shadowDepth:15.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];

    [button6 setContentMode:UIViewContentModeScaleToFill];
    [button6 setImage:[UIImage imageNamed:@"button6.jpg"] borderWidth:3.0 shadowDepth:15.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];
    
//    CUSFlashLabel *label11 = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(label1.frame.origin.x, label1.frame.origin.y, label1.frame.size.width, label1.frame.size.height)];
//    [label11 setFont:[UIFont systemFontOfSize:15]];
//    [label11 setContentMode:UIViewContentModeTop];
//    [label11 setText:@"Clean"];
//    [label11 startAnimating];
//    [self.view addSubview:label11];

    
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *name = [[NSArray alloc] initWithObjects:@"pre11.jpg",@"pre22.jpg",@"pre33.jpg",@"pre44.jpg",@"pre55.jpg",@"pre66.jpg",nil];
    for (int i = 0; i < name.count; ++i) {
        UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:[name objectAtIndex:i]]];
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 150)];
        tempLabel.backgroundColor = color;
        [viewsArray addObject:tempLabel];
    }
    
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 150) animationDuration:2];
    UIColor *firstView = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pre11.jpg"]];
    self.mainScorllView.backgroundColor = firstView;
    
    self.mainScorllView.totalPagesCount = ^NSInteger(void){
        return viewsArray.count;
    };
    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    self.mainScorllView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%d个",pageIndex);
    };
    [self.view addSubview:self.mainScorllView];
    
}



- (void)viewDidAppear:(BOOL)animated {
    // all settings are basic, pages with custom packgrounds, title image on each page
    // [self showIntroWithCrossDissolve];
}

- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello Teddy";
    page1.desc = @"Here you must finish all the IOS class upon this APP.";
    page1.bgImage = [UIImage imageNamed:@"1"];
    page1.titleImage = [UIImage imageNamed:@"original"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"Don't give up";
    page2.desc = @"There be some hardy stuff, but you need go through this with your brain.";
    page2.descColor = [UIColor blackColor];
    page2.bgImage = [UIImage imageNamed:@"2"];
    page2.titleImage = [UIImage imageNamed:@"supportcat"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"Money, Money!";
    page3.desc = @"Do whatever you want, if you have plenty of Money...So, Ahya, Ahya, Flighting...";
    page3.bgImage = [UIImage imageNamed:@"3"];
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showBasicIntroWithBg {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    page1.titleImage = [UIImage imageNamed:@"original"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
    page2.titleImage = [UIImage imageNamed:@"supportcat"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    intro.bgImage = [UIImage imageNamed:@"introBg"];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showBasicIntroWithFixedTitleView {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"original"]];
    intro.titleView = titleView;
    intro.backgroundColor = [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f]; //iOS7 dark blue
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showCustomIntro {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    page1.titleImage = [UIImage imageNamed:@"original"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titlePositionY = 180;
    page2.desc = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
    page2.descPositionY = 160;
    page2.titleImage = [UIImage imageNamed:@"supportcat"];
    page2.imgPositionY = 70;
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page3.titlePositionY = 220;
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.";
    page3.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page3.descPositionY = 200;
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    page3.imgPositionY = 100;
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    intro.backgroundColor = [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f]; //iOS7 orange
    
    intro.pageControlY = 100.0f;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setBackgroundImage:[UIImage imageNamed:@"skipButton"] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake((320-230)/2, [UIScreen mainScreen].bounds.size.height - 60, 230, 40)];
    [btn setTitle:@"SKIP NOW" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    intro.skipButton = btn;
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showIntroWithCustomView {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    page1.bgImage = [UIImage imageNamed:@"1"];
    page1.titleImage = [UIImage imageNamed:@"original"];
    
    UIView *viewForPage2 = [[UIView alloc] initWithFrame:self.view.bounds];
    UILabel *labelForPage2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 300, 30)];
    labelForPage2.text = @"Some custom view";
    labelForPage2.font = [UIFont systemFontOfSize:32];
    labelForPage2.textColor = [UIColor whiteColor];
    labelForPage2.backgroundColor = [UIColor clearColor];
    labelForPage2.transform = CGAffineTransformMakeRotation(M_PI_2*3);
    [viewForPage2 addSubview:labelForPage2];
    EAIntroPage *page2 = [EAIntroPage pageWithCustomView:viewForPage2];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
    page3.bgImage = [UIImage imageNamed:@"3"];
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showIntroWithSeparatePagesInit {
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    page1.bgImage = [UIImage imageNamed:@"1"];
    page1.titleImage = [UIImage imageNamed:@"original"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
    page2.bgImage = [UIImage imageNamed:@"2"];
    page2.titleImage = [UIImage imageNamed:@"supportcat"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
    page3.bgImage = [UIImage imageNamed:@"3"];
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    
    [intro setPages:@[page1,page2,page3]];
}

- (void)introDidFinish {
    NSLog(@"Intro callback");
        
}


- (IBAction)CallPhone:(UIButton *)sender {
    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:@"Call Candy"
														  message:@"Number: 15921266530, Have a try?"
												cancelButtonTitle:@"Cancel"
												otherButtonTitles: @"OK", nil];

    //[alertView addButtonWithTitle:@"Close"];
    //[alertView addButtonWithTitle:@"OK"];
    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
        [alertView hideWithCompletionBlock:^{
            NSLog(@"Alert view closed.");
            
            UIWebView*callWebview =[[UIWebView alloc] init];
            NSURL *telURL =[NSURL URLWithString:@"tel:15921266530"];
            [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
            [self.view addSubview:callWebview];

        }];
    }];
    [alertView showWithAnimation:URBAlertAnimationSlideLeft];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ButtonClickViewController *controller = (ButtonClickViewController *)segue.destinationViewController;
    controller = (ButtonClickViewController *)segue.destinationViewController;
    if([segue.identifier isEqualToString:@"sequeBtn1"])
    {
        controller.valueLabeltext = @"Button One";
    }
    if([segue.identifier isEqualToString:@"sequeBtn2"])
    {
        controller.valueLabeltext = @"Button Two";
    }
    if([segue.identifier isEqualToString:@"sequeBtn3"])
    {
        controller.valueLabeltext = @"Button Three";
    }
    if([segue.identifier isEqualToString:@"sequeBtn4"])
    {
        controller.valueLabeltext = @"Button Four";
    }
    if([segue.identifier isEqualToString:@"sequeBtn5"])
    {
        controller.valueLabeltext = @"Button Five";
    }
    if([segue.identifier isEqualToString:@"sequeBtn6"])
    {
        controller.valueLabeltext = @"Button Six";
    }
   
}

@end

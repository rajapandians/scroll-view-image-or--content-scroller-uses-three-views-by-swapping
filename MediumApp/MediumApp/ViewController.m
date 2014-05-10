//
//  ViewController.m
//  scrollMediumapp
//
//  Created by dev8-Rajapandian on 05/05/14.
//  Copyright (c) 2014 scrollTest. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController (){
    UIImageView *image;
    UILabel *viewText;
    float lastYOffsetScroll;
    UIView *borderView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    lastYOffsetScroll = NSNotFound;
    
    
    image = [[UIImageView alloc] initWithFrame:self.view.bounds];
    image.image = [UIImage imageNamed:@"canon_powershot_sx160_is_29.jpg"];
    image.contentMode = UIViewContentModeScaleAspectFill;
    image.backgroundColor = [UIColor blackColor];
    image.clipsToBounds = YES;
    [self.view addSubview:image];
    
    _scrollContent = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollContent.contentSize = CGSizeMake(320, 2000);
    _scrollContent.backgroundColor = [UIColor clearColor];
    _scrollContent.delegate = self;
    _scrollContent.directionalLockEnabled = YES;
    
    viewText  = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height/2, 310,  self.view.bounds.size.height/4)];
    viewText.backgroundColor = [UIColor colorWithRed:209/255.0 green:32/255.0 blue:36/255.0 alpha:0.7];
    viewText.userInteractionEnabled = NO;
    viewText.numberOfLines = 5;
    viewText.font = [UIFont fontWithName:@"GillSans-Light" size:25];
    viewText.textColor = [UIColor whiteColor];
    viewText.text = @"The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick.";
    [_scrollContent addSubview:viewText];
    
    
    
    //${PRODUCT_NAME} 
    borderView = [[UIView alloc] initWithFrame:CGRectMake(0, viewText.frame.origin.y+viewText.frame.size.height+10, 320, 100)];
    borderView.backgroundColor = [UIColor colorWithRed:209/255.0 green:32/255.0 blue:36/255.0 alpha:0.7];//[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.7];
    //borderView.layer.cornerRadius = 10;
    borderView.userInteractionEnabled = NO;
    [_scrollContent addSubview:borderView];
    
   
    
    
    UIImageView *profilePic = [[UIImageView alloc] initWithFrame:CGRectMake(107.5, 7.5, 85, 85)];
    
    profilePic.layer.cornerRadius = 85/2;
    profilePic.layer.borderColor = [[UIColor colorWithRed:209/255.0 green:32/255.0 blue:36/255.0 alpha:0.7] CGColor];
    profilePic.layer.borderWidth = 5;
    //profilePic.layer.mask = [self getMaskPath:profilePic.bounds];
    profilePic.contentMode = UIViewContentModeScaleAspectFill;
    profilePic.image = [UIImage imageNamed:@"800_hackus.jpg"];;
    profilePic.clipsToBounds = YES;
    [borderView addSubview:profilePic];
    
    UILabel *text2  = [[UILabel alloc] init];
    text2.frame = CGRectMake(0, _scrollContent.frame.size.height, 320, 350);
    text2.backgroundColor = [UIColor whiteColor];
    text2.textColor = [UIColor darkGrayColor];
    text2.numberOfLines = 30;
    text2.layer.cornerRadius = 10;
    text2.font = [UIFont fontWithName:HELVETICA_LIGHT size:18];
    text2.userInteractionEnabled = NO;
    text2.text = @"Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick.Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick";

    
//    CALayer *layer = [CALayer new];
//    layer.shadowOffset = CGSizeMake(1, 1);
//    layer.shadowColor = [[UIColor blackColor] CGColor];
//    layer.shadowRadius = 4.0f;
//    layer.shadowOpacity = 0.80f;
//    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
//    [text2.layer addSublayer:layer];
    [_scrollContent addSubview:text2];
    
    
    
    [self.view addSubview:_scrollContent];

    
    //[self startMyMotionDetect];
    
}


-(id)getMaskPath:(CGRect)objectBounds{
    
    CGPathRef radiusPath = CGPathCreateWithEllipseInRect(objectBounds, NULL);
    CAShapeLayer *radiusPathShape = [CAShapeLayer layer];
    radiusPathShape.frame = objectBounds;
    radiusPathShape.path = radiusPath;
    radiusPathShape.strokeColor = [[UIColor colorWithRed:209/255.0 green:32/255.0 blue:36/255.0 alpha:0.7] CGColor];
    radiusPathShape.lineWidth = 5;
    
    CGPathRelease(radiusPath);
    
    return (id)radiusPathShape;
}



//-(void)scrollViewDidScrollX:(UIScrollView *)scrollView{
//    
//    
//    if(lastYOffsetScroll != NSNotFound){
//        
//        if(lastYOffsetScroll > scrollView.contentOffset.y){
//            NSLog(@"goes up");
//        }
//        
//        if(lastYOffsetScroll < scrollView.contentOffset.y){
//            NSLog(@"goes down");
//        }
//    }
//    
//    
//    NSLog(@"%f",scrollView.contentOffset.y );
//    CGRect vF = scrollView.bounds;
//    vF.origin.y = 0;
//    if(scrollView.contentOffset.y > 0){
//        vF.size.height = vF.size.height - (scrollView.contentOffset.y-(scrollView.contentOffset.y*0.2));
//    }else{
//      //  vF.origin.y = 0;
//    }
//    
//    //vF.origin.y = vF.origin.y>0?0:vF.origin.y;
//    NSLog(@"vF %f",vF.origin.y);
//    [UIView animateWithDuration:0.0 animations:^{
//        ss.frame =vF;
//        
//    }];
//    
//    lastYOffsetScroll = scrollView.contentOffset.y;
//}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if(lastYOffsetScroll != NSNotFound){
     
        if(lastYOffsetScroll > scrollView.contentOffset.y){
            //NSLog(@"goes up");
        }
        
        if(lastYOffsetScroll < scrollView.contentOffset.y){
            //NSLog(@"goes down");
        }
    }
    
    
    NSLog(@"%f",scrollView.contentOffset.y );
    
    CGRect vF = scrollView.bounds;
    
    if(scrollView.contentOffset.y > 0){
        vF.origin.y = -(scrollView.contentOffset.y-(scrollView.contentOffset.y*0.24));
    }else{
        vF.origin.y = 0;
    }
    
    
    [UIView animateWithDuration:0.0 animations:^{
    
        image.frame =vF;
        
    }];
    
    lastYOffsetScroll = scrollView.contentOffset.y;
}

-(void)setViewData:(feedObject *)viewData{
    
    image.image = viewData.feedImage;
    viewText.text = viewData.feedText;
    
    //[viewData.feedText drawInRect:viewText.frame withFont:viewText.font]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

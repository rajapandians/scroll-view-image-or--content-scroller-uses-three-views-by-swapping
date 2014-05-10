//
//  HomeViewController.m
//  MediumApp
//
//  Created by dev8-Rajapandian on 07/05/14.
//  Copyright (c) 2014 MediumApp. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"
#import "feedObject.h"
@interface HomeViewController (){
    
    ViewController *firstView;
    ViewController *secondView;
    ViewController *thirdView;
    
    UIScrollView *mainScrollView;
    
    float currentIndex;
     NSMutableArray *testValues;
}

@end

@implementation HomeViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    testValues = [[NSMutableArray alloc] init];
    
    feedObject *f1 = [[feedObject alloc] init];
    f1.feedImage = [UIImage imageNamed:@"00017-JourneysSM1David-Lazar-jpg_111940.jpg"];
    f1.feedText = @"Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment";
    
    feedObject *f2 = [[feedObject alloc] init];
    f2.feedImage = [UIImage imageNamed:@"canon_powershot_sx160_is_29.jpg"];
    f2.feedText = @"FCC’s new Net neutrality rules will stick.Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb";
    
    feedObject *f3 = [[feedObject alloc] init];
    f3.feedImage = [UIImage imageNamed:@"outfit110414544161386156057.jpg"];
    f3.feedText = @"Broadband traffic to ensure the FCC’s new Net neutrality rules will stick.Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.";
    
    feedObject *f4 = [[feedObject alloc] init];
    f4.feedImage = [UIImage imageNamed:@"_SCN4340.JPG"];
    f4.feedText = @"She found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC";
    
    feedObject *f5 = [[feedObject alloc] init];
    f5.feedImage = [UIImage imageNamed:@"00022-YTPOTY1518RUFeliciaSimion3-jpg_111949.jpg"];
    f5.feedText = @"Net neutrality rules will stick.Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.";
    
    feedObject *f6 = [[feedObject alloc] init];
    f6.feedImage = [UIImage imageNamed:@"_SCN4153.JPG"];
    f6.feedText = @"West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick.Using the Find My iPhone app on her computer, she found that someone had taken";
    
    feedObject *f7 = [[feedObject alloc] init];
    f7.feedImage = [UIImage imageNamed:@"canon_powershot_sx160_is_29.jpg"];
    f7.feedText = @"Someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick";
    
    feedObject *f8 = [[feedObject alloc] init];
    f8.feedImage = [UIImage imageNamed:@"_SCN4381.JPG"];
    f8.feedText = @"Los Angeles exurb, 30 miles east of her West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick";
    
    feedObject *f9 = [[feedObject alloc] init];
    f9.feedImage = [UIImage imageNamed:@"red-fox-in-snow.jpg"];
    f9.feedText = @"Traffic to ensure the FCC’s new Net neutrality rules will stick.Using the Find My iPhone app on her computer, she found that someone had taken the phones to a home in this Los Angeles exurb, 30 miles east of her West Hollywood apartment.The nonprofit software maker has submitted a proposal to the FCC that puts a new twist on an old idea of “reclassifying” broadband traffic to ensure the FCC’s new Net neutrality rules will stick";
    
    
    
    [testValues addObject:f1];
    [testValues addObject:f2];
    [testValues addObject:f3];
    [testValues addObject:f4];
    [testValues addObject:f5];
    [testValues addObject:f6];
    [testValues addObject:f7];
    [testValues addObject:f8];
    [testValues addObject:f9];
    
    
    CGRect mainFrame = CGRectZero;
    
    firstView = [[ViewController alloc] init];
    secondView = [[ViewController alloc] init];
    thirdView = [[ViewController alloc] init];
    
    mainFrame = firstView.view.frame;
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    mainScrollView.pagingEnabled = YES;
    mainScrollView.delegate = self;
    mainScrollView.contentSize = CGSizeMake(mainScrollView.frame.size.width*testValues.count, mainScrollView.frame.size.height);
    mainScrollView.showsHorizontalScrollIndicator = YES;
    mainScrollView.directionalLockEnabled = YES;
    
    mainFrame.origin.x = 0;
    firstView.view.frame = mainFrame;
    mainFrame.origin.x = CGRectGetWidth(mainScrollView.frame);
    secondView.view.frame = mainFrame;
    mainFrame.origin.x = CGRectGetWidth(mainScrollView.frame)*2;
    thirdView.view.frame = mainFrame;
    
    [self addChildViewController:firstView];
    [mainScrollView addSubview:firstView.view];
    [firstView didMoveToParentViewController:self];
    
    [self addChildViewController:secondView];
    [mainScrollView addSubview:secondView.view];
    [secondView didMoveToParentViewController:self];
    
    [self addChildViewController:thirdView];
    [mainScrollView addSubview:thirdView.view];
    [thirdView didMoveToParentViewController:self];
    
    [firstView setViewData:testValues[0]];
    [secondView setViewData:testValues[1]];
    [thirdView setViewData:testValues[2]];
    
    [self.view addSubview:mainScrollView];
    
    
}


#pragma -mark UIScrollView delegates


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //have to add fix for last view visible @ the end of the scrollview
    
    currentIndex = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    

    
    NSLog(@"scrollViewDidEndDecelerating %f : currentIndex %f ",scrollView.contentOffset.x,currentIndex);
    
    NSLog(@"firstView %f : secondView %f : thirdView %f: ",firstView.view.frame.origin.x,secondView.view.frame.origin.x,thirdView.view.frame.origin.x);
    
    if(scrollView.contentOffset.x == 0){
        scrollView.scrollEnabled = YES;
        return;
    }
    
    
    if(firstView.view.frame.origin.x == scrollView.contentOffset.x){
        
        NSLog(@"firstView");
        [firstView setViewData:[testValues objectAtIndex:currentIndex]];
        
        secondView.view.frame = CGRectMake(firstView.view.frame.origin.x - CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        //thirdView.view.frame = CGRectMake(firstView.view.frame.origin.x + CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        thirdView.view.frame = CGRectMake(((firstView.view.frame.origin.x + CGRectGetWidth(scrollView.frame))>=scrollView.contentSize.width?0:(firstView.view.frame.origin.x + CGRectGetWidth(scrollView.frame))), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        
        if( (currentIndex - 1) >= 0){
            
            [secondView.scrollContent setContentOffset:CGPointZero];
            [secondView setViewData:[testValues objectAtIndex:(currentIndex - 1)]];
        }
        
        if( (currentIndex + 1) < testValues.count){
            
            [thirdView.scrollContent setContentOffset:CGPointZero];
            [thirdView setViewData:[testValues objectAtIndex:(currentIndex + 1)]];
        }
        
        scrollView.scrollEnabled = YES;
        return;
    }
    
    
    if(secondView.view.frame.origin.x == scrollView.contentOffset.x){
        
        NSLog(@"secondView");
        [secondView setViewData:[testValues objectAtIndex:currentIndex]];
        
        firstView.view.frame = CGRectMake(secondView.view.frame.origin.x - CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        //thirdView.view.frame = CGRectMake(secondView.view.frame.origin.x + CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        thirdView.view.frame = CGRectMake(((secondView.view.frame.origin.x + CGRectGetWidth(scrollView.frame))>=scrollView.contentSize.width?0:(secondView.view.frame.origin.x + CGRectGetWidth(scrollView.frame))),  0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        
        
        if( (currentIndex - 1) >= 0){
            [firstView.scrollContent setContentOffset:CGPointZero];;
            [firstView setViewData:[testValues objectAtIndex:(currentIndex - 1)]];
        }
        
        if( (currentIndex + 1) < testValues.count){
             [thirdView.scrollContent setContentOffset:CGPointZero];
             [thirdView setViewData:[testValues objectAtIndex:(currentIndex + 1)]];
        }
        scrollView.scrollEnabled = YES;
        return;
    }
    
    if(thirdView.view.frame.origin.x == scrollView.contentOffset.x){
        
        NSLog(@"thirdView");
         [thirdView setViewData:[testValues objectAtIndex:currentIndex]];
        
        firstView.view.frame = CGRectMake(thirdView.view.frame.origin.x - CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        //secondView.view.frame = CGRectMake(thirdView.view.frame.origin.x + CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        secondView.view.frame = CGRectMake(((thirdView.view.frame.origin.x + CGRectGetWidth(scrollView.frame))>=scrollView.contentSize.width?0:(thirdView.view.frame.origin.x + CGRectGetWidth(scrollView.frame))), 0, CGRectGetWidth(firstView.view.frame),CGRectGetHeight(firstView.view.frame));
        
        if( (currentIndex - 1) >= 0){
            [firstView.scrollContent setContentOffset:CGPointZero];
            [firstView setViewData:[testValues objectAtIndex:(currentIndex - 1)]];
        }
        
        if( (currentIndex + 1) < testValues.count){
            [secondView.scrollContent setContentOffset:CGPointZero];
            [secondView setViewData:[testValues objectAtIndex:(currentIndex + 1)]];
        }
        
        scrollView.scrollEnabled = YES;
        return;
    }
    
    
    
    scrollView.scrollEnabled = YES;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
    scrollView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

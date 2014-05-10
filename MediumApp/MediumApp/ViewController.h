//
//  ViewController.h
//  scrollMediumapp
//
//  Created by dev8-Rajapandian on 05/05/14.
//  Copyright (c) 2014 scrollTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "feedObject.h"
@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollContent;
@property (strong, nonatomic) feedObject *viewData;

@end

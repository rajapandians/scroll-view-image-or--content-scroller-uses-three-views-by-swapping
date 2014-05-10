//
//  feedObject.h
//  MediumApp
//
//  Created by dev8-Rajapandian on 07/05/14.
//  Copyright (c) 2014 MediumApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface feedObject : NSObject
@property(nonatomic, strong) NSString *feedText;
@property(nonatomic, strong) UIImage *feedImage;
@property(assign) int key;
@end

//
//  CSChartsBackground.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsBackground.h"

@implementation CSChartsBackground
-(id)init{
    if (self = [super init]) {
        self.viceLineColor = [UIColor lightGrayColor];
        self.mainLineColor = [UIColor blackColor];
        self.colorRegionArray = nil;
		self.isRegionSeparated = YES;
		self.shouldDrawHorizontalViceLines = YES;
    }
    return self;
}
@end

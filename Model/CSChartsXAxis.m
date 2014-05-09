//
//  CSChartsXAxis.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsXAxis.h"

@implementation CSChartsXAxis
-(id)init{
    if (self = [super init]) {
        self.color = [UIColor colorWithRed:95 / 255.0 green:0 /255.0 blue:55 / 255.0 alpha:1];
        self.signColor = [UIColor blackColor];
        self.signFont = [UIFont boldSystemFontOfSize:10];
        self.axisWidth = 2;
    }
    return self;
}
@end

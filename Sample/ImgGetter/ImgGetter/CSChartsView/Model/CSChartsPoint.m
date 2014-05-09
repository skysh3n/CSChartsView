//
//  CSChartsPoint.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsPoint.h"

@implementation CSChartsPoint

-(id)init{
    if (self = [super init]) {
        self.shouldShowDetail = NO;
        self.pointStyle = CSChartsPointStyleHollow;
		self.color = [UIColor brownColor];
    }
    return self;
}

@end

CSChartsPoint *CSChartsPointMake(CGFloat x,CGFloat y){
    CSChartsPoint * point = [[CSChartsPoint alloc] init];
    point.x = x;
    point.y = y;
    return point;
}
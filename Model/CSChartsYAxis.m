//
//  CSChartsYAxis.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsYAxis.h"

@implementation CSChartsYAxis
-(id)init{
    if (self = [super init]) {
        self.color = [UIColor blackColor];
        self.font = [UIFont boldSystemFontOfSize:9];
		self.axisUnit = [[CSAxisUnit alloc] init];
		self.signFormat = @"%0.0f";
		self.isNeeded = YES;
    }
    return self;
}
@end

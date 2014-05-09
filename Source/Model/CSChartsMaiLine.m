//
//  CSChartsMaiLine.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsMaiLine.h"

@implementation CSChartsMaiLine
-(id)init{
    if (self = [super init]) {
        self.color = [UIColor blackColor];
        self.lineWidth = 2;
        self.detailRect = [[CSChartsDetailRect alloc] init];
    }
    return self;
}
@end

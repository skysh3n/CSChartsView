//
//  CSCharts.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSCharts.h"

@interface CSCharts(){

}

@end

@implementation CSCharts

-(id)init{
    if (self = [super init]) {
        self.xAxis = [[CSChartsXAxis alloc] init];
        self.yAxis = [[CSChartsYAxis alloc] init];
        self.background = [[CSChartsBackground alloc] init];
        self.mainLine = [[CSChartsMaiLine alloc] init];
    }
    return self;
}

@end

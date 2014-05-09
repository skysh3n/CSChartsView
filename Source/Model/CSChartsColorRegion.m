//
//  CSChartsColorRegion.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-11.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsColorRegion.h"

@implementation CSChartsColorRegion

@end

CSChartsColorRegion *CSChartsColorRegionMake(UIColor *color,CGFloat regionRange){
	CSChartsColorRegion *colorRegion = [[CSChartsColorRegion alloc] init];
	colorRegion.color = color;
	colorRegion.regionRange = regionRange;
	return colorRegion;
}
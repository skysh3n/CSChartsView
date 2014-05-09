//
//  CSChartsColorRegion.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-11.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSChartsColorRegion : NSObject
@property(nonatomic,strong) UIColor *color;
@property(nonatomic) CGFloat regionRange;
@end

//convenient method
CSChartsColorRegion *CSChartsColorRegionMake(UIColor *color,CGFloat regionRange);
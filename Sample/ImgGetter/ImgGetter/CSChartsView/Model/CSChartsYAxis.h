//
//  CSChartsYAxis.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSAxisUnit.h"

@interface CSChartsYAxis : NSObject
@property(nonatomic) NSInteger signAmount;
@property(nonatomic) CGFloat max;
@property(nonatomic) CGFloat min;
@property(nonatomic,strong) UIFont *font;
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) CSAxisUnit *axisUnit;
@property(nonatomic,strong) NSString *signFormat;
@property(nonatomic) BOOL isNeeded;
@end

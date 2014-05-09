//
//  CSChartsMaiLine.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSChartsDetailRect.h"

@interface CSChartsMaiLine : NSObject
@property(nonatomic,strong) NSArray *pointArray;
@property(nonatomic,strong) UIColor *color;
@property(nonatomic) CGFloat lineWidth;
@property(nonatomic,strong) CSChartsDetailRect *detailRect;
@end

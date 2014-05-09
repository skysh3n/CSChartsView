//
//  CSChartsBackgroundLayer.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CSCharts.h"

@interface CSChartsBackgroundLayer : CALayer

@property(nonatomic,weak) CSCharts *charts;

@end

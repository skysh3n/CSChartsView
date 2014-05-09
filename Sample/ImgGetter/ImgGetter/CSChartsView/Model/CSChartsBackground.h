//
//  CSChartsBackground.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSChartsBackground : NSObject
@property(nonatomic,strong) UIColor *viceLineColor;
@property(nonatomic,strong) UIColor *mainLineColor;
@property(nonatomic,strong) NSArray *colorRegionArray;
@property(nonatomic) BOOL isRegionSeparated;
@property(nonatomic) BOOL shouldDrawHorizontalViceLines;
@end

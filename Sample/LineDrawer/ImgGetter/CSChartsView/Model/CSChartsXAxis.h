//
//  CSChartsXAxis.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSChartsXAxis : NSObject
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) NSArray *signArray;
@property(nonatomic,strong) UIColor *signColor;
@property(nonatomic,strong) UIFont *signFont;
@property(nonatomic) CGFloat axisWidth;
@end

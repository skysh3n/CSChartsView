//
//  CSChartsPoint.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	CSChartsPointStyleNone		=	  -1,	///< none point
    CSChartsPointStyleHollow     =    0,    ///< hollow point
    CSChartsPointStyleSolid      =    1,     ///< solid point
	CSChartsPointStyleSolidWhite  =   2,	///< solid white
	CSChartsPointStyleSolidWhiteBorder  =  3	///< solid white border
} CSChartsPointStyle;


@interface CSChartsPoint : NSObject

@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;
@property(nonatomic) CSChartsPointStyle pointStyle;
@property(nonatomic) BOOL shouldShowDetail;
@property(nonatomic,strong) UIColor *color;

@end

//convenient method
CSChartsPoint *CSChartsPointMake(CGFloat x,CGFloat y);
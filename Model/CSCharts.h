//
//  CSCharts.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#define CSCHARTS_SPACING 5
#define CSCHARTS_DETAILRECT_FROM_MAINLINE_SPACING 10
#define PORT_SPACING_RATE 0.10135135135135
#define TAP_GESTURE_REG_RADIUS 20
#define CSCHARTS_TOP_EXTRA_SPACING 2

#import <Foundation/Foundation.h>
#import "CSChartsXAxis.h"
#import "CSChartsYAxis.h"
#import "CSChartsBackground.h"
#import "CSChartsMaiLine.h"

@interface CSCharts : NSObject{
@public
    //auxiliary parameters
    CGPoint points[12];
}
@property(nonatomic,strong) CSChartsXAxis *xAxis;
@property(nonatomic,strong) CSChartsYAxis *yAxis;
@property(nonatomic,strong) CSChartsBackground *background;
@property(nonatomic,strong) CSChartsMaiLine *mainLine;
@property(nonatomic) CGRect frame;



//auxiliary parameters
//@property(nonatomic,)
@property(nonatomic,readonly) CGFloat bottomSpacing;
@property(nonatomic,readonly) CGFloat leftSpacing;
@property(nonatomic,readonly) CGFloat topSpacing;
@property(nonatomic,readonly) NSInteger horizontalLineAmount;
@property(nonatomic,readonly) NSInteger verticalLineAmount;
@end

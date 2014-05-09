//
//  CSChartsView.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSChartsPoint.h"

@protocol CSChartsViewDelegate <NSObject>

@optional
-(void)pointSelected:(NSInteger) index;
-(void)leftSwipeGesturePerformed;
-(void)rightSwipeGesturePerformed;
-(void)pinchGesturePerformed:(UIPinchGestureRecognizer *) pinchGestureRecognizer;
@end

@interface CSChartsView : UIView
@property(nonatomic,strong) UIColor *mainLineColor UI_APPEARANCE_SELECTOR;

//delegate
@property(nonatomic,weak) id<CSChartsViewDelegate> delegate;

//detail rect
@property(nonatomic) CGSize detailRectSize UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIFont *detailRectFont UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIColor *detailRectColor UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) NSString *detailRectTextFormat UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) NSString *detailRectUnitString UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIFont *detailRectUnitFont UI_APPEARANCE_SELECTOR;

//background
@property(nonatomic,strong) UIColor *backgroundViceLineColor UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIColor *backgroundMainLineColor UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) NSArray *colorRegionArray UI_APPEARANCE_SELECTOR;
@property(nonatomic) BOOL isRegionSeparated UI_APPEARANCE_SELECTOR;
@property(nonatomic) BOOL shouldDrawHorizontalViceLines UI_APPEARANCE_SELECTOR;

//y Axis
@property(nonatomic,strong) UIFont *yAxisFont UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIColor *yAxisColor UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) NSString *yAxisSignFormat UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) NSString *yAxisUnitString UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIFont *yAxisUnitFont UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIColor *yAxisUnitColor UI_APPEARANCE_SELECTOR;
@property(nonatomic) BOOL needYAxis UI_APPEARANCE_SELECTOR;

//x Axis
@property(nonatomic,strong) UIColor *xAxisColor UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIColor *xAxisSignColor UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UIFont *xAxisSignFont UI_APPEARANCE_SELECTOR;

//necessary property
@property(nonatomic,strong) NSArray *mainLinePointArray;
@property(nonatomic,strong) NSArray *xAxisSignArray;
@property(nonatomic) NSInteger yAxisSignAmount;
@property(nonatomic) CGFloat yAxisMax;
@property(nonatomic) CGFloat yAxisMin;

//refresh view
-(void) refreshCSChartsView;
-(void) refreshBackgroundLayer;
-(void) refreshMainLineLayer;
-(void) refreshXAxisLayer;

@end









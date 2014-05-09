//
//  CSChartsView.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsView.h"
#import "CSCharts.h"
#import "CSChartsBackgroundLayer.h"
#import "CSChartsMainLineLayer.h"
#import "CSChartsXAxisLayer.h"

@interface CSChartsView (){
    CSCharts *charts;
    CSChartsBackgroundLayer *backgroundLayer;
    CSChartsMainLineLayer *mainLineLayer;
    CSChartsXAxisLayer *xAxisLayer;
	UITapGestureRecognizer *tapGestureRecognizer;
}

@end

@implementation CSChartsView


#pragma mark - life cycle methods
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        charts = [[CSCharts alloc] init];
        charts.frame = frame;
        
        backgroundLayer = [CSChartsBackgroundLayer layer];
        backgroundLayer.charts = charts;
        backgroundLayer.frame = CGRectInset(self.layer.bounds,0,0);
		backgroundLayer.contentsScale = [[UIScreen mainScreen] scale];
        
        mainLineLayer = [CSChartsMainLineLayer layer];
        mainLineLayer.charts = charts;
        mainLineLayer.frame = CGRectInset(self.layer.bounds,0,0);
		mainLineLayer.contentsScale = [[UIScreen mainScreen] scale];
        
        xAxisLayer = [CSChartsXAxisLayer layer];
        xAxisLayer.charts = charts;
        xAxisLayer.frame = CGRectInset(self.layer.bounds,0,0);
		xAxisLayer.contentsScale = [[UIScreen mainScreen] scale];
        
        [self.layer addSublayer:backgroundLayer];
        [self.layer addSublayer:mainLineLayer];
        [self.layer addSublayer:xAxisLayer];
		
		//add gesture
		tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturePerformed)];
		[self addGestureRecognizer:tapGestureRecognizer];
		[self refreshCSChartsView];
    }
    return self;
}

#pragma mark - refresh methods
-(void) refreshCSChartsView{
    [self refreshBackgroundLayer];
    [self refreshMainLineLayer];
    [self refreshXAxisLayer];
}

-(void) refreshBackgroundLayer{
    [backgroundLayer setNeedsDisplay];
}

-(void) refreshMainLineLayer{
    [mainLineLayer setNeedsDisplay];
}

-(void) refreshXAxisLayer{
    [xAxisLayer setNeedsDisplay];
}

#pragma mark - action method
-(void)tapGesturePerformed{
	CGPoint tapPoint = [tapGestureRecognizer locationInView:self];
	NSInteger index = [self pointsIndexTapped:tapPoint];
	if (index != -1) {
		if ([self.delegate respondsToSelector:@selector(pointSelected:)]) {
			[self.delegate pointSelected:index];
		}
	}
	[self setPointChosen:index];
	[self refreshMainLineLayer];
}

#pragma mark - UIAppearance methods
-(BOOL)needYAxis{
	return charts.yAxis.isNeeded;
}

-(void)setNeedYAxis:(BOOL)needYAxis{
	charts.yAxis.isNeeded = needYAxis;
}

-(NSString *)detailRectUnitString{
	return charts.mainLine.detailRect.unitString;
}

-(void)setDetailRectUnitString:(NSString *)detailRectUnitString{
	charts.mainLine.detailRect.unitString = detailRectUnitString;
}

-(UIFont *)detailRectUnitFont{
	return charts.mainLine.detailRect.unitFont;
}

-(void)setDetailRectUnitFont:(UIFont *)detailRectUnitFont{
	charts.mainLine.detailRect.unitFont = detailRectUnitFont;
}

-(BOOL)shouldDrawHorizontalViceLines{
	return charts.background.shouldDrawHorizontalViceLines;
}

-(void)setShouldDrawHorizontalViceLines:(BOOL)shouldDrawHorizontalViceLines{
	charts.background.shouldDrawHorizontalViceLines = shouldDrawHorizontalViceLines;
}

-(NSString *)yAxisSignFormat{
	return charts.yAxis.signFormat;
}

-(void)setYAxisSignFormat:(NSString *)yAxisSignFormat{
	charts.yAxis.signFormat = yAxisSignFormat;
}

-(NSString *)yAxisUnitString{
	return charts.yAxis.axisUnit.unitString;
}

-(void)setYAxisUnitString:(NSString *)yAxisUnitString{
	charts.yAxis.axisUnit.unitString = yAxisUnitString;
}

-(UIColor *)yAxisUnitColor{
	return charts.yAxis.axisUnit.color;
}

-(void)setYAxisUnitColor:(UIColor *)yAxisUnitColor{
	charts.yAxis.axisUnit.color = yAxisUnitColor;
}

-(UIFont *)yAxisUnitFont{
	return charts.yAxis.axisUnit.font;
}

-(void)setYAxisUnitFont:(UIFont *)yAxisUnitFont{
	charts.yAxis.axisUnit.font = yAxisUnitFont;
}

-(BOOL)isRegionSeparated{
	return charts.background.isRegionSeparated;
}

-(void)setIsRegionSeparated:(BOOL)isRegionSeparated{
	charts.background.isRegionSeparated = isRegionSeparated;
}

-(NSString *)detailRectTextFormat{
	return charts.mainLine.detailRect.textFormat;
}

-(void)setDetailRectTextFormat:(NSString *)detailRectTextFormat{
	charts.mainLine.detailRect.textFormat = detailRectTextFormat;
}

-(UIColor *)detailRectColor{
	return charts.mainLine.detailRect.color;
}

-(void)setDetailRectColor:(UIColor *)detailRectColor{
	charts.mainLine.detailRect.color = detailRectColor;
}

-(UIFont *)detailRectFont{
	return charts.mainLine.detailRect.font;
}

-(void)setDetailRectFont:(UIFont *)detailRectFont{
	charts.mainLine.detailRect.font = detailRectFont;
}

-(NSArray *)colorRegionArray{
	return charts.background.colorRegionArray;
}

-(void)setColorRegionArray:(NSArray *)colorRegionArray{
	charts.background.colorRegionArray = colorRegionArray;
}

-(UIColor *)yAxisColor{
    return charts.yAxis.color;
}

-(void)setYAxisColor:(UIColor *)yAxisColor{
    charts.yAxis.color = yAxisColor;
}

-(UIFont *)yAxisFont{
    return charts.yAxis.font;
}

-(void)setYAxisFont:(UIFont *)yAxisFont{
    charts.yAxis.font = yAxisFont;
}

-(UIColor *)backgroundMainLineColor{
    return charts.background.mainLineColor;
}

-(void)setBackgroundMainLineColor:(UIColor *)backgroundMainLineColor{
    charts.background.mainLineColor = backgroundMainLineColor;
}

-(UIColor *)backgroundViceLineColor{
    return charts.background.viceLineColor;
}

-(void)setBackgroundViceLineColor:(UIColor *)backgroundViceLineColor{
    charts.background.viceLineColor = backgroundViceLineColor;
}

-(UIColor *)mainLineColor{
    return charts.mainLine.color;
}

-(void)setMainLineColor:(UIColor *)mainLineColor{
    charts.mainLine.color = mainLineColor;
}

-(UIColor *)xAxisColor{
    return charts.xAxis.color;
}

-(void)setXAxisColor:(UIColor *)xAxisColor{
    charts.xAxis.color = xAxisColor;
}

-(UIColor *)xAxisSignColor{
    return charts.xAxis.signColor;
}

-(void)setXAxisSignColor:(UIColor *)xAxisSignColor{
    charts.xAxis.signColor = xAxisSignColor;
}

-(UIFont *)xAxisSignFont{
    return charts.xAxis.signFont;
}

-(void)setXAxisSignFont:(UIFont *)xAxisSignFont{
    charts.xAxis.signFont = xAxisSignFont;
}

-(CGSize)detailRectSize{
    return charts.mainLine.detailRect.size;
}

-(void)setDetailRectSize:(CGSize)detailRectSize{
    charts.mainLine.detailRect.size = detailRectSize;
}

#pragma mark - necessary property setter and getter
-(CGFloat)yAxisMax{
    return charts.yAxis.max;
}

-(void)setYAxisMax:(CGFloat)yAxisMax{
    charts.yAxis.max = yAxisMax;
}

-(CGFloat)yAxisMin{
    return charts.yAxis.min;
}

-(void)setYAxisMin:(CGFloat)yAxisMin{
    charts.yAxis.min = yAxisMin;
}

-(NSInteger)yAxisSignAmount{
    return charts.yAxis.signAmount;
}

-(void)setYAxisSignAmount:(NSInteger)yAxisSignAmount{
    charts.yAxis.signAmount = yAxisSignAmount;
}

-(NSArray *)xAxisSignArray{
    return charts.xAxis.signArray;
}

-(void)setXAxisSignArray:(NSArray *)xAxisSignArray{
    charts.xAxis.signArray = xAxisSignArray;
}

-(NSArray *)mainLinePointArray{
    return charts.mainLine.pointArray;
}

-(void)setMainLinePointArray:(NSArray *)mainLinePointArray{
    charts.mainLine.pointArray = mainLinePointArray;
}

#pragma mark - delegate setter
-(void)setDelegate:(id<CSChartsViewDelegate>)delegate{
	_delegate = delegate;
	//add gesture
//	UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(leftSwipeGesturePerformed)];
//	leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
//	UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(rightSwipeGesturePerformed)];
//	rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
	UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(pinchGesturePerformed:)];
//
//	[self addGestureRecognizer:leftSwipeGestureRecognizer];
//	[self addGestureRecognizer:rightSwipeGestureRecognizer];
	[self addGestureRecognizer:pinchGestureRecognizer];
}

#pragma mark - private
-(CGFloat)distanceBetweenPoint:(CGPoint) pointA and:(CGPoint) pointB{
	return sqrt((pointA.x - pointB.x) * (pointA.x - pointB.x) + (pointA.y - pointB.y) * (pointA.y - pointB.y));
}

-(NSInteger)pointsIndexTapped:(CGPoint) point{
	for (int i = 0; i < charts.mainLine.pointArray.count; i++) {
		if ([self distanceBetweenPoint:charts->points[i] and:point] <= TAP_GESTURE_REG_RADIUS) {
			return i;
		}
	}
	return -1;
}

-(void)setPointChosen:(NSInteger) index{
	if (index != -1) {
		for (int i = 0; i < charts.mainLine.pointArray.count; i++) {
			CSChartsPoint *point = [charts.mainLine.pointArray objectAtIndex:i];
			point.shouldShowDetail = NO;
			point.pointStyle = CSChartsPointStyleSolidWhite;
		}
		CSChartsPoint *point = [charts.mainLine.pointArray objectAtIndex:index];
		point.shouldShowDetail = YES;
		point.pointStyle = CSChartsPointStyleSolidWhiteBorder;
	}
}
@end










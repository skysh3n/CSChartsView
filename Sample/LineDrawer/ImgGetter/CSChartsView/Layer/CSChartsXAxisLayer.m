//
//  CSChartsXAxisLayer.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsXAxisLayer.h"
#import "NSString+BoundingRect.h"

@interface CSChartsXAxisLayer (){
	CGSize yAxisCharacterSize;
    CGSize xAxisCharacterSize;
    CGFloat bottomSpacing;
    CGFloat leftSpacing;
    CGFloat topSpacing;
    NSInteger horizontalLineAmount;
	CGFloat horizontalSpacing;
	NSUInteger verticalLineAmount;
    CGFloat portSpacing;
    CGFloat verticalSpacing;
	CGFloat chartsContentHeight;
	CGFloat yAxisMax;
	CGFloat yAxisMin;
	CGFloat xAxisYPosition;
}
@end

@implementation CSChartsXAxisLayer
-(void)drawInContext:(CGContextRef)ctx{
	[self paramsPreparation];
    /*********************/
    /* draw X Axis lines */
    /*********************/
    [self drawXAxisLines:ctx];
    
    /*********************/
    /* draw X Axis signs */
    /*********************/
	[self drawXAxisSigns:ctx];
}

#pragma mark - private
#pragma mark -- draw method
-(void)drawXAxisLines:(CGContextRef)ctx{
    CGPoint points[2];
    //set line width
    CGContextSetLineWidth(ctx, self.charts.xAxis.axisWidth);
    //set line style
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //set anti alias off
    CGContextSetShouldAntialias(ctx, NO);
    //set line color
    CGContextSetStrokeColorWithColor(ctx, self.charts.xAxis.color.CGColor);
    //set the points
    points[0] = CGPointMake(self.charts.frame.size.width, xAxisYPosition);
    points[1] = CGPointMake(leftSpacing, xAxisYPosition);
    CGContextAddLines(ctx, points, 2);
    //commit draw
    CGContextStrokePath(ctx);
}

-(void)drawXAxisSigns:(CGContextRef)ctx{
	UIColor *xAxisSignColor = self.charts.xAxis.signColor;
    UIFont *xAxisSignFont = self.charts.xAxis.signFont;
    CGFloat xAxisSignPosition = leftSpacing + portSpacing;
    
    //set Anti alias
    CGContextSetShouldAntialias(ctx, YES);
   
	CGContextSetFillColorWithColor(ctx, xAxisSignColor.CGColor);
    UIGraphicsPushContext(ctx);
    for (int i = 0; i < self.charts.xAxis.signArray.count; i ++ , xAxisSignPosition += verticalSpacing) {
        //draw characters
        NSString *drawString = [self.charts.xAxis.signArray objectAtIndex:i];
        CGSize drawStringSize = [drawString boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.yAxis.font withLineSpacing:3];
//        [drawString drawAtPoint:CGPointMake(xAxisSignPosition - drawStringSize.width / 2, xAxisYPosition + CSCHARTS_SPACING) withAttributes:attributes];
		[drawString drawAtPoint:CGPointMake(xAxisSignPosition - drawStringSize.width / 2, xAxisYPosition + CSCHARTS_SPACING) withFont:xAxisSignFont];
    }
    UIGraphicsPopContext();
}

#pragma mark -- param init method
-(void)paramsPreparation{
	yAxisCharacterSize = [[NSString stringWithFormat:@"%0.f",self.charts.yAxis.max] boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.yAxis.font withLineSpacing:3];
	xAxisCharacterSize = [[self.charts.xAxis.signArray objectAtIndex:0] boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.xAxis.signFont withLineSpacing:3];
    bottomSpacing = xAxisCharacterSize.height + CSCHARTS_SPACING * 2;
    if (self.charts.yAxis.isNeeded) {
		leftSpacing = yAxisCharacterSize.width + CSCHARTS_SPACING * 2;
	}else{
		leftSpacing = 0;
	}
    topSpacing = yAxisCharacterSize.height / 2 + CSCHARTS_TOP_EXTRA_SPACING;
    horizontalLineAmount = (self.charts.yAxis.signAmount - 1) * 5;
	horizontalSpacing = (self.charts.frame.size.height - topSpacing - bottomSpacing) / (horizontalLineAmount - 1);
	verticalLineAmount = self.charts.xAxis.signArray.count;
    portSpacing = (self.charts.frame.size.width - leftSpacing) * PORT_SPACING_RATE;
    
    verticalSpacing = (self.charts.frame.size.width - portSpacing * 2 - leftSpacing) / (verticalLineAmount - 1);
	yAxisMax = self.charts.yAxis.max;
	yAxisMin = self.charts.yAxis.min;
	chartsContentHeight = self.charts.frame.size.height - bottomSpacing - topSpacing;
	xAxisYPosition = self.charts.frame.size.height - bottomSpacing - self.charts.xAxis.axisWidth / 2;
}

@end

















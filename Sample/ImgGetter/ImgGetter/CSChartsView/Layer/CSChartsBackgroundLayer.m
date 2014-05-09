//
//  CSChartsBackgroundLayer.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-4.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsBackgroundLayer.h"
#import "NSString+BoundingRect.h"
#import "CSChartsColorRegion.h"

@interface CSChartsBackgroundLayer (){
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
	UIColor *yAxisColor;
    UIFont *yAxisFont;
    CGFloat characterSpacing;
	CGFloat chartsContentHeight;
	CGFloat yAxisMax;
	CGFloat yAxisMin;
	CGFloat unitHeight;
}
@end

@implementation CSChartsBackgroundLayer

-(void)drawInContext:(CGContextRef)ctx{
	[self paramsPreparation];
	
	/******************************/
    /*draw background color region*/
    /******************************/
	[self drawBackgroundColorRegion:ctx];
	
    /***********************************/
    /*draw background horizontal lines */
    /***********************************/
	[self drawBackgroundHorizontalLines:ctx];
    
    /***********************************/
    /*draw background vertical lines */
    /***********************************/
    [self drawBackgroundVerticalLines:ctx];
	
	/***********************************/
    /*  draw background y xAis unit   **/
    /***********************************/
//    [self drawBackgroundYXAisUnit:ctx];
	   
    /***********************************/
    /*  draw background y xAis signs  **/
    /***********************************/
	if (self.charts.yAxis.isNeeded) {
		[self drawBackgroundYXAisSigns:ctx];
	}
}


#pragma mark - private
#pragma mark -- draw method
-(void)drawBackgroundColorRegion:(CGContextRef) ctx{
	CGFloat rectY = topSpacing + chartsContentHeight;
	NSArray *colorRegionArray = self.charts.background.colorRegionArray;
	for (CSChartsColorRegion *colorRegion in colorRegionArray) {
		if (self.charts.background.isRegionSeparated) {
			CGFloat rectHeight = colorRegion.regionRange / (yAxisMax - yAxisMin) * chartsContentHeight;
			rectY -= rectHeight;
			CGRect drawRect = CGRectMake(leftSpacing - 3, rectY, self.charts.frame.size.width - leftSpacing + 3, rectHeight);
			//draw rect back
			//set color
			CGContextSetFillColorWithColor(ctx, colorRegion.color.CGColor);
			//fill rect
			CGContextFillRect(ctx, drawRect);
			//commit draw
			CGContextStrokePath(ctx);
		}else{
			NSArray *colors = @[
								[[colorRegionArray objectAtIndex:0] color],
								[[colorRegionArray objectAtIndex:1] color]
								];
			[self drawGradientColor:ctx
								rect:CGRectMake(leftSpacing, topSpacing, 320 - leftSpacing, chartsContentHeight)
							 options:kCGGradientDrawsAfterEndLocation
							  colors:colors];
			CGContextStrokePath(ctx);
			CGContextFillPath(ctx);
		}
	}
	
}

-(void)drawBackgroundHorizontalLines:(CGContextRef) ctx{
	//set line width
    CGContextSetLineWidth(ctx, 0.5);
    //set line style
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    //set anti alias off
    CGContextSetShouldAntialias(ctx, NO);
	
    CGPoint points[2];
    CGFloat lineYPosition = topSpacing;
    for (int i = 0;i < horizontalLineAmount; i ++ , lineYPosition += horizontalSpacing) {
        //set line color
        if (i % 5 == 0) {
            UIColor *mainLineColor = self.charts.background.mainLineColor;
            CGContextSetStrokeColorWithColor(ctx, mainLineColor.CGColor);
			//set dash linez
			if (i != 0) {
				CGFloat lengths[] = {3,1};
				CGContextSetLineDash(ctx, 0,lengths, 2);
			}
			//set the points
			points[0] = CGPointMake(self.charts.frame.size.width, lineYPosition);
			points[1] = CGPointMake(leftSpacing, lineYPosition);
			CGContextAddLines(ctx, points, 2);
			//commit draw
			CGContextStrokePath(ctx);
        }else if(self.charts.background.shouldDrawHorizontalViceLines){
            UIColor *viceLineColor = self.charts.background.viceLineColor;
            CGContextSetStrokeColorWithColor(ctx, viceLineColor.CGColor);
			//set dash linez
			if (i != 0) {
				CGFloat lengths[] = {3,1};
				CGContextSetLineDash(ctx, 0,lengths, 2);
			}
			//set the points
			points[0] = CGPointMake(self.charts.frame.size.width, lineYPosition);
			points[1] = CGPointMake(leftSpacing, lineYPosition);
			CGContextAddLines(ctx, points, 2);
			//commit draw
			CGContextStrokePath(ctx);
        }
        
    }

}

-(void)drawBackgroundVerticalLines:(CGContextRef) ctx{
	//set LineDash mode off
	CGPoint points[2];
    CGContextSetLineDash(ctx, 0,nil, 0);
    CGFloat lineXPosition = leftSpacing + portSpacing;
    
    for (int i = 0;i < verticalLineAmount; i ++ , lineXPosition += verticalSpacing) {
        //set line color
        UIColor *viceLineColor = self.charts.background.viceLineColor;
        CGContextSetStrokeColorWithColor(ctx, viceLineColor.CGColor);
        //set the points
        points[0] = CGPointMake(lineXPosition, topSpacing);
        points[1] = CGPointMake(lineXPosition, self.charts.frame.size.height - bottomSpacing);
        CGContextAddLines(ctx, points, 2);
        //commit draw
        CGContextStrokePath(ctx);
    }
}

-(void)drawBackgroundYXAisUnit:(CGContextRef) ctx{
//	//set Anti alias
//    CGContextSetShouldAntialias(ctx, YES);
//    //set line font
//    NSDictionary * attributes = @{
//                                  NSFontAttributeName: self.charts.yAxis.axisUnit.font,
//                                  NSForegroundColorAttributeName:self.charts.yAxis.axisUnit.color
//								  };
//    UIGraphicsPushContext(ctx);
//	CGSize axisUnitSize = [self.charts.yAxis.axisUnit.unitString boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.yAxis.font withLineSpacing:3];
//	[self.charts.yAxis.axisUnit.unitString drawAtPoint:CGPointMake((leftSpacing - axisUnitSize.width) / 2, 0) withAttributes:attributes];
//    UIGraphicsPopContext();
}

-(void)drawBackgroundYXAisSigns:(CGContextRef) ctx{
	//set Anti alias
    CGContextSetShouldAntialias(ctx, YES);
    //set line font
	CGContextSetFillColorWithColor(ctx, yAxisColor.CGColor);
    UIGraphicsPushContext(ctx);
    
	CGFloat drawNum = self.charts.yAxis.max;
    CGFloat numGap = (self.charts.yAxis.max - self.charts.yAxis.min)/(self.charts.yAxis.signAmount - 1);
	CGFloat characterPosition = CSCHARTS_TOP_EXTRA_SPACING;
    for (int i = 0; i < self.charts.yAxis.signAmount - 1; i ++ , characterPosition += characterSpacing) {
        //draw characters
        NSString *drawString = [NSString stringWithFormat:self.charts.yAxis.signFormat, drawNum];
        CGSize drawStringSize = [drawString boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.yAxis.font withLineSpacing:3];
		[drawString drawAtPoint:CGPointMake((leftSpacing - drawStringSize.width) / 2, characterPosition) withFont:yAxisFont];
        drawNum -= numGap;
    }
    UIGraphicsPopContext();
}

#pragma mark -- param init method
-(void)paramsPreparation{
	yAxisCharacterSize = [[NSString stringWithFormat:self.charts.yAxis.signFormat,self.charts.yAxis.max] boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.yAxis.font withLineSpacing:3];
   xAxisCharacterSize = [[self.charts.xAxis.signArray objectAtIndex:0] boundingRectWithSize:CGSizeMake(200, 200) withTextFont:self.charts.xAxis.signFont withLineSpacing:3];
    bottomSpacing = xAxisCharacterSize.height + CSCHARTS_SPACING * 2;
	if (self.charts.yAxis.isNeeded) {
		leftSpacing = yAxisCharacterSize.width + CSCHARTS_SPACING * 2;
	}else{
		leftSpacing = 0;
	}
    topSpacing = yAxisCharacterSize.height / 2 + CSCHARTS_TOP_EXTRA_SPACING;
    horizontalLineAmount = (self.charts.yAxis.signAmount - 1) * 5 + 1;
	horizontalSpacing = (self.charts.frame.size.height - topSpacing - bottomSpacing) / (horizontalLineAmount - 1);
	verticalLineAmount = self.charts.xAxis.signArray.count;
    portSpacing = (self.charts.frame.size.width - leftSpacing) * PORT_SPACING_RATE;
    
    verticalSpacing = (self.charts.frame.size.width - portSpacing * 2 - leftSpacing) / (verticalLineAmount - 1);
	yAxisColor = self.charts.yAxis.color;
    yAxisFont = self.charts.yAxis.font;
    characterSpacing = horizontalSpacing * 5;
	yAxisMax = self.charts.yAxis.max;
	yAxisMin = self.charts.yAxis.min;
	chartsContentHeight = self.charts.frame.size.height - bottomSpacing - topSpacing;
//	unitHeight = 10;
}

/**
 * (“别人写的”————Cruise Shen注)绘制背景色渐变的矩形，p_colors渐变颜色设置，集合中存储UIColor对象（创建Color时一定用三原色来创建）
 **/
- (void)drawGradientColor:(CGContextRef)p_context
                      rect:(CGRect)p_clipRect
                   options:(CGGradientDrawingOptions)p_options
                    colors:(NSArray *)p_colors {
    CGContextSaveGState(p_context);// 保持住现在的context
    CGContextClipToRect(p_context, p_clipRect);// 截取对应的context
    NSUInteger colorCount = p_colors.count;
    int numOfComponents = 4;
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colorComponents[colorCount * numOfComponents];
    for (int i = 0; i < colorCount; i++) {
        UIColor *color = p_colors[i];
        CGColorRef temcolorRef = color.CGColor;
        const CGFloat *components = CGColorGetComponents(temcolorRef);
        for (int j = 0; j < numOfComponents; ++j) {
            colorComponents[i * numOfComponents + j] = components[j];
        }
    }
    CGGradientRef gradient =  CGGradientCreateWithColorComponents(rgb, colorComponents, NULL, colorCount);
    CGColorSpaceRelease(rgb);
    CGPoint startPoint = p_clipRect.origin;
    CGPoint endPoint = CGPointMake(CGRectGetMinX(p_clipRect), CGRectGetMaxY(p_clipRect));
    CGContextDrawLinearGradient(p_context, gradient, startPoint, endPoint, p_options);
    CGGradientRelease(gradient);
    CGContextRestoreGState(p_context);// 恢复到之前的context
}
@end





































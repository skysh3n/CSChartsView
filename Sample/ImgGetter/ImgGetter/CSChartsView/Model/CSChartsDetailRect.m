//
//  CSChartsDetailRect.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-12.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "CSChartsDetailRect.h"

@implementation CSChartsDetailRect
-(id)init{
    if (self = [super init]) {
		self.font = [UIFont boldSystemFontOfSize:18];
        self.size = CGSizeMake(45, 25);
		self.color = [UIColor greenColor];
		self.textFormat = @"%0.f";
		self.unitString = @"";
		self.unitFont = [UIFont boldSystemFontOfSize:13];
    }
    return self;
}
@end

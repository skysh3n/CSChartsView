//
//  CSChartsDetailRect.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-12.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSChartsDetailRect : NSObject
@property(nonatomic) CGSize size;
@property(nonatomic,strong) UIFont *font;
@property(nonatomic,strong) NSString *textFormat;
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) NSString *unitString;
@property(nonatomic,strong) UIFont *unitFont;

@end

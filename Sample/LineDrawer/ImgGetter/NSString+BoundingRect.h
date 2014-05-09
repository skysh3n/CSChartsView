//
//  NSString+BoundingRect.h
//  ImgGetter
//
//  Created by 沈凯 on 14-3-5.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BoundingRect)
//calculate text size
-(CGSize)boundingRectWithSize:(CGSize)size withTextFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing;
//transform sting to AttributedString
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing;
@end

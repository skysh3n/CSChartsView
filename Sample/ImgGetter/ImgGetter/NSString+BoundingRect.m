//
//  NSString+BoundingRect.m
//  ImgGetter
//
//  Created by 沈凯 on 14-3-5.
//  Copyright (c) 2014年 CruiseShen. All rights reserved.
//

#import "NSString+BoundingRect.h"

@implementation NSString (BoundingRect)
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [self length])];
    return attributedStr;
}

-(CGSize)boundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributedText = [self attributedStringFromStingWithFont:font                                                                   withLineSpacing:lineSpacing];
    CGSize textSize = [attributedText boundingRectWithSize:size
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil].size;
    return textSize;
}
@end

//
//  UIFont+FontSize.m
//  AxProject
//
//  Created by jiangtd on 16/1/13.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import "UIFont+FontSize.h"

@implementation UIFont (FontSize)

//返回-1表示获取失败
-(CGFloat)fontSize
{
    NSString *des = [self description];
    NSArray *desArr = [des componentsSeparatedByString:@";"];
    
    NSString *key = @"font-size";
    NSString *desStr = nil;
    for (NSString *str in desArr) {
        if ([str containsString:key]) {
            desStr = str;
            break;
        }
    }
    if (desStr) {
        NSArray *desStrArr = [desStr componentsSeparatedByString:@" "];
        desStr = nil;
        for (NSString *str in desStrArr) {
            if ([str containsString:@"."]) {
                desStr = str;
                break;
            }
        }
        if (desStr) {
            NSInteger len = [desStr length];
            if (len > 2) {
                desStr = [desStr substringToIndex:len - 2];
                return [desStr floatValue];
            }
            else
            {
                return  -1;
            }
        }
        
    }
    return  -1;
}

@end









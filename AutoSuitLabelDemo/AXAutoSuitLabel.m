//
//  AXAutoSuitLabel.m
//  AxProject
//
//  Created by jiangtd on 16/1/13.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import "AXAutoSuitLabel.h"
#import "UIFont+FontSize.h"

#define MinFontSize 10

@implementation AXAutoSuitLabel

+(AXAutoSuitLabel*)autoSuitLabel
{
    return [[self alloc] init];
}

-(void)awakeFromNib
{
    self.textAlignment = NSTextAlignmentCenter;
    self.numberOfLines = 0;
}

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.numberOfLines = 0;
    }
    return self;
}

-(void)setText:(NSString *)text
{
    BOOL isSesseed = [self reSetFontWithText:text];
    if(isSesseed)
    {
        [super setText:text];
    }
}

-(BOOL)reSetFontWithText:(NSString*)text
{
    UIFont *currentFont = self.font;
    CGFloat width = [text boundingRectWithSize:CGSizeMake(999999999, 21) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:currentFont} context:nil].size.width;
    
    //计算的宽度大于当前控件的宽度
    if (width > self.bounds.size.width) {
        width = self.bounds.size.width;
        CGFloat height = [text boundingRectWithSize:CGSizeMake(width, 9999999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:currentFont} context:nil].size.height;
        
        //如果计算的高度也大于当前控件的高度，重新调整字体
        BOOL reSetSesseed = NO;
        if (height > self.bounds.size.height)
        {
            CGFloat fontSize = [currentFont fontSize];
            for (int i = fontSize - 1; i >= MinFontSize; i--)
            {
                height = [text boundingRectWithSize:CGSizeMake(width, 9999999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:i]} context:nil].size.height;
                if (height <= self.bounds.size.height) {
                    [self setFont:[UIFont systemFontOfSize:i]];
                    reSetSesseed = YES;
                     break;
                }
            }
            if (!reSetSesseed) {
                return NO;
            }
            
        }
    }
    else
    {
        //可容纳下，不用调整字体大小
        return YES;
    }
    
    return YES;
}

@end



















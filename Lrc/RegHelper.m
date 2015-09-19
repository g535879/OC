//
//  RegHelper.m
//  homework09_19
//
//  Created by 古玉彬 on 15/9/19.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "RegHelper.h"

@implementation RegHelper
/**
    str:需要匹配的字符串
    pattern:正则表达式
 **/
+ (NSArray *)regHelper:(NSString *)str andPattern:(NSString *)pattern;
{
   
    NSMutableArray *array = [[NSMutableArray alloc] init];
    //转成oc语法
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *arr3 = [regular matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    for(NSTextCheckingResult *res in arr3){
        //返回的是符合条件的范围。（res.range）
        NSMutableString *m_str1 = [[NSMutableString alloc ]initWithString:[str substringWithRange:res.range]];
        [array addObject:m_str1];
    }
    return array;
}
@end

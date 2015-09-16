//
//  main.m
//  homework09_16
//
//  Created by 古玉彬 on 15/9/16.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //需要匹配的语句
        NSString *str1 = @"[00:01:01]where are you from[00:01:07]i come from china";
        //正则表达式
        NSString *pattern = @"\\d{2}\\][^\\[]*";
        NSMutableArray *array = [[NSMutableArray alloc] init];
        //转成oc语法
        NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *arr3 = [regular matchesInString:str1 options:0 range:NSMakeRange(0, str1.length)];
        for(NSTextCheckingResult *res in arr3){
            //返回的是符合条件的范围。（res.range）
            NSMutableString *m_str1 = [[NSMutableString alloc ]initWithString:[str1 substringWithRange:res.range]];
            [m_str1 replaceOccurrencesOfString:@"]" withString:@": " options:0 range:NSMakeRange(0, [m_str1 length])];
            [array addObject:m_str1];
        }
        NSString *resultString = [array componentsJoinedByString:@" "];
        NSLog(@"%@",resultString);
    }
    return 0;
}

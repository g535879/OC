//
//  Manage.m
//  homework09_19
//
//  Created by 古玉彬 on 15/9/19.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "Manage.h"
#import "RegHelper.h"

#define PATH @"/Users/guyubin/lrc.txt"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
@implementation Manage

- (instancetype) init
{
    self = [super init];
    if(self){
        _lrc = [LRC defaultLrcObj];
    }
    return self;
}
- (void) readLrcFromFile
{
    NSString *str = [[NSString alloc] initWithContentsOfFile:PATH encoding:NSUTF8StringEncoding error:nil];
    NSArray *time = [RegHelper regHelper:str andPattern:@".*?\\]"];
    _lrc.lrc_time_array = time;
    NSArray *content = [RegHelper regHelper:str andPattern:@"(?<=\\]).*"];
    unsigned long lrc_length = [time count] > [content count] ? [content count] : [time count];
    for(int i = 0; i < lrc_length; i++){
        [_lrc.lrc_dic setObject:content[i] forKey:time[i]];
    }
    if([_lrc.lrc_dic count] > 0){
        NSLog(@"读入歌词完成!");
    }
}

- (void) findLrcByTime:(int)m andM:(int)s andMs:(int)ms
{
    
    NSString *time = [self changeNumberToLrcTimeString:[NSString stringWithFormat:@"%d",m] andM:[NSString stringWithFormat:@"%d",s]  andMs:[NSString stringWithFormat:@"%d",ms]];
    NSString *resultString = [_lrc.lrc_dic objectForKey:time];
    if(resultString){
        NSLog(@"找到匹配结果：");
        NSLog(@"%@%@\n",time,resultString);
    }
    else{
        NSLog(@"未找到该歌词!");
    }
}

- (void) listAllLrc
{
    for(NSString *key in _lrc.lrc_time_array){
        NSLog(@"%@%@",key,[_lrc.lrc_dic objectForKey:key]);
        sleep(2);
    }
}
//把用户输入的时间转化为歌词的形式
- (NSString *) changeNumberToLrcTimeString:(NSString*)m andM:(NSString *)s andMs:(NSString *)ms
{
    m = [self checkTime:m];
    s = [self checkTime:s];
    ms = [self checkTime:ms];
    NSMutableString *resultString = [[NSMutableString alloc] initWithFormat:@"[%@:%@.%@]",m,s,ms];
    return resultString;
    
}

//检查歌词是否是2位数。
- (NSString *) checkTime:(NSString *)time
{
    return time = [time length] > 1 ? time : [NSString stringWithFormat:@"0%@",time];
}


@end

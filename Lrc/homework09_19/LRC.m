//
//  LRC.m
//  homework09_19
//
//  Created by 古玉彬 on 15/9/19.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "LRC.h"

@implementation LRC
static LRC *singleLrc;
+ (instancetype)defaultLrcObj
{
    if(!singleLrc){
        singleLrc = [[LRC alloc] init];
    }
    return singleLrc;
}

- (instancetype) init
{
    self = [super init];
    if(self){
//        _lrc_array = [[NSArray alloc] init];
    }
    return self;
}
- (NSMutableDictionary *) lrc_dic
{
    if(!_lrc_dic){
        _lrc_dic = [[NSMutableDictionary alloc] init];
    }
    return _lrc_dic;
}
@end

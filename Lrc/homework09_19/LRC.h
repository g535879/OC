//
//  LRC.h
//  homework09_19
//
//  Created by 古玉彬 on 15/9/19.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRC : NSString
@property (nonatomic,strong) NSArray *lrc_time_array;
@property (nonatomic,strong) NSMutableDictionary *lrc_dic;

+ (instancetype)defaultLrcObj;
@end

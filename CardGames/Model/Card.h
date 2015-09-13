//
//  Card.h
//  CardGames
//
//  Created by 古玉彬 on 15/9/10.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic)NSString *contants;
@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;
- (int)match:(NSArray *)otherCards;
@end

//
//  CardMatchingGame.h
//  CardGames
//
//  Created by 古玉彬 on 15/9/12.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Desk.h"
#import "Card.h"
@interface CardMatchingGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count usingDesk:(Desk *)desk;
- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *) cardAtIndex:(NSUInteger)index;
@property (nonatomic,readonly) NSUInteger score;
@end

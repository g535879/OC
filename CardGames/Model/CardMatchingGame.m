//
//  CardMatchingGame.m
//  CardGames
//
//  Created by 古玉彬 on 15/9/12.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "cardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSUInteger score;
@property (strong,nonatomic) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame
- (NSMutableArray *) cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDesk:(Desk *)desk
{
    self = [super self];
    if(self){
        for(int i = 0; i < count; i++){
            Card * card = [desk drawRandomCard];//获取一张随机纸牌
            NSLog(@"%@",card.contants);
            if(card){
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
            
        }

    }
    return self;
}
/*
 得到下标为index的卡牌
 */
- (Card *) cardAtIndex:(NSUInteger)index
{
    return index < [self.cards count] ? self.cards[index] : nil;
}

/*
 逻辑处理。游戏核心
 */
static const int MISMATCH_PENALTY = 1;//罚分
static const int MATCH_BONUS = 4;    //奖励分
static const int COST_TO_CHOOSE = 1;  //点击牌代价
- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self.cards objectAtIndex:index];// 得到选中的卡牌
    if(!card.isMatched){  //只操作未匹配的卡牌。已经匹配完成的卡牌不能操作
        if(card.isChosen){
            card.chosen = NO;
        }
        else{
            for(Card *otherCard in self.cards){
                if(!otherCard.isMatched && otherCard.isChosen){ //没有match而且被选中
                    int matchSore = [card match:@[otherCard]];
                    if(matchSore){
                        self.score += matchSore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }
                    else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            card.chosen = YES;
            self.score -= COST_TO_CHOOSE;   //每次翻牌扣分
        }
    }
}
@end

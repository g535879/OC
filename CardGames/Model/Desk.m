//
//  Desk.m
//  CardGames
//
//  Created by 古玉彬 on 15/9/11.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "Desk.h"
@interface Desk()
@property (strong,nonatomic)NSMutableArray * cards;
@end
@implementation Desk
- (NSMutableArray *) cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}
- (void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}
- (void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}
- (Card *) drawRandomCard
{
    Card *randomCard = nil;
    if([self.cards count]){
        randomCard =  [self.cards objectAtIndex:arc4random() % [self.cards count]];
        [self.cards removeObject:randomCard];
       // NSLog(@"count:%lu",(unsigned long)[self.cards count]);
    }
    return randomCard;
}
@end

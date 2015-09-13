//
//  Desk.h
//  CardGames
//
//  Created by 古玉彬 on 15/9/11.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Desk : NSObject
- (void) addCard:(Card *)card;
- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *) drawRandomCard;
@end

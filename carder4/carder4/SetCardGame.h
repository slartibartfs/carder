//
//  SetCardGame.h
//  Carder
//
//  Created by Michael Schack on 11.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"


@interface SetCardGame : NSObject
-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic) int gameMode;
@property (nonatomic) NSString *resultOfLastFlip;
@property (strong, nonatomic) NSMutableArray *recentlyPlayedCards;
@property (nonatomic) BOOL gameOver;
- (int) checkIfGameIsOver:(SetCardGame *) gameSet;






@end

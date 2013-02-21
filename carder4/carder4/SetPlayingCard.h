//
//  SetPlayingCard.h
//  Carder
//
//  Created by Michael Schack on 12.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "Card.h"

@interface SetPlayingCard : Card

@property (strong, nonatomic) NSNumber *cardColor;
@property (strong, nonatomic) NSNumber *cardSymbol;
@property (strong, nonatomic) NSNumber *cardShading;
@property (nonatomic) NSUInteger cardNumber;

+ (NSArray *)validCardNumbers;
+ (NSArray *)validCardColors;
+ (NSArray *)validCardSymbols;
+ (NSArray *)validCardShadings;
+ (NSUInteger)maxCardNumbers;



@end

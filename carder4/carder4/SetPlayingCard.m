//
//  SetPlayingCard.m
//  Carder
//
//  Created by Michael Schack on 12.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetPlayingCard.h"

@implementation SetPlayingCard

@synthesize cardColor = _cardColor; // because we provide setter AND getter
@synthesize cardSymbol = _cardSymbol;
@synthesize cardShading = _cardShading;
@synthesize cardNumber = _cardNumber;

-(int)match:(NSArray *)otherCards
{
    int score=0;
    
    if (([self.cardSymbol isEqualToNumber: [otherCards[0] cardSymbol]] && [self.cardSymbol isEqualToNumber:[otherCards[1] cardSymbol]] && [[otherCards[0] cardSymbol] isEqualToNumber:[otherCards[1] cardSymbol]]) ||
        (!([self.cardSymbol isEqualToNumber: [otherCards[0] cardSymbol]]) && !([self.cardSymbol isEqualToNumber:[otherCards[1] cardSymbol]]) && !([[otherCards[0] cardSymbol] isEqualToNumber:[otherCards[1] cardSymbol]]))) {
        score++;
        
    } 
    
    if (([self.cardColor isEqualToNumber: [otherCards[0] cardColor]] && [self.cardColor isEqualToNumber:[otherCards[1] cardColor]] && [[otherCards[0] cardColor] isEqualToNumber:[otherCards[1] cardColor]]) ||
        (!([self.cardColor isEqualToNumber: [otherCards[0] cardColor]]) && !([self.cardColor isEqualToNumber:[otherCards[1] cardColor]]) && !([[otherCards[0] cardColor] isEqualToNumber:[otherCards[1] cardColor]]))) {
        score++;
       
    } 
    
    if (([self.cardShading isEqualToNumber: [otherCards[0] cardShading]] && [self.cardShading isEqualToNumber:[otherCards[1] cardShading]] && [[otherCards[0] cardShading] isEqualToNumber:[otherCards[1] cardShading]]) ||
        (!([self.cardShading isEqualToNumber: [otherCards[0] cardShading]]) && !([self.cardShading isEqualToNumber:[otherCards[1] cardShading]]) && !([[otherCards[0] cardShading] isEqualToNumber:[otherCards[1] cardShading]]))) {
        score++;
       
    } 
    
    if ((self.cardNumber == [otherCards[0] cardNumber] && self.cardNumber == [otherCards[1] cardNumber] && [otherCards[0] cardNumber] == [otherCards[1] cardNumber]) ||
        (!(self.cardNumber == [otherCards[0] cardNumber]) && !(self.cardNumber == [otherCards[1] cardNumber]) && !([otherCards[0] cardNumber] == [otherCards[1] cardNumber])))  {
        
        score++;
    } 
    
    if (score==4) return score; else return FALSE;
    
}

- (NSString *) contents
{
    return [NSString stringWithFormat:@"%@-%@-%@-%d",self.cardColor,self.cardSymbol,self.cardShading,self.cardNumber];
    
}


- (void)setCardColor:(NSNumber  *) cardColor
{
    if ( [[SetPlayingCard validCardColors] containsObject:cardColor]) {
        _cardColor = cardColor;
    }
}

- (NSNumber *)cardColor
{
    return _cardColor ? _cardColor : @-1;
}


- (void)setCardSymbol:(NSNumber *) cardSymbol
{
    if ( [[SetPlayingCard validCardSymbols] containsObject:cardSymbol]) {
        _cardSymbol = cardSymbol;
    }
}

- (NSNumber *) cardSymbol
{
    return _cardSymbol ? _cardSymbol : @-1;
}


-(void) setCardShading:(NSNumber *)cardShading
{
    if ( [[SetPlayingCard validCardShadings] containsObject:cardShading]) {
        _cardShading = cardShading;
    }
}

- (NSNumber *) cardShading
{
    return _cardShading ? _cardShading : @-1;
    
}


+ (NSUInteger)maxCardNumbers { return [self validCardNumbers].count; }

- (void)setCardNumber:(NSUInteger)cardNumber
{
    if (cardNumber <= [SetPlayingCard maxCardNumbers]) {
        _cardNumber = cardNumber;
    }
}

+ (NSArray *)validCardNumbers
{
    return @[@1,@2,@3];
    
}

+ (NSArray *)validCardColors
{
    return @[@1,@2,@3];
    
}

+ (NSArray *)validCardSymbols
{
    return @[@1,@2,@3];
}

+ (NSArray *) validCardShadings
{
    return @[@1,@2,@3];
}

@end

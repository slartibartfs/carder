//
//  Deck.h
//  Carder
//
//  Created by Michael Schack on 29.01.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;


@end

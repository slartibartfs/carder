//
//  GameResults.h
//  carder4
//
//  Created by Michael Schack on 23.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResults : NSObject

+(NSArray *) allGameResults;


@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic)  int score;



@end

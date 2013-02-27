//
//  GameResults.m
//  carder4
//
//  Created by Michael Schack on 23.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "GameResults.h"

@interface GameResults()

@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;

@end

@implementation GameResults

#define ALL_RESULTS_KEY @"GameResult_All"

+ (NSArray *) allGameResults
{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]){
        GameResults *result = [[GameResults alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
}

/* unfinished typing
    //convenience initializer
-(id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
    }
}

 */
- (void)synchronize
{
    NSMutableDictionary *mutableGameResultsFromUserDefaults =[[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    
    if (!mutableGameResultsFromUserDefaults) mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

-(id)asPropertyList
{
    return @{START_KEY:self.start,END_KEY:self.end,SCORE_KEY:@{self.score}};
    
}

-(id) init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
    
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

-(void) setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}

@end
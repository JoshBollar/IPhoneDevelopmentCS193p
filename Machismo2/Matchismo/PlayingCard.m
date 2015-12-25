//
//  PlayingCard.m
//  Matchismo
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PlayingCard.h"
@implementation PlayingCard

@synthesize suit = _suit;


+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3",
             @"4", @"5", @"6", @"7", @"8", @"9",
             @"10", @"J", @"Q", @"K"];
}

-(NSString *) contents{
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    //return [NSString stringWithFormat:@"%d%@", self.rank, self.suit];
}

+ (NSArray *) validSuits
{
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

- (void) setSuit:(NSString *) suit
{
    if([[PlayingCard validSuits] containsObject: suit]) {
        _suit = suit;
    }
}

+ (NSUInteger) maxRank {
    return [[self rankStrings] count] - 1;
}

- (void) setRank:(NSUInteger) rank {
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
- (NSString *) suit {
    return _suit ? _suit : @"?";
}
@end
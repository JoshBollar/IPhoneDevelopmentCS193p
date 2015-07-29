//
//  PlayingCard.m
//  CardMatching
//
//  Created by Joshua Bollar on 7/27/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// overwrite getter of contents from Card super class
- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


+(NSArray *) validSuits
{
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

+(NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void)setRank: (NSUInteger) rank
{
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@synthesize suit = _suit; // because we provide getter and setter

- (void)setSuit:(NSString *) suit
{
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}
@end
//
//  PlayingCard.h
//  Matchismo
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#ifndef Matchismo_PlayingCard_h
#define Matchismo_PlayingCard_h


#endif

#import "Card.h"

@interface PlayingCard: Card

@property(strong, nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;
+(NSArray *) validSuits;
+(NSArray *) rankStrings;
+(NSUInteger) maxRank;


@end

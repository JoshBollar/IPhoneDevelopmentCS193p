//
//  PlayingCard.h
//  CardMatching
//
//  Created by Joshua Bollar on 7/27/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "Card.h"

#ifndef CardMatching_PlayingCard_h
#define CardMatching_PlayingCard_h

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSUInteger) maxRank;

@end

#endif

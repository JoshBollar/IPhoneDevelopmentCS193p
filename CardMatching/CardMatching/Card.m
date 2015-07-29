//
//  Card.m
//  CardMatching
//
//  Created by Joshua Bollar on 7/27/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

-(int)match:(Card *)card
{
    int score = 0;
    if([card.contents isEqualToString:self.contents]) {
        score = 1;
    }
    return score;
}

-(int)matchMany:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    return score;
}
@end
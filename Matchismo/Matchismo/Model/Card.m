//
//  Card.m
//  Matchismo
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface Card()

@end

@implementation Card

-(int) match:(NSArray *) otherCards {
    int score = 0;
    
    for (Card * card in otherCards) {
        if( [card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
//
//  Card.h
//  Matchismo
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#ifndef Matchismo_Card_h
#define Matchismo_Card_h


#endif

@interface Card : NSObject

@property (strong) NSString * contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match: (NSArray *) otherCards;

@end

//
//  GameModel.m
//  player_math
//
//  Created by Yana Kultysheva on 2016-07-05.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _player1 = [Player new];
        _player2 = [Player new];
        
        //
        //        _player1 = player1;
        //        _player2 = player2;
        //        _currentPlayer;
    }
    return self;
}


// start game (user, sum)
// take answer
//start game (user, sum)


-(void)generateQuestion {
    
    //int x = 1 + arc4random() % 20

    
 self.x =  arc4random() % 20 +1;
    self.y =  arc4random() % 20 +1;
    
    self.sum = self.x + self.y;
    
}

-(NSString*)generateStringQuestion {
    return [NSString stringWithFormat: @"%d + %d", self.x, self.y];

}


- (void)startGame {
    //    return [[self alloc] init];
    
    
    self.currentPlayer = self.player1;
    self.currentPlayer.name = @"Player 1";

    
    [self generateQuestion];
    
}

-(void)swithPlayer {
    if (self.currentPlayer == self.player1) {
        self.currentPlayer.name = @"Player 2";
        self.currentPlayer = self.player2;
    } else if (self.currentPlayer == self.player2) {
        self.currentPlayer.name = @"Player 1";
        self.currentPlayer = self.player1;
    }
}
;-(void)compareAnswer {

    if (self.currentPlayer.answer != self.sum) {
        self.currentPlayer.score = self.currentPlayer.score - 1;
        NSLog(@"Wrong");
    }
    
    if (self.currentPlayer.score > 0) {
        [self swithPlayer];
        
        [self generateQuestion];
    } else {
        NSLog(@"Game over for %@", self.currentPlayer);
    }
    
}



@end

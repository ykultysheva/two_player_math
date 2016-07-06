//
//  GameModel.h
//  player_math
//
//  Created by Yana Kultysheva on 2016-07-05.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

//-(instancetype)initWithPlayer:(Player *)player;

@property Player *player1;
@property Player *player2;
@property Player *currentPlayer;
@property NSInteger sum;
@property NSString *sumQuestion;
@property int y;
@property int x;


-(void)startGame;

-(void)swithchPlayer;

-(void)compareAnswer;

-(void)generateQuestion;

-(NSString*)generateStringQuestion;



@end

//
//  ViewController.m
//  player_math
//
//  Created by Yana Kultysheva on 2016-07-05.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "GameModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playerAndSum;
@property UILabel *yourAnswer;
@property NSMutableArray *buttons;
@property NSMutableArray *totalNumber;
@property NSInteger yourFinalAnswer;
@property GameModel *game;
@property NSString *question;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create game model
    
    self.game = [GameModel new];
    
    [self.game startGame];
    
    
    self.question = [self.game generateStringQuestion];
    
    
    
    
    
    
    
    self.playerAndSum.text = [NSString stringWithFormat:@"User: %@, Questions: %@", self.game.currentPlayer.name,self.question ];

    
    
    self.yourAnswer = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 200, 50)];
    [self.view addSubview:self.yourAnswer];
    self.yourAnswer.backgroundColor = [UIColor yellowColor];
//    yourAnswer.text = [NSString stringWithFormat:@"Your answer:%li", self.yourFinalAnswer];
    
    
    CGFloat xOrigin = 10;
    NSMutableArray *buttons = [NSMutableArray new];

    
    for (int i = 0; i < 10; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(xOrigin, 200, 33, 33)];
        
        [self.view addSubview:button];
        
        button.backgroundColor = [UIColor blueColor];
        
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        
        
        [buttons addObject:button];
        
        button.tag = i;
        
        xOrigin += 37;
        
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
    }

    
    UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 253, 100, 40)];
    [self.view addSubview:enterButton];
    enterButton.backgroundColor = [UIColor redColor];
    [enterButton setTitle:[NSString stringWithFormat:@"Enter"] forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(enterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    
    
    
    UILabel *player1Score = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, 150, 50)];
    [self.view addSubview:player1Score];
    player1Score.backgroundColor = [UIColor greenColor];
    player1Score.text = [NSString stringWithFormat:@"Player1 Score:"];
    
    UILabel *player2Score = [[UILabel alloc] initWithFrame:CGRectMake(220, 400, 150, 50)];
    [self.view addSubview:player2Score];
    player2Score.backgroundColor = [UIColor greenColor];
    player2Score.text = [NSString stringWithFormat:@"Player2 Score:"];
    
//    NSMutableArray *totalNumber = [[NSMutableArray alloc] init];
//    self.totalNumber = totalNumber;
    
     self.totalNumber = [[NSMutableArray alloc] init];
    
}



- (void)buttonPressed:(UIButton*)button {

    
    NSString* value = [NSString stringWithFormat:@"%li", button.tag];
    
    [self.totalNumber addObject:value];
    
    NSString* combinedAnswer = [self.totalNumber componentsJoinedByString:@""];
    
    self.yourFinalAnswer = combinedAnswer.intValue;
    
    self.game.currentPlayer.answer = self.yourFinalAnswer;
    
    self.yourAnswer.text = [NSString stringWithFormat:@"Your answer:%li", self.yourFinalAnswer];
    
    NSLog(@"%@", self.yourAnswer.text);
    
    if (self.totalNumber.count == 2) {
        self.totalNumber = [[NSMutableArray alloc] init];
    }
    
}

- (void)enterButtonPressed:(UIButton*)enterButton {
    [self.game compareAnswer];
    
    [self.game generateQuestion];
    
    self.question = [self.game generateStringQuestion];
    
    self.playerAndSum.text = [NSString stringWithFormat:@"User: %@, Questions: %@", self.game.currentPlayer.name,self.question ];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

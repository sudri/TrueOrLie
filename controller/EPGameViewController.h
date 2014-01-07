//
//  EPGameViewController.h
//  TrueOrLie
//
//  Created by Eduard Pyatnitsyn on 27.12.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPCircleTimer.h"

@interface EPGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftNoBtn;
@property (weak, nonatomic) IBOutlet UIButton *topYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *topNoBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightNoBtn;
@property (weak, nonatomic) IBOutlet UIButton *bottomYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *bottonNoBtn;
@property (weak, nonatomic) IBOutlet EPCircleTimer *circle;
@property (weak, nonatomic) IBOutlet UILabel *leftScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightScoreLabel;

- (IBAction)leftNo:(id)sender;
- (IBAction)leftYes:(id)sender;
- (IBAction)rightNo:(id)sender;
- (IBAction)rightYes:(id)sender;

-(void) tick;
-(void) nextQuestion;
-(void) changeScore;
-(void) splashTick;
@end

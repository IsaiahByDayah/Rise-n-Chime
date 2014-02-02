//
//  GameMusicMatchViewController.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>


// Name: GameMusicMatchViewController
//
// Description: The View Controller that implements and holds the game logic for playing "Music Match"
//
// To Do:
//  - Implement the game
//
@interface GameMusicMatchViewController : UIViewController <AVAudioPlayerDelegate>


// ***** Properties *****
@property NSString *winString;
@property NSString *currentString;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;

//properties for countdown
//@property NSTimer *gameTimer;
//@property

// The audio player for Music Match Game
@property (strong, nonatomic) AVAudioPlayer* gameMusicPlayer;

@property NSString *musicFileName;

@property NSTimer *stopTimer;

@end
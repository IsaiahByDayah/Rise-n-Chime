//
//  GameMusicMatchViewController.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "GameMusicMatchViewController.h"
#import "RnCAlarmClockViewController.h"


@interface GameMusicMatchViewController ()

@end

@implementation GameMusicMatchViewController



// Name: viewDidLoad
//
// Description: Sets up the View Controller
//
// Input: None
//
// Returns: None
//
// To Do:
//  - Perform initial setup for view controller
//

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setCustomButton];
<<<<<<< HEAD
    self.winString = @"164352";
    NSString *myExamplePath = [[NSBundle mainBundle]
                               pathForResource:self.musicFilePath ofType:@"mp3"];
    self.gameMusicPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL:
                        [NSURL fileURLWithPath:myExamplePath] error:NULL];
    
=======
//<<<<<<< HEAD
    self.winString = @"164352";

>>>>>>> bd32474c933f98944091474933a97cf6c0de1c5a
    self.gameMusicPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL: self.musicFilePath error:NULL];
    self.gameMusicPlayer.delegate = self;
    [self.gameMusicPlayer prepareToPlay];
}



// Name: setCustomButton
//
// Description: Creates custom buttons for game
//
// Input: None
//
// Returns: None
//
// To Do:
//  - Perform initial setup for view controller
-(void)setCustomButton{
    
    NSLog(@"setCustomButton");

/////////Button 1
self.button1.frame = CGRectMake(135.0, 180.0, 40.0, 40.0);//width and height should be same value
self.button1.layer.cornerRadius = 20;//half of the width
[self.button1 setBackgroundColor:[UIColor colorWithRed:(126/255.0) green:(190/255.0) blue:(197/255.0) alpha:1]];
self.button1.layer.shadowOpacity = 0.5;
self.button1.layer.shadowRadius = 1;
    
/////////Button2
self.button2.frame = CGRectMake(135.0, 180.0, 40.0, 40.0);//width and height should be same value
self.button2.layer.cornerRadius = 20;//half of the width
[self.button2 setBackgroundColor:[UIColor colorWithRed:(239/255.0) green:(143/255.0) blue:(97/255.0) alpha:1]];//sets background color of button
self.button2.layer.shadowOpacity = 0.5;
self.button2.layer.shadowRadius = 1;

/////////Button3
self.button3.frame = CGRectMake(135.0, 180.0, 40.0, 40.0);//width and height should be same value
self.button3.layer.cornerRadius = 20;//half of the width
[self.button3 setBackgroundColor:[UIColor colorWithRed:(177/255.0) green:(157/255.0) blue:(201/255.0) alpha:1]];//sets background color of button
self.button3.layer.shadowOpacity = 0.5;
self.button3.layer.shadowRadius = 1;

//////Button4
self.button4.frame = CGRectMake(135.0, 180.0, 40.0, 40.0);//width and height should be same value
self.button4.layer.cornerRadius = 20;//half of the width
[self.button4 setBackgroundColor:[UIColor colorWithRed:(106/255.0) green:(206/255.0) blue:(182/255.0) alpha:1]];//sets background color of button
self.button4.layer.shadowOpacity = 0.5;
self.button4.layer.shadowRadius = 1;
    
//////Button5
self.button5.frame = CGRectMake(135.0, 180.0, 40.0, 40.0);//width and height should be same value
self.button5.layer.cornerRadius = 20;//half of the width
[self.button5 setBackgroundColor:[UIColor colorWithRed:(0/255.0) green:(98/255.0) blue:(139/255.0) alpha:1]];//sets background color of button
self.button5.layer.shadowOpacity = 0.5;
self.button5.layer.shadowRadius = 1;
    
//////Button6
self.button6.frame = CGRectMake(135.0, 180.0, 40.0, 40.0);//width and height should be same value
self.button6.layer.cornerRadius = 20;//half of the width
[self.button6 setBackgroundColor:[UIColor colorWithRed:(168/255.0) green:(88/255.0) blue:(88/255.0) alpha:1]];//sets background color of button
self.button6.layer.shadowOpacity = 0.5;
self.button6.layer.shadowRadius = 1;
}


// Name: Music Game
//
// Description: Game based on music playlist
//
// Input: Alarm
//
// Returns: None
//
// To Do:
//  - Pick a song from user's defined playlist
//  - Pick a random 15 seconds of the song and cut it into 6 segments
//  - Randomize the string and assign each segment a number string
//  -
- (void)newMusicGame {
    
    
}



////////////////////////////////////////////////////
///                                              ///
/// Area Defining Actions when Button is Pressed ///
///                                              ///
////////////////////////////////////////////////////



- (IBAction)Button1Pressed:(id)sender {
    [self playRandomSoundAt:15.0 withDuration:5.0];
    self.currentString = @"1";
}

- (IBAction)Button2Pressed:(id)sender {
    if ([self.currentString isEqualToString:@"16435"]) {
        [self.gameMusicPlayer play];
        self.currentString = @"164352";
        if ([self.currentString isEqualToString:self.winString]) {
            [self endGame];
        }
    } else {
    [self playRandomSoundAt:40.0 withDuration:5.0];
    }
}
- (IBAction)Button3Pressed:(id)sender {
[self playRandomSoundAt:25.0 withDuration:5.0];
    if ([self.currentString isEqualToString:@"164"]) {
        self.currentString = @"1643";
    }
}
- (IBAction)Button4Pressed:(id)sender {
[self playRandomSoundAt:30.0 withDuration:5.0];
    if ([self.currentString isEqualToString:@"16"]) {
        self.currentString = @"164";
    }
}
- (IBAction)Button5Pressed:(id)sender {
[self playRandomSoundAt:35.0 withDuration:5.0];
    if ([self.currentString isEqualToString:@"1643"]) {
        self.currentString = @"16435";
    }
}
- (IBAction)Button6Pressed:(id)sender {
    [self playRandomSoundAt:20.0 withDuration:5.0];
    if ([self.currentString isEqualToString:@"1"]) {
        self.currentString = @"16";
    }

}

///Neat countdown effect
- (void)createTimer {
    // start timer
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.gameTimer forMode:NSDefaultRunLoopMode];
    self.timeCount = 3; // instance variable
}

- (void)timerFired:(NSTimer *)timer {
    // update label
    for (self.timeCount=3; self.timeCount>1;self.timeCount--){
        self.timeRemain.text = @"3";
        self.timeRemain.hidden=NO;
        self.strFromInt = [NSString stringWithFormat:@"%d",self.timeCount];
        self.timeRemain.text=self.strFromInt;
    }
        self.timeRemain.hidden=YES;
}

   

// Name: playRandomSound
//
// Description: Initiates the music game to break song into segments
//
// Input: Starting Time and Duration
//
// Returns: None
//
// To Do:
//  - None
//
-(void)playRandomSoundAt:(NSTimeInterval)startTime withDuration:(NSTimeInterval)duration {

    self.gameMusicPlayer.currentTime = startTime;
    [self.gameMusicPlayer play];
    self.stopTimer = [NSTimer scheduledTimerWithTimeInterval:duration
                                                      target:self
                                                    selector:@selector(stopPlaying:)
                                                    userInfo:nil
                                                     repeats:NO];
}

- (void)stopPlaying:(NSTimer *)theTimer {
    [self.gameMusicPlayer stop];
}
// Name: endGame
//
// Description: alerts the user it's the end of the game
//
// Input: None
//
// Returns: None
//
// To Do:
//  - None
//
- (void)endGame {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You win!" message:@"Enjoy your day!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}



// Name: alertView: clickedButtonAtIndex:
//
// Description: handles result from alarm alert
//
// Input: alertView, NSInteger for index of button response
//
// Returns: None
//
// To Do:
//  - None
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self performSegueWithIdentifier:@"MusicMatchUnwind" sender:self];
    }
}

@end

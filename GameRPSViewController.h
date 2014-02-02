//
//  GameRPSViewController.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>



// Name: GameRPSViewController
//
// Description: The View Controller that implements and holds the game logic for playing "Rock. Paper. Scissors."
//
// To Do:
//  - Implement the game
//
@interface GameRPSViewController : UIViewController{
    int guess;
    int answer;
    NSInteger count;
    NSInteger count2;
    
    IBOutlet UILabel *statusLabel;
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UILabel *winLabel;
    IBOutlet UILabel *loseLabel;
}

// ***** Properties *****

@property (nonatomic, retain) IBOutlet UIImageView *image1;
-(IBAction)button1Pressed;
-(IBAction)button2Pressed;
-(IBAction)button3Pressed;
@end


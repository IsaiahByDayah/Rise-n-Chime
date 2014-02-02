//
//  GameRPSViewController.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "GameRPSViewController.h"

@interface GameRPSViewController ()

@end

@implementation GameRPSViewController

@synthesize image1;

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
    NSString *dissapear = @"Choose wisely";
    statusLabel.text = [NSString stringWithFormat:@"%@", dissapear];
}


-(BOOL)didWin{
    if (count >= 5){
        return YES;
    }
    return NO;
}

-(IBAction)button1Pressed{
    guess = 2;
    image1.image = [UIImage imageNamed:@"rock.jpg"];
    [self setupGame];
    NSString *status1 = @"WIN";
    NSString *status2 = @"LOSE";
    NSString *status3 = @"TIE";
    
    if (answer == 0){
        count++;
        
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status1];
    }
    else if (guess == answer){
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status3];
    }
    else if (answer == 1){
        count2++;
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status2];
    }
    
    if ([self didWin]){
        [self exitGame];
    }
    
}
-(IBAction)button2Pressed{
    guess = 1;
    image1.image = [UIImage imageNamed:@"paper.jpg"];
    [self setupGame];
    NSString *status1 = @"WIN";
    NSString *status2 = @"LOSE";
    NSString *status3 = @"TIE";
    
    if (answer == 2){
        count++;
        
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status1];
    }
    else if (guess == answer){
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status3];
    }
    else if (answer == 0){
        count2++;
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status2];
    }
    
    if ([self didWin]){
        [self exitGame];
    }
    
}
-(IBAction)button3Pressed{
    guess = 0;
    image1.image = [UIImage imageNamed:@"scissors.jpg"];
    [self setupGame];
    NSString *status1 = @"WIN";
    NSString *status2 = @"LOSE";
    NSString *status3 = @"TIE";
    
    if (answer == 1){
        count++;
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status1];
    }
    else if (guess == answer){
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status3];
    }
    else if (answer == 2){
        count2++;
        winLabel.text = [NSString stringWithFormat:@"Win: %i", count];
        loseLabel.text = [NSString stringWithFormat:@"Lose: %i", count2];
        statusLabel.text = [NSString stringWithFormat:@"YOU %@", status2];
    }
    
    if ([self didWin]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Win!" message:@"Have a good morning" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
}

-(void)setupGame{
    
    answer = arc4random()%3;
    if (answer == 0){
        image2.image = [UIImage imageNamed:@"scissors.jpg"];
    }
    else if (answer == 1){
        image2.image = [UIImage imageNamed:@"paper.jpg"];
    }
    else if (answer == 2){
        image2.image = [UIImage imageNamed:@"rock.jpg"];
    }
    
}



// Name: exitGame
//
// Description: exits view controller after winning the game
//
// Input: None
//
// Returns: None
//
// To Do:
//  - Stop alarm sound code
//
- (void)exitGame{
    // ***** Stop alarm sound ***** - for Isaiah
    [self dismissViewControllerAnimated:YES completion:nil];
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
//  - Setup game to start after
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        // ***** Choose and Start Game
        
        // Code for game entering / exiting
        GameRPSViewController *rpsGame =[self.storyboard instantiateViewControllerWithIdentifier:@"GameRPSViewController"];
        [rpsGame setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:rpsGame animated:YES completion:nil];
        //
        //        ** USE ** ---> [self dismissViewControllerAnimated:YES completion:nil];
        //        [self dismissModalViewControllerAnimated:YES];
    }
}

@end

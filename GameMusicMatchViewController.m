//
//  GameMusicMatchViewController.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "GameMusicMatchViewController.h"

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
    
    
}



// Name: soundAlarm:
//
// Description: alerts user of an alarm that goes off
//
// Input: Alarm
//
// Returns: None
//
// To Do:
//  - Setup sound to start
//  - Display alarm's message
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
//  - Setup game to start after
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end

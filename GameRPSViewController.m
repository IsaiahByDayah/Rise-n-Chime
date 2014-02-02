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



// Name: exitGame
//
// Description: Turns off the alarm sound and exits view controller after winning the game
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

@end

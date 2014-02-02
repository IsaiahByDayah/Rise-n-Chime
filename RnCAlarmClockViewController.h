//
//  RnCAlarmClockViewController.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>



// Name: RnCAlarmClockViewController
//
// Description: The main view of the app
//              Displays the time of day and list of created alarms
//
// To Do:
//  - Add the day of the week to the display
//  - Add the graphics to the background
//  - Add physics to the alarm list table view
//
@interface RnCAlarmClockViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>



// ***** Properties *****

// Label that displays the time on the screen
@property (weak, nonatomic) IBOutlet UILabel *timeDisplayLabel;

// What day of the week it is (First 3 letters)
@property NSString *dayOfWeek;

// List of alarms
@property NSMutableArray *alarms;

// What the current date and time is
@property NSDate *currentDate;

// Timer to manage the time of the clock
@property NSTimer *timeKeeper;

// Formatter for displaying the date/time/day
@property NSDateFormatter *formatter;

// List view for holding the alarms
@property (weak, nonatomic) IBOutlet UITableView *alarmView;

// Rather or not to toggle the alarm
@property BOOL toggleAlarm;

// Rather or not the alarm is playing
@property BOOL alarmPlaying;


@end

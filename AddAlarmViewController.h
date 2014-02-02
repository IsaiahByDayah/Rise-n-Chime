//
//  AddAlarmViewController.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alarm.h"



// Name: AddAlarmViewController
//
// Description: The view that takes in the information for an alarm that's to be created
//
// To Do:
//  - create a spot for users to enter personalized message for alarm
//
@interface AddAlarmViewController : UIViewController



// ***** Properties *****

// Time Scroll Wheel
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;

// Text Field for alarm message
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

// Weekday buttons
@property (weak, nonatomic) IBOutlet UIButton *mondayButton;
@property (weak, nonatomic) IBOutlet UIButton *tuesdayButton;
@property (weak, nonatomic) IBOutlet UIButton *wednesdayButton;
@property (weak, nonatomic) IBOutlet UIButton *thursdayButton;
@property (weak, nonatomic) IBOutlet UIButton *fridayButton;
@property (weak, nonatomic) IBOutlet UIButton *saturdayButton;
@property (weak, nonatomic) IBOutlet UIButton *sundayButton;

// Navigation buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

// Alarm that is created
@property Alarm *createdAlarm;

@end

//
//  AddAlarmViewController.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "AddAlarmViewController.h"

@interface AddAlarmViewController ()

@end

@implementation AddAlarmViewController

// Name: prepareForSegue: sender:
//
// Description: Prepares the view controller to return back to the main view controller
//
// Input: Information from screen
//
// Returns: None
//
// To Do:
//  - Add checks before creating alarm
//  - Handle section for message to be entered
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (sender == self.doneButton) {
        
        self.createdAlarm = [[Alarm alloc] init];
        self.createdAlarm.daysOfWeek = [[NSMutableArray alloc] init];
        
        if (self.mondayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Mon"];
        }
        if (self.tuesdayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Tue"];
        }
        if (self.wednesdayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Wed"];
        }
        if (self.thursdayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Thu"];
        }
        if (self.fridayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Fri"];
        }
        if (self.saturdayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Sat"];
        }
        if (self.sundayButton.selected){
            [self.createdAlarm.daysOfWeek addObject:@"Sun"];
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"h:mm a"];
        self.createdAlarm.setTime = [formatter stringFromDate: self.timePicker.date];
        
        self.createdAlarm.alarmEnabled = YES;
        
        if (!([self.messageTextField.text isEqualToString:@""])){
            self.createdAlarm.alarmMessage = self.messageTextField.text;
        } else {
            self.createdAlarm.alarmMessage = @"RING RING RING!";
        }
    }
}

// Description: Toggles the "selected" attribute of button that was touched
//
// Input: the button pressed
//
// Returns: None
//
// To Do:
//  - None
//
- (IBAction)buttonPressed:(UIButton *)sender {
    
        sender.selected = !sender.selected;
    
}



@end

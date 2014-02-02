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
    }
}
- (IBAction)buttonPressed:(UIButton *)sender {
        sender.selected = !sender.selected;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end

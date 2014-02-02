//
//  AddAlarmViewController.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alarm.h"

@interface AddAlarmViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;

@property (weak, nonatomic) IBOutlet UIButton *mondayButton;
@property (weak, nonatomic) IBOutlet UIButton *tuesdayButton;
@property (weak, nonatomic) IBOutlet UIButton *wednesdayButton;
@property (weak, nonatomic) IBOutlet UIButton *thursdayButton;
@property (weak, nonatomic) IBOutlet UIButton *fridayButton;
@property (weak, nonatomic) IBOutlet UIButton *saturdayButton;
@property (weak, nonatomic) IBOutlet UIButton *sundayButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property Alarm *createdAlarm;

@end

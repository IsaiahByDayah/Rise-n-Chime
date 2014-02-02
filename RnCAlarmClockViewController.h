//
//  RnCAlarmClockViewController.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RnCAlarmClockViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *timeDisplayLabel;
@property NSString *dayOfWeek;
@property NSMutableArray *alarms;
@property NSDate *currentDate;
@property NSTimer *timeKeeper;
@property NSDateFormatter *formatter;
@property (weak, nonatomic) IBOutlet UITableView *alarmView;

@end

//
//  Alarm.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>



// Name: Alarm
//
// Description: The alarms that get created, stored, "fired", and viewed by the user
//
// To Do:
//  - None
//
@interface Alarm : NSObject <NSCoding>



// ***** Properties *****

// The time that the alarm is set to sound
@property NSString *setTime;

// The days of the week that the alarm will sound
@property NSMutableArray *daysOfWeek;

// The message to be displayed when the alarm sounds
@property NSString *alarmMessage;

// Tells rather the alarm is armed to sound
@property BOOL alarmEnabled;

@end

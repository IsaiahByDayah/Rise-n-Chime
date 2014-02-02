//
//  Alarm.h
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alarm : NSObject <NSCoding>

@property NSString *setTime;
@property NSMutableArray *daysOfWeek;
@property NSString *alarmMessage;
@property BOOL alarmEnabled;

@end

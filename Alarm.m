//
//  Alarm.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "Alarm.h"

@implementation Alarm

// Name: Description
//
// Description: returns a discription for the alarm
//
// Input: None
//
// Returns: String of description
//
// To Do:
//  - None
//
- (NSString *)description {
    return [@"Alarm set for " stringByAppendingString:self.setTime];
}

// Name: initWithCoder:
//
// Description: Decodes an alarm from a saved file
//
// Input: a NSCoder object
//
// Returns: an Alarm
//
// To Do:
//  - None
//
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    if (self){
        self.setTime = [aDecoder decodeObjectForKey:@"setTime"];
        self.daysOfWeek = [aDecoder decodeObjectForKey:@"daysOfWeek"];
        self.alarmMessage = [aDecoder decodeObjectForKey:@"alarmMessage"];
        self.alarmEnabled = [aDecoder decodeBoolForKey:@"alarmEnabled"];
    }
    return self;
}

// Name: encodeWithCoder:
//
// Description: encodes an alarm for a file
//
// Input: a NSCoder object
//
// Returns: None
//
// To Do:
//  - None
//
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.setTime forKey:@"setTime"];
    [aCoder encodeObject:self.daysOfWeek forKey:@"daysOfWeek"];
    [aCoder encodeObject:self.alarmMessage forKey:@"alarmMessage"];
    [aCoder encodeBool:self.alarmEnabled forKey:@"alarmEnabled"];
}

@end

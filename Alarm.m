//
//  Alarm.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "Alarm.h"

@implementation Alarm

- (NSString *)description {
    return [@"Alarm set for " stringByAppendingString:self.setTime];
} //Nothing was added to .h file

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

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.setTime forKey:@"setTime"];
    [aCoder encodeObject:self.daysOfWeek forKey:@"daysOfWeek"];
    [aCoder encodeObject:self.alarmMessage forKey:@"alarmMessage"];
    [aCoder encodeBool:self.alarmEnabled forKey:@"alarmEnabled"];
}

@end

//
//  RnCAlarmClockViewController.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "RnCAlarmClockViewController.h"
//#import <time.h>
#import "Alarm.h"
#import "AddAlarmViewController.h"

@interface RnCAlarmClockViewController ()

@end

@implementation RnCAlarmClockViewController



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
//    NSLog(@"unwinding...");
    AddAlarmViewController *addController = [segue sourceViewController];
//    NSLog(@"addController Accessed...");
    Alarm *newAlarm = addController.createdAlarm;
//    NSLog(@"New Alarm Created...");
    if (newAlarm != nil) {
//        NSLog(@"New Alarm not 'nil'...");
        [self.alarms addObject:newAlarm];
        [self saveAlarms];

        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.alarms.count-1 inSection:0];
        [self.alarmView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.alarms = [[NSKeyedUnarchiver unarchiveObjectWithFile:[[[self class] applicationDocumentsDirectory] stringByAppendingPathComponent:@"App.data"]] mutableCopy];
    if (!self.alarms){
        self.alarms = [NSMutableArray array];
    }
    
    self.formatter = [[NSDateFormatter alloc] init];
    self.timeKeeper = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timePassed:) userInfo:nil repeats:YES];
    
    self.currentDate = [NSDate date];
    [self.formatter setDateFormat:@"ccc"];
    self.dayOfWeek = [self.formatter stringFromDate:self.currentDate];
    [self.formatter setDateFormat:@"h:mm a"];
    self.timeDisplayLabel.text = [self.formatter stringFromDate:self.currentDate];
}

+ (NSString *) applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

- (void)saveAlarms{
    [NSKeyedArchiver archiveRootObject:self.alarms toFile:[[[self class] applicationDocumentsDirectory] stringByAppendingPathComponent:@"App.data"]];
    NSLog(@"Saved...");
}

- (Alarm *)getAlarm {
    Alarm *myAlarm = [[Alarm alloc] init];
    for (int i = 0; i < [self.alarms count]; i++){
        myAlarm = self.alarms[i];
        if ([myAlarm.daysOfWeek containsObject:self.dayOfWeek] | ([myAlarm.daysOfWeek count] == 0)){
            if ([myAlarm.setTime isEqual:self.timeDisplayLabel.text]){
                if (myAlarm.alarmEnabled){
                    [self.alarms[i] setAlarmEnabled: NO];
                    /*
                     
                     Make it so that when an alarm that repeats on a day rings, it does continue to "ring" but isnt unenabled either
                     
                     */
                    if (myAlarm.daysOfWeek.count == 0){
                        [self.alarmView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]].accessoryType = UITableViewCellAccessoryNone;
                    }
                    
                    return myAlarm;
                }
            }
        }
    }
    return nil;
}

- (void)soundAlarm: (Alarm *)alarm {
    NSLog(@"RING RING RING!");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time to wake up!" message:@"Complete the following game to turn off the alarm..." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        NSLog(@"Start Game!");
    }
}

- (void)timePassed:(NSTimer *)timer {
    //NSLog(@"second passed...");
    self.currentDate = [NSDate date];
    [self.formatter setDateFormat:@"ccc"];
    self.dayOfWeek = [self.formatter stringFromDate:self.currentDate];
    [self.formatter setDateFormat:@"h:mm a"];
    self.timeDisplayLabel.text = [self.formatter stringFromDate:self.currentDate];
    Alarm *alarm = [[Alarm alloc] init];
    alarm = [self getAlarm];
    if (alarm != nil){
        [self soundAlarm:alarm];
    }
    
    
}


- (NSInteger) tableView:(UITableView *)alarmView numberOfRowsInSection:(NSInteger)section {
    return [self.alarms count];
}


- (UITableViewCell *)tableView:(UITableView *)alarmView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"AlarmCell";
    UITableViewCell *cell = [alarmView dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    
    Alarm *currentAlarm = self.alarms[indexPath.row];
    
    cell.textLabel.text = currentAlarm.setTime;
    if (currentAlarm.daysOfWeek.count > 0){
        cell.textLabel.text = [cell.textLabel.text stringByAppendingString:@" -"];
    }
    for (int i = 0; i < [currentAlarm.daysOfWeek count]; i++){
        cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[@" " stringByAppendingString:currentAlarm.daysOfWeek[i]]];
    }
    if (currentAlarm.alarmEnabled) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //cell.imageView.image = currentItem.photo;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.imageView.image = nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Alarm *selectedAlarm = [self.alarms objectAtIndex:indexPath.row];

    if (selectedAlarm.alarmEnabled) {
        [self.alarmView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        //cell.imageView.image = currentItem.photo;
    } else {
        [self.alarmView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        //cell.imageView.image = nil;
    }
    
    //selectedAlarm.alarmEnabled = !selectedAlarm.alarmEnabled;
    
    [[self.alarms objectAtIndex:indexPath.row] setAlarmEnabled:!selectedAlarm.alarmEnabled];
    
    [self.alarmView deselectRowAtIndexPath:indexPath animated:YES];
    [self.alarmView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveAlarms];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.alarms removeObjectAtIndex: indexPath.row];
    [self.alarmView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveAlarms];
}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end

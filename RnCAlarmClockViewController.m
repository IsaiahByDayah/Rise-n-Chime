//
//  RnCAlarmClockViewController.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 1/31/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "RnCAlarmClockViewController.h"
#import "Alarm.h"
#import "AddAlarmViewController.h"
#import "GameRPSViewController.h"
#import "GameMusicMatchViewController.h"
#import "WorldScene.h"

@interface RnCAlarmClockViewController ()

@end

@implementation RnCAlarmClockViewController



// Name: viewDidLoad
//
// Description: prepares the App:
//              - loads alarms if there were any before
//              - establishes formatter
//              - sets the current date/time and starts timer
//
// Input: None
//
// Returns: None
//
// To Do:
//  - None
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    MPMediaPickerController *picker =[[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
//    picker.delegate = self;
//    picker.showsCloudItems = NO;
//    picker.allowsPickingMultipleItems = YES;
//    picker.prompt = @"Add songs to use in games";
//    //picker.prompt = @"Select songs to use in games...";
//    [self presentViewController:picker animated:YES completion:Nil];
    
    self.toggleAlarm = NO;
    self.alarmPlaying = NO;
    
    WorldScene *ws = [WorldScene sceneWithSize:self.mySKView.frame.size];
    [self.mySKView presentScene:ws];
    
    NSString *myExamplePath = [[NSBundle mainBundle]
                               pathForResource:@"Alarm" ofType:@"mp3"];
    self.alarmSpeaker =[[AVAudioPlayer alloc] initWithContentsOfURL:
                     [NSURL fileURLWithPath:myExamplePath] error:NULL];
    self.alarmSpeaker.delegate = self;
    [self.alarmSpeaker prepareToPlay];
    
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
    [self.formatter setDateFormat:@"cccc - LLL d"];
    self.dateDisplayLabel.text = [self.formatter stringFromDate:self.currentDate];
}











// Name: mediaPicker: didPickMediaiTems
//
// Description: handles when the user picks music
//
// Input: media picker, mediaitemcollection
//
// Returns: None
//
// To Do:
//  - Implement
//
-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    if (mediaItemCollection.count > 0){
    self.pickedSongs = mediaItemCollection;
    } else {
        self.pickedSongs = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}












// Name: mediaPickerDidCancel:
//
// Description: handles when the user cancels media picking
//
// Input: media picker
//
// Returns: None
//
// To Do:
//  - None
//
-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    self.pickedSongs = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}












// Name: unwindToList:
//
// Description: if an alarm was created, it adds the alarm to the list of alarms
//              and creates a row for it in the alarm list view table
//
// Input: Segue
//
// Returns: an IBAction
//
// To Do:
//  - None
//
- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddAlarmViewController *addController = [segue sourceViewController];
    Alarm *newAlarm = addController.createdAlarm;
    if (newAlarm != nil) {
        [self.alarms addObject:newAlarm];
        [self saveAlarms];

        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.alarms.count-1 inSection:0];
        [self.alarmView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
}










// Name: returnFromRPS:
//
// Description: toggles alarm after returning
//
// Input: Segue
//
// Returns: an IBAction
//
// To Do:
//  - None
//
- (IBAction)returnFromGame:(UIStoryboardSegue *)segue {
    self.toggleAlarm = YES;
    [self saveAlarms];
    [self.alarmSpeaker setVolume:1.0];
}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// Name: returnFromMusicPicker:
////
//// Description: toggles alarm after returning
////
//// Input: Segue
////
//// Returns: an IBAction
////
//// To Do:
////  - None
////
//- (IBAction)returnFromMusicPicker:(UIStoryboardSegue *)segue {
//    NSLog(@"Back from music picker");
//}


















// Name: applicationDocumentationDirectory
//
// Description: gets a string path to where App data is stored
//
// Input: None
//
// Returns: String of path to App data
//
// To Do:
//  - None
//
+ (NSString *) applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}













// Name: saveAlarms
//
// Description: saves the alarm to the device
//
// Input: None
//
// Returns: None
//
// To Do:
//  - None
//
- (void)saveAlarms{
    [NSKeyedArchiver archiveRootObject:self.alarms toFile:[[[self class] applicationDocumentsDirectory] stringByAppendingPathComponent:@"App.data"]];
}













// Name: getAlarm
//
// Description: fetches the first eligable alarm to fire from the list of alarms
//              currently unenables an alarm once fetched so it doesn't get fired again until
//              user re-enables it. If no elegible alarm is found then returns nil
//
// Input: None
//
// Returns: an Alarm
//
// To Do:
//  - Make it so that when an alarm that repeats on a day rings
//      but it does continue to "ring" but isn't unenabled either
//
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













// Name: soundAlarm:
//
// Description: alerts user of an alarm that goes off
//
// Input: Alarm
//
// Returns: None
//
// To Do:
//  - Display alarm's message
//
- (void)soundAlarm: (Alarm *)alarm {
    self.toggleAlarm = YES;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[@"It's " stringByAppendingString: alarm.setTime] message:alarm.alarmMessage delegate:self cancelButtonTitle:@"Play Game!" otherButtonTitles:nil];
    [alert show];
}













// Name: alertView: clickedButtonAtIndex:
//
// Description: handles result from alarm alert
//
// Input: alertView, NSInteger for index of button response
//
// Returns: None
//
// To Do:
//  - Setup game to start after
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        // Set gametype
        self.gameType = [[NSString alloc] init];
        
        // set number of gametypes available
        int numberOfGameTypes = 2;
        
        // Sees if user picked media for games
        if(self.pickedSongs == nil){
            numberOfGameTypes--;
        }
        
        //gets number for game decision
        int choice = arc4random() % numberOfGameTypes;
        //int choice = 0;
        //int choice = 1;
        
        if (choice == 0){
            self.gameType = @"RPS";
//            GameRPSViewController *rpsGame =[self.storyboard instantiateViewControllerWithIdentifier:@"GameRPSViewController"];
            [self performSegueWithIdentifier:@"MainToRPS" sender:self];

        } else if (choice == 1){
            self.gameType = @"MusicMatch";
            int songIndex = arc4random() % self.pickedSongs.count;
            MPMediaItem *aSong = (MPMediaItem *)[self.pickedSongs.items objectAtIndex: songIndex];
            self.songURL = [aSong valueForProperty: MPMediaItemPropertyAssetURL];
//            GameMusicMatchViewController *mmGame = [self.storyboard instantiateViewControllerWithIdentifier:@"GameMusicMatchViewController"];
            [self performSegueWithIdentifier:@"MainToMusicMatch" sender:self];
        }
    }
}












// Name: prepareForSegue: sender:
//
// Description: Sets needed info for game VC
//
// Input: segue, sender
//
// Returns: None
//
// To Do:
//  - None
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([self.gameType isEqualToString:@"RPS"]){
        // ***** Temp sending alarm instead of music *****
        // FINISH -> [segue.destinationViewController ];
    }
    if ([self.gameType isEqualToString:@"MusicMatch"]){
        // ***** Temp sending alarm instead of music *****
        [segue.destinationViewController setMusicFilePath:self.songURL];
        [self.alarmSpeaker setVolume:0.01];
    }
    self.gameType = @"";
}












// Name: timePassed
//
// Description: updates date/time
//              sends alarm recieved from getAlarm to be sounded
//
// Input: NSTimer
//
// Returns: None
//
// To Do:
//  - None
//
- (void)timePassed:(NSTimer *)timer {
    self.currentDate = [NSDate date];
    [self.formatter setDateFormat:@"ccc"];
    self.dayOfWeek = [self.formatter stringFromDate:self.currentDate];
    [self.formatter setDateFormat:@"h:mm a"];
    self.timeDisplayLabel.text = [self.formatter stringFromDate:self.currentDate];
    [self.formatter setDateFormat:@"cccc - LLL d"];
    self.dateDisplayLabel.text = [self.formatter stringFromDate:self.currentDate];
    Alarm *alarm = [self getAlarm];
    if(self.toggleAlarm){
        self.toggleAlarm = NO;
        [self doAlarmToggle];
    }
    if (alarm != nil){
        [self soundAlarm:alarm];
    }
    if(self.alarmSpeaker.currentTime >= 25){
        self.alarmSpeaker.currentTime = 0;
    }
}















// Name: doAlarmToggle
//
// Description: toggle the alarm to start/stop
//
// Input: None
//
// Returns: None
//
// To Do:
//  - None
//
- (void)doAlarmToggle{
    if (self.alarmPlaying){
        NSLog(@"Alarm stopped.");
        // ***** Stop Playing Alarm *****
        [self.alarmSpeaker stop];
        self.alarmSpeaker.currentTime = 0;
    } else {
        NSLog(@"Alarm started...");
        // ***** Start Alarm Playing *****
        [self.alarmSpeaker play];
    }
    self.alarmPlaying = !self.alarmPlaying;
}












// Name: tableView: numberOfRowsInSection
//
// Description: returns the number of rows that should be in the tableview (ie. the number of alarms made)
//
// Input: tableView, section on table
//
// Returns: NSInter of number of alarms
//
// To Do:
//  - None
//
- (NSInteger) tableView:(UITableView *)alarmView numberOfRowsInSection:(NSInteger)section {
    return [self.alarms count];
}













// Name: tableView: cellForRowAtIndexPath:
//
// Description: creates a Row for an alarm
//
// Input: tableView, IndexPath
//
// Returns: TableCell
//
// To Do:
//  - None
//
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
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //[cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    
    return cell;
}













// Name: tableView: didSelectedRowAtIndexPath:
//
// Description: handles when a row is selected in the tableView
//
// Input: tableView, IndexPath
//
// Returns: None
//
// To Do:
//  - None
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Alarm *selectedAlarm = [self.alarms objectAtIndex:indexPath.row];

    if (selectedAlarm.alarmEnabled) {
        [self.alarmView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        //cell.imageView.image = currentItem.photo;
    } else {
        [self.alarmView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        //cell.imageView.image = nil;
    }
    
    [[self.alarms objectAtIndex:indexPath.row] setAlarmEnabled:!selectedAlarm.alarmEnabled];
    
    [self.alarmView deselectRowAtIndexPath:indexPath animated:YES];
    [self.alarmView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveAlarms];
}













// Name: tableView: canEditRowAtIndexPath:
//
// Description: returns rather a row can be edited or not
//
// Input: tableView, IndexPath
//
// Returns: Bool (YES)
//
// To Do:
//  - Possibly logic to makes certain rows undeletable
//
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}













// Name: tableView: editingStyleForRowAtIndexPath:
//
// Description: returns the type of editing that a cell can get
//
// Input: tableView, IndexPath
//
// Returns: editing style for row
//
// To Do:
//  - None
//
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}













// Name: tableView: commitEditingStyle: forRowAtIndexPath
//
// Description: handles what is done once editing has been submitted for a row
//
// Input: tableView, editingStyle, Indexpath
//
// Returns: None
//
// To Do:
//  - None
//
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.alarms removeObjectAtIndex: indexPath.row];
    [self.alarmView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveAlarms];
}



@end

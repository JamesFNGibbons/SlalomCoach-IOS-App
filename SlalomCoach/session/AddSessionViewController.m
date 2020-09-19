//
//  AddSessionViewController.m
//  SlalomCoach
//
//  Created by James Gibbons on 17/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "AddSessionViewController.h"

@interface AddSessionViewController ()

@end

@implementation AddSessionViewController

NSMutableArray *athletes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // init athletes array.
    athletes = [[NSMutableArray alloc] init];
        
    self.athleteTable.dataSource = self;
    self.athleteTable.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return athletes.count;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *deleteAthleteAction = [[UIContextualAction alloc] init];
    [deleteAthleteAction setBackgroundColor:[UIColor redColor]];
    [deleteAthleteAction setTitle:@"Delete"];
    
    UISwipeActionsConfiguration *swipeActionConfig = [UISwipeActionsConfiguration configurationWithActions:@[
        deleteAthleteAction
    ]];
    return swipeActionConfig;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *athleteCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if(athleteCell) {
        athleteCell.textLabel.text = @"Bob";
        
        return athleteCell;
    }
    else {
        NSLog(@"Could not load athlete view table cell with id.");
    }
    
    // default
    return [[UITableViewCell alloc] init];
}


- (void) deleteAthlete {
    NSLog(@"Delete athlete event called.");
}


- (IBAction)addAthleteButtonTapEvent:(id)sender {
    NSLog(@"Adding athlete");
    
    [athletes addObject:@"Name"];
    for(NSObject *obj in athletes) {
        NSLog(obj);
    }
    
    [self.athleteTable reloadData];
}


- (IBAction)saveSessionButtonTapEvent:(id)sender {
    NSString *sessionName = [self.sessionName text];
    
    if(sessionName != nil && ![sessionName isEqual:@""]) {
        NSDictionary *newSession = @{
            @"sessionName": sessionName,
            @"sessionAthletes": athletes,
            @"sessionTime": [self.sessionTime date]
        };
        
        // save the new session to the users device.
        NSMutableArray *savedSessions = [[NSUserDefaults standardUserDefaults] objectForKey:@"sessions"];
        if(savedSessions) {
            [savedSessions addObject:newSession];
        }
        else {
            savedSessions = [[NSMutableArray alloc] init];
            [savedSessions addObject:newSession];
        }
        
        // update saved sessions object in store
        [[NSUserDefaults standardUserDefaults] setObject:savedSessions forKey:@"sessions"];
        
        // close UI
        [self dismissViewControllerAnimated:true completion:nil];
        
    }
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please ensure you have filled out the form, and added at least 1 athlete to the session." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *closeAlertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:true completion:nil];
        }];
        [alert addAction:closeAlertAction];
        [self presentViewController:alert animated:true completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

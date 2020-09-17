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

NSArray *athletes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.athleteTable.dataSource = self;
    self.athleteTable.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return athletes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *athleteCell = [self.athleteTable dequeueReusableCellWithIdentifier:@"athleteCell"];
    if(athleteCell) {
        return athleteCell;
    }
    else {
        NSLog(@"Could not load athlete view table cell with id.");
    }
    
    // default
    return [[UITableViewCell alloc] init];
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

//
//  HomeViewController.m
//  SlalomCoach
//
//  Created by James Gibbons on 16/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

NSMutableArray *sessions;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated {
    [self initSavedSessions];
    
    self.sessionsCollectionView.dataSource = self;
    self.sessionsCollectionView.delegate = self;
}


- (void)viewWillAppear:(BOOL)animated {
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"sessions"]) {
        sessions = [[NSUserDefaults standardUserDefaults] objectForKey:@"sessions"];
    }
    else {
        sessions = [[NSMutableArray alloc] init];
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return sessions.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SessionCollectionViewCell *cell = [self.sessionsCollectionView dequeueReusableCellWithReuseIdentifier:@"sessionCell" forIndexPath:indexPath];
        
    // load session data to the session cell
    NSDictionary *sessionData = [sessions objectAtIndex:0];
    cell.sessionName.text = [sessionData objectForKey:@"sessionName"];
    
    return cell;
}


- (void) initSavedSessions {
    if(![[NSUserDefaults standardUserDefaults] objectForKey:@"sessions"]) {
        // no saved sessions
        UIAlertController *welcomeAlert = [UIAlertController alertControllerWithTitle:@"Welcome!" message:@"It looks like this isx your first time here, to get started you need to create your first session." preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *addSessionAction = [UIAlertAction actionWithTitle:@"Create First Session" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIViewController *addSessionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"addSessionView"];
            
            [self presentViewController:addSessionViewController animated:true completion: nil];
        }];

        [welcomeAlert addAction:addSessionAction];
        [self presentViewController:welcomeAlert animated:true completion:nil];
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

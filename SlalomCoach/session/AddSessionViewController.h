//
//  AddSessionViewController.h
//  SlalomCoach
//
//  Created by James Gibbons on 17/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddSessionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *athleteTable;

@end

NS_ASSUME_NONNULL_END

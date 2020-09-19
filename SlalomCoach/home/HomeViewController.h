//
//  HomeViewController.h
//  SlalomCoach
//
//  Created by James Gibbons on 16/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "components/SessionCollectionViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *sessionsCollectionView;

@end

NS_ASSUME_NONNULL_END

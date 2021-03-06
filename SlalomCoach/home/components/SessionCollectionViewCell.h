//
//  SessionCollectionViewCell.h
//  SlalomCoach
//
//  Created by James Gibbons on 19/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SessionCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sessionName;


@end

NS_ASSUME_NONNULL_END

//
//  YoubikeTableViewCell.h
//  Youbike
//
//  Created by Eph on 2016/7/7.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoubikeModel.h"
#import "YoubikeTableViewController.h"

@interface YoubikeTableViewCell : UITableViewCell

@property (strong, nonatomic) YoubikeModel *youbikeModel;
@property (nonatomic, weak) id <ViewMapDelegate> delegate;

- (void)setup;

@end

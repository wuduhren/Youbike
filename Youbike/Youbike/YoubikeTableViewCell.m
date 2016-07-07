//
//  YoubikeTableViewCell.m
//  Youbike
//
//  Created by Eph on 2016/7/7.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import "YoubikeTableViewCell.h"
#import "YoubikeModel.h"

@interface YoubikeTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *remainingBikesLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end




@implementation YoubikeTableViewCell

- (void)setup {
    self.nameLabel.text = self.youbikeModel.name;
    self.addressLabel.text = self.youbikeModel.address;
    self.remainingBikesLabel.text = [NSString stringWithFormat: @"%@", self.youbikeModel.remainingBikes];
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

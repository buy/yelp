//
//  SwitchCell.m
//  Yelp
//
//  Created by Chang Liu on 11/1/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "SwitchCell.h"

@implementation SwitchCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setOn:(BOOL)on {
    self.on = on;
    self.filterSwitch.on = on;
}

- (IBAction)switchValueChanged:(id)sender {
    [self.delegate switchCell:self didUpdateValue:self.filterSwitch.on];
}
@end

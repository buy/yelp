//
//  SortByCell.m
//  Yelp
//
//  Created by Chang Liu on 11/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "SortByCell.h"

@implementation SortByCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)cellValueChanged:(id)sender {
    [self.delegate sortByCell:self didUpdateSegment:self.sortBySegment.selectedSegmentIndex];
}
@end

//
//  BusinessCell.m
//  Yelp
//
//  Created by Chang Liu on 10/31/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BusinessCell.h"
#import "YelpBusiness.h"
#import "UIImageView+AFNetworking.h"

@implementation BusinessCell

- (void)awakeFromNib {
    // Initialization code
    self.nameLabel.preferredMaxLayoutWidth = self.nameLabel.frame.size.width;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBusiness:(YelpBusiness *)business {
    _business = business;

    [self.thumbnailImage setImageWithURL:self.business.imageUrl];
    self.nameLabel.text = self.business.name;
    self.distanceLabel.text = [NSString stringWithFormat:@"%@", self.business.distance];
    [self.ratingImage setImageWithURL:self.business.ratingImageUrl];
    self.reviewLabel.text = [NSString stringWithFormat:@"%@ Reviews", self.business.reviewCount];
    self.addressLabel.text = self.business.address;
    self.categoriesLabel.text = self.business.categories;
    self.dealLabel.hidden = !self.business.deals;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.nameLabel.preferredMaxLayoutWidth = self.nameLabel.frame.size.width;
}

@end

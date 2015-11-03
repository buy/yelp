//
//  DistanceCell.h
//  Yelp
//
//  Created by Chang Liu on 11/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DistanceCell;

@protocol DistanceCellDelegate <NSObject>

- (void)distanceCell:(DistanceCell *)cell didUpdateSegment:(NSInteger)segment;

@end

@interface DistanceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceSegment;
@property (weak, nonatomic) id<DistanceCellDelegate> delegate;

- (IBAction)cellValueChanged:(id)sender;

@end

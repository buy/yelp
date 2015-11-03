//
//  SortByCell.h
//  Yelp
//
//  Created by Chang Liu on 11/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SortByCell;

@protocol SortByCellDelegate <NSObject>

- (void)sortByCell:(SortByCell *)cell didUpdateSegment:(NSInteger)segment;

@end

@interface SortByCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *sortBySegment;
@property (weak, nonatomic) id<SortByCellDelegate> delegate;

- (IBAction)cellValueChanged:(id)sender;

@end

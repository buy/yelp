//
//  SwitchCell.h
//  Yelp
//
//  Created by Chang Liu on 11/1/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchCell;

@protocol SwitchCellDelegate <NSObject>

- (void)switchCell:(SwitchCell *)cell didUpdateValue:(BOOL)value;

@end

@interface SwitchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *filterLabel;
@property (weak, nonatomic) IBOutlet UISwitch *filterSwitch;
- (IBAction)switchValueChanged:(id)sender;

@property (nonatomic, assign) BOOL on;
@property (weak, nonatomic) id<SwitchCellDelegate> delegate;

@end

//
//  BusinessSearchSettings.h
//  Yelp
//
//  Created by Chang Liu on 11/1/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YelpBusiness.h"

@interface BusinessSearchSettings : NSObject

@property (nonatomic, strong) NSString *term;
@property YelpSortMode sortMode;
@property (nonatomic, strong) NSMutableArray *categories;
@property BOOL hasDeal;
@property NSInteger radius;

@end

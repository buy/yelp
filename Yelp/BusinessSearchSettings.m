//
//  BusinessSearchSettings.m
//  Yelp
//
//  Created by Chang Liu on 11/1/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BusinessSearchSettings.h"

@implementation BusinessSearchSettings

- (id)init {
    if (self = [super init])  {
        self.term = @"Restaurants";
        self.sortMode = YelpSortModeBestMatched;
        self.categories = [NSMutableArray array];
        self.hasDeal = NO;
        self.radius = 0;
    }

    return self;
}

@end

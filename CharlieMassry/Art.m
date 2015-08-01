//
//  Art.m
//  CharlieMassry
//
//  Created by Charlie Massry on 7/29/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "Art.h"

NSString *const baseURL = @"http://www.charliemassry.com";

@implementation Art
-(instancetype)initForIndex:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.caption = json[@"caption"];
        self.name = json[@"name"];
        self.idNo = json[@"id"];
        self.imageURL = [baseURL stringByAppendingString:json[@"non_svg_image_url"]];
    }
    
    return self;
}
@end

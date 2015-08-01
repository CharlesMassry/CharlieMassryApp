//
//  Link.m
//  CharlieMassry
//
//  Created by Charlie Massry on 7/31/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "Link.h"
#import "APIClient.h"

@implementation Link
-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.name = dictionary[@"name"];
        self.tooltip = dictionary[@"tooltip"];
        self.linkURL = dictionary[@"url"];
        self.imageURL = [[APIClient baseURL] stringByAppendingString:dictionary[@"image_url"]];
    }
    
    return self;
}
@end

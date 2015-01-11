//
//  Post.m
//  CharlieMassry
//
//  Created by Charlie Massry on 12/30/14.
//  Copyright (c) 2014 Charlie Massry. All rights reserved.
//

#import "Post.h"
#import "AFNetworking.h"

@implementation Post
-(id)init
{
    self = [super init];
    return self;
}

-(id)initWithDictionary:(NSDictionary *)aJSON
{
    self = [super init];
    self.heading = aJSON[@"title"];
    self.text = aJSON[@"text"];
    return self;
}
@end

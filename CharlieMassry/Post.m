//
//  Post.m
//  CharlieMassry
//
//  Created by Charlie Massry on 12/30/14.
//  Copyright (c) 2014 Charlie Massry. All rights reserved.
//

#import "Post.h"
#import "AFNetworking.h"
#import "Comment.h"

@implementation Post
-(id)init
{
    self = [super init];
    return self;
}

-(instancetype)initForIndex:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.title = json[@"title"];
        self.text = json[@"text"];
        self.idNo = json[@"id"];
    }
    return self;
}

-(instancetype)initForShow:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.title = json[@"title"];
        self.text = json[@"text"];
        self.idNo = json[@"id"];
        self.comments = [self createComments:json[@"comments"]];
    }
    return self;
}

-(NSArray *)createComments:(NSArray *)comments {
    NSMutableArray *tmpComments = [[NSMutableArray alloc] init];
    
    for (NSDictionary *tmpComment in comments) {
        Comment *comment = [[Comment alloc] init];
        comment.idNo = tmpComment[@"id"];
        comment.commenter = tmpComment[@"commenter"];
        comment.body = tmpComment[@"body"];
        
        [tmpComments addObject:comment];
    }
    
    return tmpComments;
}

-(NSString *)description {
    return [[[self.idNo stringValue] stringByAppendingString:@": " ] stringByAppendingString:self.title];
}
@end

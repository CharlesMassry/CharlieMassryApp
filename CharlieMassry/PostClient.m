//
//  PostClient.m
//  CharlieMassry
//
//  Created by Charlie Massry on 1/18/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "PostClient.h"
#import "AFNetworking.h"
#import "Post.h"

#define PostURL @"http://www.charliemassry.com/posts";

@implementation PostClient
-(id)init
{
    self = [super init];
   
    
 return self;
 }

+(void)getPostIndex
{
    NSString *postURL = PostURL;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[postURL stringByAppendingString:@".json"] parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        NSMutableArray *tmpPosts = [[NSMutableArray alloc] init];
        for (NSDictionary *tmpDictionary in JSON) {
            
            Post *tmpPost = [[Post alloc] initWithDictionary:tmpDictionary];
            [tmpPosts addObject:tmpPost];
        }
        NSArray *posts = [[NSArray alloc] initWithArray:tmpPosts];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"initWithJSONFinishedLoading"
         object:posts];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end

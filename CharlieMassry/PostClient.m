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

NSString *const postURL = @"http://www.charliemassry.com/posts";

@implementation PostClient
+(void)getPostIndex {
    NSString *postIndexURL = [postURL stringByAppendingString:@".json"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:postIndexURL parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        NSMutableArray *tmpPosts = [[NSMutableArray alloc] init];
        for (NSDictionary *tmpDictionary in JSON) {
            
            Post *tmpPost = [[Post alloc] initForIndex:tmpDictionary];
            [tmpPosts addObject:tmpPost];
        }
        NSArray *posts = [[NSArray alloc] initWithArray:tmpPosts];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"initWithPostIndexJSONFinishedLoading"
         object:posts];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

+(void)getPostShow:(NSNumber *)idNo {
    NSString *postShowURL = [[[postURL stringByAppendingString:@"/"]
                                       stringByAppendingString:[idNo stringValue]]
                                       stringByAppendingString:@".json"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:postShowURL parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        Post *post = [[Post alloc] initForShow:JSON];
        
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"initWithPostShowJSONFinishedLoading"
                       object:post];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end

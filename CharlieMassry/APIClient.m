//
//  APIClient.m
//  CharlieMassry
//
//  Created by Charlie Massry on 1/18/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "APIClient.h"
#import "AFNetworking.h"
#import "Post.h"
#import "Art.h"
#import "Link.h"

NSString *const artURL = @"http://www.charliemassry.com/arts";
NSString *const postURL = @"http://www.charliemassry.com/posts";
NSString *const linkURL = @"http://www.charliemassry.com/links";

@implementation APIClient
+(NSString *)baseURL {
    return @"http://www.charliemassry.com";
}

+(void)getPostIndexWithCompletionBlock:(APIClientPostsCompletionBlock)completionBlock {
    NSString *postIndexURL = [postURL stringByAppendingString:@".json"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:postIndexURL parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        NSMutableArray *tmpPosts = [[NSMutableArray alloc] init];
        for (NSDictionary *tmpDictionary in JSON) {
            
            Post *tmpPost = [[Post alloc] initForIndex:tmpDictionary];
            [tmpPosts addObject:tmpPost];
        }
        NSArray *posts = [[NSArray alloc] initWithArray:tmpPosts];
        if (completionBlock) {
            completionBlock(posts, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completionBlock) {
            completionBlock(nil, error);
        }
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

+(void)getArtIndexWithCompletionBlock:(APIClientArtsCompletionBlock)completionBlock {
    NSString *artIndexURL = [artURL stringByAppendingString:@".json"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:artIndexURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *tmpArts = [[NSMutableArray alloc] init];
        for (NSDictionary *tmpDictionary in responseObject) {
            Art *tmpArt = [[Art alloc] initForIndex:tmpDictionary];
            [tmpArts addObject:tmpArt];
        }
        NSArray *arts = [[NSArray alloc] initWithArray:tmpArts];
        if (completionBlock) {
            completionBlock(arts, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completionBlock) {
            completionBlock(nil, error);
        }
    }];
}

+(void)getLinksIndexWithCompletionBlock:(APIClientLinksCompletionBlock)completionBlock {
    NSString *linksIndexURL = [linkURL stringByAppendingString:@".json"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:linksIndexURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *tmpLinks = [[NSMutableArray alloc] init];
        for (NSDictionary *linkDictionary in responseObject) {
            Link *tmpLink = [[Link alloc] initWithDictionary:linkDictionary];
            [tmpLinks addObject:tmpLink];
        }
        
        NSArray *links = [[NSArray alloc] initWithArray:tmpLinks];
        if (completionBlock) {
            completionBlock(links, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completionBlock) {
            completionBlock(nil, error);
        }
    }];
}

@end

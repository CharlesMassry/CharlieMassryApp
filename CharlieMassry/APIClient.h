//
//  APIClient.h
//  CharlieMassry
//
//  Created by Charlie Massry on 1/18/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^APIClientPostsCompletionBlock)(NSArray *posts, NSError *error);
typedef void(^APIClientArtsCompletionBlock)(NSArray *arts, NSError *error);
typedef void(^APIClientLinksCompletionBlock)(NSArray *links, NSError *error);

@interface APIClient : NSObject
+(void)getPostIndexWithCompletionBlock:(APIClientPostsCompletionBlock)completionBlock;
+(void)getPostShow:(NSNumber *)idNo;
+(void)getArtIndexWithCompletionBlock:(APIClientArtsCompletionBlock)completionBlock;
+(void)getLinksIndexWithCompletionBlock:(APIClientLinksCompletionBlock)completionBlock;
+(NSString *)baseURL;
@end

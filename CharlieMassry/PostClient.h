//
//  PostClient.h
//  CharlieMassry
//
//  Created by Charlie Massry on 1/18/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostClient : NSObject
@property (strong, nonatomic) NSArray *posts;
+(void)getPostIndex;
@end
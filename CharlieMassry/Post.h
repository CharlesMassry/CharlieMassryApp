//
//  Post.h
//  CharlieMassry
//
//  Created by Charlie Massry on 12/30/14.
//  Copyright (c) 2014 Charlie Massry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject
@property(strong, nonatomic)NSString *heading;
@property(strong, nonatomic)NSString *text;
@property(strong, nonatomic)NSNumber *idNo;
@property(strong, nonatomic)NSArray *comments;
-(id)initWithDictionary:(NSDictionary *)aJSON;
@end

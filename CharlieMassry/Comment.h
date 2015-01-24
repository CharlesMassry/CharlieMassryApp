//
//  Comment.h
//  CharlieMassry
//
//  Created by Charlie Massry on 1/23/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject
@property(strong, nonatomic)NSNumber *idNo;
@property(strong, nonatomic)NSString *commenter;
@property(strong, nonatomic)NSString *body;
@end

//
//  Link.h
//  CharlieMassry
//
//  Created by Charlie Massry on 7/31/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Link : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *tooltip;
@property (strong, nonatomic) NSString *linkURL;
@property (strong, nonatomic) NSString *imageURL;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

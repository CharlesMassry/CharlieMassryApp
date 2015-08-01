//
//  Art.h
//  CharlieMassry
//
//  Created by Charlie Massry on 7/29/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Art : NSObject
@property(strong, nonatomic)NSString *caption;
@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSNumber *idNo;
@property(strong, nonatomic)NSString *imageURL;
-(instancetype)initForIndex:(NSDictionary *)json;
@end

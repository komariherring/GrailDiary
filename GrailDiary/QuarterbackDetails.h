//
//  QuarterbackDetails.h
//  GrailDiary
//
//  Created by Komari Herring on 8/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuarterbackDetails : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *team;
@property (nonatomic) NSInteger age;

+ (QuarterbackDetails *)quarterbackDetailsWithDictionary:(NSDictionary *)quarterbackDetailsDict;
@end

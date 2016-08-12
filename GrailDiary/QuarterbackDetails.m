//
//  QuarterbackDetails.m
//  GrailDiary
//
//  Created by Komari Herring on 8/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "QuarterbackDetails.h"

@implementation QuarterbackDetails

+ (QuarterbackDetails *)quarterbackDetailsWithDictionary:(NSDictionary *)quarterbackDetailsDict
{
    QuarterbackDetails *aDetail = nil;
    if (quarterbackDetailsDict)
    {
        aDetail = [[QuarterbackDetails alloc] init];
        aDetail.name = [quarterbackDetailsDict objectForKey:@"name"];
        aDetail.age = [quarterbackDetailsDict [@"age"]longValue];
        aDetail.team = [quarterbackDetailsDict objectForKey:@"team"];
    }
    
    
    return aDetail;
}

@end

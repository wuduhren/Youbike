//
//  NSObject+YoubikeModel.m
//  Youbike
//
//  Created by Eph on 2016/7/5.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import "YoubikeModel.h"


@interface YoubikeModel ()

@property (strong, nonatomic) NSString *identifier;
@property (nonatomic) CLLocationCoordinate2D *coordinate;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *remainingBikes;


@end



@implementation YoubikeModel

-(id) init: (NSString *)identifier
coordinate: (CLLocationCoordinate2D *)coordinate
name: (NSString *)name
address: (NSString *)address
remainingBikes: (NSNumber *)remainingBikes {
    
    self = [super init];
    
    if (self) {
        
        self.identifier = identifier;
        self.coordinate = coordinate;
        self.name = name;
        self.address = address;
        self.remainingBikes = remainingBikes;
        
    }
    
    return self;
}


@end

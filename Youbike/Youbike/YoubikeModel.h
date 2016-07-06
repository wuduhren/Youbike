//
//  NSObject+YoubikeModel.h
//  Youbike
//
//  Created by Eph on 2016/7/5.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface YoubikeModel: NSObject

-(id) init: (NSString *)identifier
coordinate: (CLLocationCoordinate2D *)coordinate
      name: (NSString *)name
   address: (NSString *)address
numberOfRemainingBikes: (NSNumber *)numberOfRemainingBikes;


@end

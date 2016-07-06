//
//  YoubikeManager.h
//  Youbike
//
//  Created by Eph on 2016/7/5.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoubikeManager : NSObject

+ (id)sharedManager;

- (NSMutableArray *)ParseJson;

@end

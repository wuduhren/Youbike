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

typedef void (^ SuccessBlock)(NSMutableArray *youbikeModelArray);
typedef void (^ FailureBlock)();
- (void)GetYoubikesData:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end

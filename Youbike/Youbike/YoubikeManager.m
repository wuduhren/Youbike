//
//  YoubikeManager.m
//  Youbike
//
//  Created by Eph on 2016/7/5.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import "YoubikeManager.h"
#import "YoubikeTableViewController.h"
#import "YoubikeModel.h"
#import <CoreLocation/CoreLocation.h>
#import "AFNetworking.h"

typedef void (^ SuccessBlock)(NSMutableArray *youbikeModelArray);
typedef void (^ FailureBlock)();

@interface YoubikeManager()


@property (strong, nonatomic) NSMutableArray *youbikeModelArray;

@end


@implementation YoubikeManager

+ (id)sharedManager {
    
    static YoubikeManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}




- (void)GetYoubikesData:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    self.youbikeModelArray = [[NSMutableArray alloc] init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET: @"http://data.taipei/youbike" parameters: nil progress: nil success: ^(NSURLSessionTask *task, id responseObject) {
        
        [self ParseJson: responseObject];
        successBlock(self.youbikeModelArray);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}



- (void)ParseJson: (id)responseObject {
    
// local JSON File
//    NSString *path = [[NSBundle mainBundle] pathForResource: @"youbike" ofType: @"json"];
//    NSString *jsonString = [[NSString alloc]
//                            initWithContentsOfFile: path
//                            encoding:NSUTF8StringEncoding
//                            error: nil];
//    NSData* jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *jsonData = (NSData *) responseObject;
    NSError *error = nil;
    
    id json = [NSJSONSerialization
                 JSONObjectWithData: jsonData
                 options: 0
                 error: &error];
    
    
    if([json isKindOfClass:[NSDictionary class]]){
        
        NSDictionary *retVal = [json objectForKey: @"retVal"];
        
        for (NSString *youbikeID in [retVal allKeys]) {
            NSDictionary *youbike = [retVal objectForKey: youbikeID];
            //NSLog(@"youbike: %@", youbike);
            
            NSString *identifier = [youbike objectForKey: @"sno"];
            //NSLog(@"identifier: %@", identifier);
            
            NSString *name = [youbike objectForKey: @"sna"];
            //NSLog(@"name: %@", name);
            
            NSString *address = [youbike objectForKey: @"ar"];
            //NSLog(@"address: %@", address);
            
            if ([youbike[@"sbi"] isKindOfClass: [NSNumber class]]) {
                NSLog(@"remainingBikes is not a NSNumber");
                return;
            }
            NSNumber *remainingBikes = [youbike objectForKey: @"sbi"];
            //NSLog(@"remainingBikes: %@", remainingBikes);
            
            if ([youbike[@"lng"] isKindOfClass: [NSNumber class]]) {
                NSLog(@"longitude is not a NSNumber");
                return;
            }
            NSNumber *lng = [youbike objectForKey: @"lng"];
            double longitude = [lng doubleValue];
            //NSLog(@"longitude: %f", longitude);

            if ([youbike[@"lat"] isKindOfClass: [NSNumber class]]) {
                NSLog(@"latitude is not a NSNumber");
                return;
            }
            NSNumber *lat = [youbike objectForKey: @"lat"];
            double latitude = [lat doubleValue];
            //NSLog(@"latitude: %f", latitude);

            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            
            YoubikeModel *youbikeModel = [[YoubikeModel alloc] init:identifier coordinate: &coordinate name: name address: address remainingBikes: remainingBikes];
            [self.youbikeModelArray addObject: youbikeModel];
        }
    }
    
    
}


@end

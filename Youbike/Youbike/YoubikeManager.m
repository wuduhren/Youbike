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




- (NSMutableArray *)ParseJson {
    
    self.youbikeModelArray = [[NSMutableArray alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource: @"youbike" ofType: @"json"];
    NSString *jsonString = [[NSString alloc]
                            initWithContentsOfFile: path
                            encoding:NSUTF8StringEncoding
                            error: nil];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
    id json = [NSJSONSerialization
                 JSONObjectWithData: jsonData
                 options: 0
                 error: &error];
    
    
    if([json isKindOfClass:[NSDictionary class]]){
        
        NSDictionary *result = [json objectForKey: @"result"];
        NSArray *results = [result objectForKey: @"results"];
        
        for (NSDictionary *youbikeData in results) {
            
            NSString *identifier = [youbikeData objectForKey: @"_id"];
            NSString *name = [youbikeData objectForKey: @"sna"];
            
            NSString *address = [youbikeData objectForKey: @"ar"];
            NSNumber *remainingBikes = [youbikeData objectForKey: @"sbi"];
            
            NSNumber *lng = [youbikeData objectForKey: @"lng"];
            NSNumber *lat = [youbikeData objectForKey: @"lat"];
            double longitude = [lng doubleValue];
            double latitude = [lat doubleValue];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            
            YoubikeModel *youbikeModel = [[YoubikeModel alloc] init:identifier coordinate: &coordinate name: name address: address remainingBikes: remainingBikes];
            [self.youbikeModelArray addObject: youbikeModel];
        }
    }
    
    return self.youbikeModelArray;
}









@end

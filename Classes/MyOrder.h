//
//  Order.h
//  TeddyAPP
//
//  Created by Ctrip on 14-4-17.
//  Copyright (c) 2014年 T&C. All rights reserved.
//

#import <STDbKit/STDbObject.h>

@interface MyOrder : STDbObject

@property (assign, nonatomic) int _id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSData *image;        /** 头像 */
@property (strong, nonatomic) NSDate *lastmodifytime;
@property (strong, nonatomic) NSDictionary *info;

@end

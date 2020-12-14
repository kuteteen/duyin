//
//  SocketManager.h
//  AngelClient
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 lby. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SocketManager : NSObject
+(instancetype)sharedQueue;
@property (nonatomic, copy)void (^msgBLock)(id);
@property (nonatomic, copy)void (^deviceBlock)(id);

@property (nonatomic, copy) NSString * deviectype;
@property (nonatomic, copy) NSString * openudid;
@property (nonatomic, assign) BOOL connected;
@property (nonatomic, assign) BOOL isfirstLoad;
@property (nonatomic, assign) NSInteger lastTime;
- (void)connectAction;
- (void)sendMessageAction:(id)sender;
- (void)longConnectToSocket;
- (void)saveTimeDataTopPlist;


@end

NS_ASSUME_NONNULL_END

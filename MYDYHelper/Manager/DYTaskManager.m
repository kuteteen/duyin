//
//  DYTaskManager.m
//  MYDYHelper
//
//  Created by apple on 2020/7/3.
//

#import "DYTaskManager.h"

@implementation DYTaskManager
+(instancetype)sharedQueue
{
    static DYTaskManager * queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[DYTaskManager alloc] init];
    });
    return queue;
}

-(BOOL)hasLogined{
//    [reu isKindOfClass:%c(HTSLiveScreenChatMessage)]
//   BOOL r =  [[AWELanguageSelectionPopupManager sharedInstance] userLogined];
//    NSLog(@"hasLoginedhasLoginedhasLogined r %d",r);
    return NO;
}

@end

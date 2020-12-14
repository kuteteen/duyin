//
//  DYFeedManager.m
//  MYDYHelper
//
//  Created by apple on 2020/6/22.
//

#import "DYFeedManager.h"
#import "DYCommonApi.h"
#import "NSTimer+FY.h"
#import <PTFakeTouch/PTFakeTouch.h>

@implementation DYFeedManager
+(instancetype)sharedQueue
{
    
    static DYFeedManager * queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[DYFeedManager alloc] init];
    });
    return queue;
}

-(void)setFinishTime:(NSInteger)finishTime{
    _finishTime = finishTime;

    [self  performSelector:@selector(feedTaskDidFinsh) withObject:nil afterDelay:finishTime];
}

- (NSTimer *)timer {
    if (_timer == nil) {
        __weak typeof(self) weakSelf = self;
        int arcradom =  10 + (arc4random() % 5);
        _timer = [NSTimer fy_timerWithTimeInterval:arcradom actionBlock:^(NSTimer *timer) {
            [weakSelf p_timerAction];
        } runLoopMode:NSRunLoopCommonModes repeats:YES];
    }
    return _timer;
}


- (void)p_timerAction {
    self.times ++;
    
    int arcradom =(arc4random() % 20);
    int locationX =100 +  arcradom;
    int locationY =500 +  arcradom;
    NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
    [NSThread sleepForTimeInterval:1];
    
    [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseMoved)];
    [NSThread sleepForTimeInterval:0.3];
    [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseEnded)];
    
    int x = arc4random() % 20;
    if (x % 4 == 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            int locationX =SCREEN_WIDTH - 25;;
            int locationY =SCREEN_HEIGHT *0.5;
            NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
            //      [NSThread sleepForTimeInterval:0.3];
            [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
            //      [NSThread sleepForTimeInterval:0.3];
            [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
            
        });
    }
    
}


- (void)feedTaskStart{
    [self.timer fy_resumeTimer];
}

//点击tabar 的按钮
-(void)tapTheTarWithIndex:(NSInteger)index{
    if (index !=2) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            int eachWidth =SCREEN_WIDTH *0.2;
            int  locationX =  (0.5 + index) *eachWidth;
            int  locationY =  SCREEN_HEIGHT -20;;
            NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
            [NSThread sleepForTimeInterval:0.1];
            [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
            [NSThread sleepForTimeInterval:0.1];
            [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
            
        });
        
    }
}


- (void)feedTaskDidFinsh{
    [DYCommonApi TaskDidFinishWithError:@""];
}

-(void)clickAllOnLineItem{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        int locationX =165;
        int locationY =556;
        
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
        [self performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:3];


    });

}

-(void)clickTheOnlineItmeButton{
    WEAKSELF;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           int locationX =SCREEN_WIDTH *0.49;
           int locationY =291;

           NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
           [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
           [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];


       });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        int locationX =SCREEN_WIDTH *0.49;
        int locationY =291;
        
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
        
        [weakSelf performSelector:@selector(clickAllOnLineItem) withObject:nil afterDelay:2];

    });

}

-(void)arcradomToSetUserAction{
  
    
    if ([DYVcManager sharedQueue].enable) {
        return;
    }
    WEAKSELF;
    
    
    if (![DYVcManager sharedQueue].data) {
        if (self.noDatatimes > 5) {
            [[NSUserDefaults  standardUserDefaults] setObject:@"yes" forKey:@"kUserNeedRefresh"];

            [self feedTaskDidFinsh];
        }else{
            self.noDatatimes ++;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                int eachWidth =SCREEN_WIDTH *0.2;
                int  locationX =  0.5 *eachWidth;
                int  locationY =  SCREEN_HEIGHT -20;;
                NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
                [NSThread sleepForTimeInterval:0.1];
                [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
                [NSThread sleepForTimeInterval:0.1];
                [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
                
            });
            

            [self performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:20];
        }
       return;
    }
    
//    [[DYLiveManager sharedQueue] getOnLineUser];
    UIViewController *vc = [DYCommonApi getCurrentVC];
       //        [[DYTaskManager sharedQueue] hasLogined];

       NSString  *re =   [[DYVcManager sharedQueue].selectVc compareCurrentVc:vc];
       NSLog(@"UIViewControllerUIViewController = %@ class %@  result = %@",vc,[vc class],re);
    if (![re isEqualToString:@"4"]) {
        UINavigationController *nav =(UINavigationController*)[vc navigationController];
        [nav popViewControllerAnimated:YES];
        [nav dismissViewControllerAnimated:YES completion:nil];
        [self  performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:(arc4random() % 5 + 1)];

        
    }else{
        int x = arc4random() % 30;
//        if (x <= 29 && x >27) {
//            [self upSlideAndLikeUserAction];
//        }else if (x <28 && x > 10){
//            if ([DYVcManager sharedQueue].currentIsIds) {
//
//                [self upOnlySlideAction];
//            }else{
//                [self upAndGetUserInfoAction];
//            }
//        }else{
//            [self upOnlySlideAction];
//        }
        
    

         if ([DYVcManager sharedQueue].selectVc.selectedIndex != [DYVcManager sharedQueue].selectVc.titles.count -1) {
             [[DYVcManager sharedQueue].selectVc segmentedControlTapped:([DYVcManager sharedQueue].selectVc.titles.count-1)];

                  [self  performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:(arc4random() % 5 + 1)];

            }else{
                if (x > 14){
                    [self upAndGetUserInfoAction];
                }else{
                    [self upOnlySlideAction];
                }
                

            }
        }



    
}

-(void)upOnlySlideAction{
    int arcradom =  8 + (arc4random() % 5);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arcradom * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *vc = [DYCommonApi getCurrentVC];
        [[DYTaskManager sharedQueue] hasLogined];

         NSLog(@"UIViewControllerUIViewController = %@",vc);


        int arcradom =(arc4random() % 20);
        int locationX =100 +  arcradom;
        int locationY =500 +  arcradom;
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [NSThread sleepForTimeInterval:0.2];
        
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseMoved)];
        [NSThread sleepForTimeInterval:0.2];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseEnded)];
        [self  performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:(arc4random() % 5 + 1)];
        
    });
    
    
    
}


-(void)upAndGetUserInfoAction{
    int arcradom =  8 + (arc4random() % 9);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arcradom * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        

        int arcradom =(arc4random() % 20);
        int locationX =100 +  arcradom;
        int locationY =500 +  arcradom;
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [NSThread sleepForTimeInterval:0.2];
        
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseMoved)];
        [NSThread sleepForTimeInterval:0.2];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseEnded)];
        [self  performSelector:@selector(getMovieUserInfo) withObject:nil afterDelay:(arc4random() % 5 + 1)];
        
    });
    
    
    
}

-(void)getMovieUserInfo{
    int arcradomX =  40 + (arc4random() % 20);
    int arcradomY =  50 + (arc4random() % 30);
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        int locationX =250 +  arcradomX;
        int locationY =200 +  arcradomY;
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [NSThread sleepForTimeInterval:0.2];
        
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX - 260, locationY) withTouchPhase:(UITouchPhaseMoved)];
        [NSThread sleepForTimeInterval:0.2];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX - 260, locationY) withTouchPhase:(UITouchPhaseEnded)];
        
    });
    
    int arcradomTime=  5 + (arc4random() % 6);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arcradomTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        

        int locationX =100 +  arcradomX;
        int locationY =200 +  arcradomY;
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [NSThread sleepForTimeInterval:0.1];
        
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX + 200, locationY) withTouchPhase:(UITouchPhaseMoved)];
        [NSThread sleepForTimeInterval:0.1];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX + 200, locationY) withTouchPhase:(UITouchPhaseEnded)];
        [self  performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:1];
        
    });
    
    
    
}


-(void)upSlideAndLikeUserAction{
    
    int arcradom =  12 + (arc4random() % 5);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arcradom * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        

        int arcradom =(arc4random() % 20);
        int locationX =100 +  arcradom;
        int locationY =500 +  arcradom;
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        [NSThread sleepForTimeInterval:1];
        
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseMoved)];
        [NSThread sleepForTimeInterval:0.3];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationX) withTouchPhase:(UITouchPhaseEnded)];
        NSString * re =  [[DYVcManager sharedQueue].imloginManager token];

        if (re.length) {
            [self  performSelector:@selector(doubleClickToLikeUserAction) withObject:nil afterDelay:arcradom-2];

        }else{
            [self  performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:arcradom-2];
        }
        
    });
    
}

-(void)doubleClickToLikeUserAction{
    int arcradom =  3 + (arc4random() % 2);
    float loca =arcradom *1.0 / 10;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        int locationX =SCREEN_WIDTH *loca;;
        int locationY =SCREEN_HEIGHT *0.5;
        NSInteger Id = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        //      [NSThread sleepForTimeInterval:0.3];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
        [PTFakeTouch fakeTouchId:Id AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
        
        [NSThread sleepForTimeInterval:0.1];
        
        NSInteger Id1 = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        //      [NSThread sleepForTimeInterval:0.3];
        [PTFakeTouch fakeTouchId:Id1 AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
        //      [NSThread sleepForTimeInterval:0.3];
        [PTFakeTouch fakeTouchId:Id1 AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
        
        [NSThread sleepForTimeInterval:0.1];
        
        NSInteger Id2 = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseBegan)];
        //      [NSThread sleepForTimeInterval:0.3];
        [PTFakeTouch fakeTouchId:Id2 AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseMoved)];
        //      [NSThread sleepForTimeInterval:0.3];
        [PTFakeTouch fakeTouchId:Id2 AtPoint:CGPointMake(locationX, locationY) withTouchPhase:(UITouchPhaseEnded)];
        [self  performSelector:@selector(arcradomToSetUserAction) withObject:nil afterDelay:2];
    });
    
    
}


@end

//
//  AppDelegate.m
//  Video Player
//
//  Created by Vu Huy on 16/06/2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    PlaybackModel *playbackModel = [PlaybackModel getInstance];
    
    if (playbackModel.uuid != nil) {
        NSLog(@"Fuck");
        if (playbackModel.isEpisode) {
            [PlaybackService
                updatePlaybackWithEpisodeUUID:playbackModel.uuid
                currentTime:[NSNumber numberWithInt:playbackModel.currentTime]
                completionHandler:nil
                errorHandler:nil
            ];
        } else {
            [PlaybackService
                updatePlaybackWithMovieUUID:playbackModel.uuid
                currentTime:[NSNumber numberWithInt:playbackModel.currentTime]
                completionHandler:nil
                errorHandler:nil
            ];
        }
    }
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end

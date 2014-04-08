//
//  OpenEars_OfflineSpecchRecognize.h
//  demo
//
//  Created by ANine on 4/7/14.
//  Copyright (c) 2014 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <OpenEars/PocketsphinxController.h>

#import <OpenEars/OpenEarsEventsObserver.h>




#import "AVSpeechUtteranceViewController.h"

@interface OpenEars_OfflineSpecchRecognize : UIViewController <OpenEarsEventsObserverDelegate> {
    PocketsphinxController *pocketsphinxController;
    
    OpenEarsEventsObserver *openEarsEventsObserver;
}
@property (strong, nonatomic) OpenEarsEventsObserver *openEarsEventsObserver;

@property (strong, nonatomic) PocketsphinxController *pocketsphinxController;

@end

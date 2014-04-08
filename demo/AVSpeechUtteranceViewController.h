//
//  AVSpeechUtteranceViewController.h
//  demo
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AVSpeechUtteranceViewController : UIViewController <AVSpeechSynthesizerDelegate>{
    
    AVSpeechSynthesizer *_synthesizer;

    NSMutableArray *_uttersAry;
    
}

@end



@interface AVSpeech : NSObject <AVSpeechSynthesizerDelegate> {
    
    AVSpeechSynthesizer *_synthesizer;
    
    AVSpeech *_speech;
}
+ (instancetype)speech;
- (void)speechWithUtterance:(AVSpeechUtterance *)utterance;
@end
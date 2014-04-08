//
//  AVSpeechUtteranceViewController.m
//  demo
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "AVSpeechUtteranceViewController.h"


@interface AVSpeechUtteranceViewController ()

@end

@implementation AVSpeechUtteranceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createSpeekSynthsizerIfNeeded];
    
    [self createSpeekUtteranceIfNeeded];
    
    [self speechSynthesizer:_synthesizer didFinishSpeechUtterance:nil];
    

    
    
    
    
   //    [_synthesizer speakUtterance:_utterance];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createSpeekSynthsizerIfNeeded {
    if (!_synthesizer) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    _synthesizer.delegate = self;
}

- (void)createSpeekUtteranceIfNeeded {
    
    [self createDataArrayIfNeeded];
    
    for (int i = 0 ; i < 3 ; i ++) {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"%d",arc4random()%10000000]];
        
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
        utterance.preUtteranceDelay = arc4random() % 4;
        [_uttersAry addObject:utterance];
    }
}

- (void)createDataArrayIfNeeded {
    if (!_uttersAry) {
        _uttersAry = [NSMutableArray new];
    }else {
        [_uttersAry removeAllObjects];
    }
}

#pragma mark - AVSpeekSynthsizerDelegate
#pragma mark -

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {

}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {

}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    if (! utterance) {
        [_synthesizer speakUtterance:_uttersAry[0]];
    }else {
        if ([_uttersAry containsObject:utterance]) {
            [_uttersAry removeObject:utterance];
            [_synthesizer speakUtterance:[_uttersAry firstObject]];
        }
    }
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {

}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"the text is %@",utterance.speechString);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {

}

- (void)dealloc {
    _synthesizer.delegate = nil;
    _synthesizer = nil;
    _uttersAry = nil;
}
@end


@implementation AVSpeech

+ (instancetype)speech {
    static AVSpeech *speech = nil;
    if (!speech) {
        speech = [[AVSpeech alloc] init];
    }
    
    
    return speech;
}

- (void)createSpeekSynthsizerIfNeeded {
    if (!_synthesizer) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    _synthesizer.delegate = self;
}

- (void)speechWithUtterance:(AVSpeechUtterance *)utterance {
    [self createSpeekSynthsizerIfNeeded];
    [_synthesizer speakUtterance:utterance];
}

#pragma mark - AVSpeekSynthsizerDelegate
#pragma mark -

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"the text is %@",utterance.speechString);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    
}

@end


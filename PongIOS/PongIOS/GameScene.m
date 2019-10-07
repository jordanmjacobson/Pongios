//
//  GameScene.m
//  PongIOS
//
//  Created by Jordan Jacobson on 9/23/19.
//  Copyright © 2019 Jordan Jacobson. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    //SKShapeNode *_spinnyNode;
    //SKLabelNode *_label;
    SKSpriteNode *_bar;
    SKSpriteNode * _ball;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
   // _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    _bar = (SKSpriteNode *)[self childNodeWithName:@"//bar"];
    _ball = (SKSpriteNode *)[self childNodeWithName:@"//ball"];
    
    //_label.alpha = 0.0;
    //[_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    //CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
   // _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    //_spinnyNode.lineWidth = 2.5;
    
    //[_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
   // [_spinnyNode runAction:[SKAction sequence:@[
                                                //[SKAction waitForDuration:0.5],
                                                //[SKAction fadeOutWithDuration:0.5],
                                                //[SKAction removeFromParent],
                                                //]]];
}


- (void)touchDownAtPoint:(CGPoint)pos {
    //SKShapeNode *n = [_spinnyNode copy];
    //n.position = pos;
    //n.strokeColor = [SKColor greenColor];
    //[self addChild:n];
    
    pos.y = 10;
    [_bar setPosition:pos];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    //SKShapeNode *n = [_spinnyNode copy];
    //n.position = pos;
   // n.strokeColor = [SKColor blueColor];
    //[self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    //SKShapeNode *n = [_spinnyNode copy];
    //n.position = pos;
    //n.strokeColor = [SKColor redColor];
    //[self addChild:n];
    
    pos.y = 10;
    [_bar setPosition:pos];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
    //[_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    //[_bar runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
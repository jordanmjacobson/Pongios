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
    SKLabelNode *_intro;
    SKLabelNode *_scoreboard;
    SKSpriteNode *_bar;
    SKSpriteNode * _ball;
    SKSpriteNode * _upper_barrier;
    int paddle_y;
    int score;
}

#define BAR_CATEGORY 1
#define BLOCK_CATEGORY 1

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    paddle_y = -500;
    
    // Get label node from scene and store it for use later
   // _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    _bar = (SKSpriteNode *)[self childNodeWithName:@"//bar"];
    _ball = (SKSpriteNode *)[self childNodeWithName:@"//ball"];
    _intro = (SKLabelNode * ) [self childNodeWithName:@"//intro"];
    _scoreboard = (SKLabelNode *)[self childNodeWithName:@"//scoreboard"];
    _upper_barrier = (SKSpriteNode * )[self childNodeWithName:@"//upper_barrier"];
    
    //[_ball setPhysicsBody:[[SKPhysicsBody alloc] init]];
    [_ball setPhysicsBody:[SKPhysicsBody
                           bodyWithRectangleOfSize:CGSizeMake(100, 100)]];

    [[_ball physicsBody] setCategoryBitMask:BLOCK_CATEGORY];
    [[_ball physicsBody] setContactTestBitMask:BAR_CATEGORY];
    //[[_ball physicsBody] setDynamic:YES];
    
    [_bar setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)]];
    
    [[_bar physicsBody] setCategoryBitMask:BAR_CATEGORY];
    [[_bar physicsBody] setContactTestBitMask:BLOCK_CATEGORY];
    [[_bar physicsBody] setDynamic:NO];
    
    CGVector v;
    v.dx = 0;
    v.dy = 0;
    [[self physicsWorld] setGravity:v];
    [[self physicsWorld] setContactDelegate:self];
    
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
    //[_ball runAction:[SKAction moveTo:pos duration:2]];
    pos.y = paddle_y;
    [_bar setPosition:pos];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    //SKShapeNode *n = [_spinnyNode copy];
    //n.position = pos;
   // n.strokeColor = [SKColor blueColor];
    //[self addChild:n];
    //_bar.position = pos;
    pos.y = paddle_y;
    [_bar setPosition:pos];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    //SKShapeNode *n = [_spinnyNode copy];
    //n.position = pos;
    //n.strokeColor = [SKColor redColor];
    //[self addChild:n];
    //bar.position = pos;
    pos.y = paddle_y;
    [_bar setPosition:pos];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
    //[_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    //[_bar runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
    [_intro removeFromParent];
    score = 0;
    static int firstTime = 1;
    
    if (firstTime)
    {
        CGVector v;
        v.dx = 11;
        v.dy = -200;
        [[_ball physicsBody] setVelocity:v];
        firstTime = 0;
    }

    // [_ball runAction:[SKAction rotateByAngle:3 duration:2]];
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
    
    CGVector v;
    v.dx = -11;
    v.dy = 200;
    //[[_ball physicsBody] setVelocity:v];

}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    NSLog(@"Things touched!");
    
    SKPhysicsBody *ball, *barrier;
    if ([[contact bodyA] node] == _ball)
    {
        ball = [contact bodyA];
        barrier = [contact bodyB];
    }
    else
    {
        ball = [contact bodyB];
        barrier = [contact bodyA];
    }
    
    // Now down here, check ball and barrier
    // if ([barrier node] == _upper_barrier) ...
    // if ([barrier node] == _paddle) ....
    // if ([barrier node] == _left_or_right_side) ....
    
    //
    if ([barrier node] == _upper_barrier)
        {
            // Bounce off the top
        }
    if ([barrier node] == _bar){
        
    }
    
    CGVector v = [[_ball physicsBody] velocity];
    v.dy = -v.dy;
    score++;
    //scoreboard
    [_scoreboard setText: [NSString stringWithFormat:@"%d", score]];

    
    // [[_ball physicsBody] setVelocity:v];
}
@end

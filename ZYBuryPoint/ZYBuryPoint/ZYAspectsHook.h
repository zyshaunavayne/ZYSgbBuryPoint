//
//  ZYAspectsHook.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/26.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, ZYAspectOptions) {
    ZYAspectPositionAfter   = 0,            /// Called after the original implementation (default)
    ZYAspectPositionInstead = 1,            /// Will replace the original implementation.
    ZYAspectPositionBefore  = 2,            /// Called before the original implementation.
    
    ZYAspectOptionAutomaticRemoval = 1 << 3 /// Will remove the hook after the first execution.
};

/// Opaque Aspect Token that allows to deregister the hook.
@protocol ZYAspectToken <NSObject>

/// Deregisters an aspect.
/// @return YES if deregistration is successful, otherwise NO.
- (BOOL)remove;

@end

/// The AspectInfo protocol is the first parameter of our block syntax.
@protocol ZYAspectInfo <NSObject>

/// The instance that is currently hooked.
- (id)instance;

/// The original invocation of the hooked method.
- (NSInvocation *)originalInvocation;

/// All method arguments, boxed. This is lazily evaluated.
- (NSArray *)arguments;

@end

/**
 Aspects uses Objective-C message forwarding to hook into messages. This will create some overhead. Don't add aspects to methods that are called a lot. Aspects is meant for view/controller code that is not called a 1000 times per second.

 Adding aspects returns an opaque token which can be used to deregister again. All calls are thread safe.
 */
@interface NSObject (ZYAspectsHook)

/// Adds a block of code before/instead/after the current `selector` for a specific class.
///
/// @param block Aspects replicates the type signature of the method being hooked.
/// The first parameter will be `id<AspectInfo>`, followed by all parameters of the method.
/// These parameters are optional and will be filled to match the block signature.
/// You can even use an empty block, or one that simple gets `id<AspectInfo>`.
///
/// @note Hooking static methods is not supported.
/// @return A token which allows to later deregister the aspect.
+ (id<ZYAspectToken>)aspect_hookSelector:(SEL)selector
                      withOptions:(ZYAspectOptions)options
                       usingBlock:(id)block
                            error:(NSError **)error;

/// Adds a block of code before/instead/after the current `selector` for a specific instance.
- (id<ZYAspectToken>)aspect_hookSelector:(SEL)selector
                      withOptions:(ZYAspectOptions)options
                       usingBlock:(id)block
                            error:(NSError **)error;

@end


typedef NS_ENUM(NSUInteger, ZYAspectErrorCode) {
    ZYAspectErrorSelectorBlacklisted,                   /// Selectors like release, retain, autorelease are blacklisted.
    ZYAspectErrorDoesNotRespondToSelector,              /// Selector could not be found.
    ZYAspectErrorSelectorDeallocPosition,               /// When hooking dealloc, only AspectPositionBefore is allowed.
    ZYAspectErrorSelectorAlreadyHookedInClassHierarchy, /// Statically hooking the same method in subclasses is not allowed.
    ZYAspectErrorFailedToAllocateClassPair,             /// The runtime failed creating a class pair.
    ZYAspectErrorMissingBlockSignature,                 /// The block misses compile time signature info and can't be called.
    ZYAspectErrorIncompatibleBlockSignature,            /// The block signature does not match the method or is too large.

    ZYAspectErrorRemoveObjectAlreadyDeallocated = 100   /// (for removing) The object hooked is already deallocated.
};

extern NSString *const ZYAspectErrorDomain;

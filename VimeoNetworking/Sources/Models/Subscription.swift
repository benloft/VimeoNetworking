//
//  self.swift
//  Pods
//
//  Created by Lim, Jennifer on 2/8/17.
//
//

/// Represents all the notifications that the user is Subscribed to.
public class Subscription: VIMModelObject
{
    // MARK: - Properties
    
    /// Represents wether the user is subscribed to the `comment` notification.
    var comment: NSNumber?
    
    /// Represents wether the user is subscribed to the `credit` notification.
    var credit: NSNumber?
    
    /// Represents wether the user is subscribed to the `like` notification.
    var like: NSNumber?
    
    /// Represents wether the user is subscribed to the `mention` notification.
    var mention: NSNumber?
    
    /// Represents wether the user is subscribed to the `reply` notification.
    var reply: NSNumber?
    
    /// Represents wether the user is subscribed to the `follow` notification.
    var follow: NSNumber?
    
    /// Represents wether the user is subscribed to the `video available` notification.
    var videoAvailable: NSNumber?
    
    /// Represents wether the user is subscribed to the `vod pre order available` notification.
    var vodPreorderAvailable: NSNumber?
    
    /// Represents wether the user is subscribed to the `vod rental expiration warning` notification.
    var vodRentalExpirationWarning: NSNumber?
    
    /// Represents wether the user is subscribed to the `account expiration warning` notification.
    var accountExpirationWarning: NSNumber?
    
    /// Represents wether the user is subscribed to the `share` notification.
    var share: NSNumber?
    
    /// Represents wether the is subscribed to the `New video available from followed user` notification.
    var followedUserVideoAvailable: NSNumber?
    
    /// Represents the Subscription object as a Dictionary
    public var toDictionary: [AnyHashable: Any]
    {
        let comment = self.comment ?? false
        let credit = self.credit ?? false
        let like = self.like ?? false
        let mention = self.mention ?? false
        let reply = self.reply ?? false
        let follow = self.follow ?? false
        let vodPreorderAvailable = self.vodPreorderAvailable ?? false
        let videoAvailable = self.videoAvailable ?? false
        let share = self.share ?? false
        let followedUserVideoAvailable = self.followedUserVideoAvailable ?? false
        let dictionary = ["comment": comment,
                          "credit": credit,
                          "like": like,
                          "mention": mention,
                          "reply": reply,
                          "follow": follow,
                          "vod_preorder_available": vodPreorderAvailable,
                          "video_available": videoAvailable,
                          "share": share,
                          "followed_user_video_available": followedUserVideoAvailable]
        
        return dictionary
    }
    
    // MARK: - VIMMappable
    
    override public func getObjectMapping() -> Any
    {
        return [
            "video_available": "videoAvailable",
            "vod_preorder_available": "vodPreorderAvailable",
            "vod_rental_expiration_warning": "vodRentalExpirationWarning",
            "account_expiration_warning": "accountExpirationWarning",
            "followed_user_video_available": "followedUserVideoAvailable"]
    }
    
    // MARK: - Helpers
    
    /// Helper method that determine whether a user has all the subscription settings turned off.
    ///
    /// - Returns: A boolean that indicates whether the user has all the settings for push notifications disabled.
    public func areSubscriptionsDisabled() -> Bool
    {
        return (self.comment == false &&
                self.credit == false &&
                self.like == false &&
                self.mention == false &&
                self.reply == false &&
                self.follow == false &&
                self.vodPreorderAvailable == false &&
                self.videoAvailable == false &&
                self.share == false &&
                self.followedUserVideoAvailable == false)
    }
}

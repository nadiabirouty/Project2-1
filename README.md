# Goals for Project 2
The main goals of this assignment are to learn how to:

1. Make a network request
1. Deserialize a *JSON* object to swift models
1. Use *UITableView*
1. Create custom *UITableViewCell*
1. Use autolayout
1. Use *protocols* and *delegates*

# Prerequisite

The final version of Xcode 7 has been released so you should use that instead of any of the beta version. Please go ahead and download that before proceeding with this project.

# Requirements
![Project 2](images/Project2.gif)

For this project we are going to recreate the instagram app. It will only be read only meaning we won't be able to login in, like, or upload photos. Moreover, we will only build several of the features of the app. Below is a checklist of all the required specs for this project:

- You should set up cocoapads for this project. You may use the [Alamofire](https://github.com/Alamofire/Alamofire) and [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) pods, as we have done in class, or you can use other pods that you find useful.
- User can view a list of popular media from Instagram.
    - All photos (profile photo and taken photo) should be loaded asynchronously. You can accomplish this by doing what we did in class _or_ using the [AFNetworking](https://github.com/AFNetworking/AFNetworking) pod. The library has an extension to the *UIImageView* class that adds a method `setImageWithURL` which will load the image from the URL asynchronously. You can find more information about this method in the [AFNetworking Documentation](http://cocoadocs.org/docsets/AFNetworking/2.6.0/Categories/UIImageView+AFNetworking.html#//api/name/setImageWithURL:). The only downside is that AFNetworking is an Objective-C framework so you need to figure out how to hook the two. It's not covered in class but it would be a good exercise to learn about Objective-C and Swift [interoperability](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/).
- Each media item should have the following:
    - A section header that has the user profile image and the username on the left and when the photo was taken on the right.
    - The taken photo should have the same width and height.
    - It should have the number of likes under the photo.
    - If the photo has a caption text, then it should be displayed under the number of likes.
    - Under the caption, all the comments for the photo should be displayed: the username of the person who commented and the comment itself. Notice that the comments could potentially be very long so they might spawn many lines. Also, the username needs to be a different color from the comment text to make it easier to distinguish between the two. Take a look at [NSAttributedString](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSAttributedString_Class/) on how to do this.
- User can pull the page to refresh. You can use [UIRefreshControl](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIRefreshControl_class/) to accomplish this.
- The user can see the user profile page by tapping on the profile photo or the username. The profile page is very similar to the feed page except the following:
    - The list of media items is the user's media instead of the popular ones.
    - The profile page should have a *[tableHeaderView](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/#//apple_ref/occ/instp/UITableView/tableHeaderView)* that shows the user's number of posts, followers and following.
- All views in storyboards, custom cells, and custom views should have autolayout constraints and no autolayout constraint warnings.

# Instagram API

For this project we will be using the [Instagram API]
(https://instagram.com/developer/endpoints/). Normally you would need to create an application through instagram to be able to make api calls but we have taken care of the that part for you. There are three api endpoints required for this project:

- Popular media: https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673 . This will be used for the the feed page.
- User's recent media: https://api.instagram.com/v1/users/{user_id}/media/recent/?client_id=c953ffadb974463f9f6813fc4fc91673 . This will be used in the user profile page to fetch the recent media created by the selected user.
- User's profile: https://api.instagram.com/v1/users/{user_id}/?client_id=c953ffadb974463f9f6813fc4fc91673 . This will give us the number of posts, followers, and following for the user page.

Notice that {user_id} needs to be substituted with the user's actual id.

# Milestones and Deliverables

Because this is a fairly large project, we are going to break it down into three milestones to keep you on track.

## Milestone 1 (Due Friday, Sept 18)

Define Swift models to hold all the information that you need from Instagram. This is _similar_ (not identical, so exercise judgment and do what you think will be best for Milestones 2 and 3) to how we did it for the GitHubDemo. Your model is responsible for fetching all the required data for use in your app.

Deliverables:

1. An Xcode project (with the Podfile and any pods that you are using) with your model classes. You should be able to fetch information about media, the user profile and the user's recent media.
1. Tests for the models to demonstrate that they can successfully fetch and populate data. Since you will be making asynchronous calls, you might find the [XCTestExpectation](http://nshipster.com/xctestcase/) construct useful.

## Milestone 2 (Due Friday, Sept 25)

Define the view and table view controller so that you can display information from your models. At this stage, you only need to handle the main page. You do *not* need to handle tapping on a username to segue to a different screen showing the user profile yet.

For simplicity, you can assume that your application will only be used in portrait mode so you don't have to handle rotation. However, you *must* ensure that it works across different screen sizes from iPhone 5 to iPhone 6 Plus.

Deliverables:

1. Your Xcode project from Milestone 1, augmented with your own TableViewController and storyboard(s) to display the content.
1. Your main page must contain all the information from our sample gif. Note that you have freedom in defining the layout but you must display all the information, e.g., user name, likes, comments, etc.
1. Your main page needs to support the "pull-to-refresh" feature.

## Milestone 3 (Due Friday, October 2)

You now need to augment your code with the _final_ bit of functionality: tapping on a user's name should bring you to that user's profile page. Once you're in the page, tapping on another user's name (might be the same) will again bring you to that user's profile, and so on. In short, you need to be able to handle a chain of navigations.

Deliverables:

1. The final Xcode project containing all the code (including any suggestions that we have for improvements for Milestone 2).
1. Your app should match what we have in terms of functionality but may differ in terms of look and feel.

# Submission

Post a private note to Piazza with a link to your project when you're done. To help us check out the right revision of your code, please [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) the appropriate commit with the name Milestone1, Milestone2, etc.

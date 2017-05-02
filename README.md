# BOF

## Overview
BOF is a simple Twitter clone with a slight twist. It owes it's name to the French non-speech sound of the same name, as I've come to understand it, to express indifference to something just heard. With BOF, you can take that attitude to the digital space and, well BOF at your friends' or even your own thoughts expressed as little posts.

## Quick Tour
After signing up for an account and signing in, some posts await you on the main screen. If you leave the app and come back, be sure to look for a bouncing logo which means you have more posts awaiting you. In that case, pull the table to refresh and voila!

Oh, and, of course, you can create a new post and add it to your timeline any time you wish.

Lastly, don't forget to mark the 'bof-worthy' posts as you read along.

## Additional Considerations
For optimal UX, the app caches old posts so as to minimize load time. The full version will continue working in the background to manage its network services and update the UI with fresh content.

To improve UX further, the app keeps a secret 'token' locally until it's refreshed or destroyed (after deleting the app). This token allows the user to 'walk in and out' of the app without having to sign in every time the app is launched.

On the first launch, an initial sign up is required to securely store the username/email & password in the Keychain as well as to obtain the secret token for future interactions with the app.

## QA
Both Unit and UI/KIF tests were written to conduct automated QA for the app. Unfortunately, an obscure issue with KIF framework installation via Cocoapods prevented extensive UI testing of the app. In the interest of time, sample tests were left in place to demonstrate the idea behind automated testing.

In addition, the app was subject to extensive user testing on 3 separate iPhone devices (5S, 6 and 6Plus) by multiple users.

### UPDATE
The KIF issue mentioned above affected all three of my work projects today. I have now identified and applied an effective fix to restore UI testing using KIF for those projects.

I shall do the same for this project later this evening (May 2, 2017).

/* This file is part of mac2imgur.
*
* mac2imgur is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.

* mac2imgur is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.

* You should have received a copy of the GNU General Public License
* along with mac2imgur.  If not, see <http://www.gnu.org/licenses/>.
*/

import Cocoa

class Utils {
    
    static func copyToClipboard(string: String) {
        NSPasteboard.generalPasteboard().clearContents()
        NSPasteboard.generalPasteboard().setString(string, forType: NSStringPboardType)
    }
    
    static func deleteFile(fileURL: NSURL) {
        do {
            try NSFileManager.defaultManager().removeItemAtURL(fileURL)
        } catch let error as NSError {
            NSLog("An error occurred while attempting to delete a file: %@", error)
        }
    }
    
    static func displayNotification(title: String, informativeText: String) {
        let notification = NSUserNotification()
        notification.title = title
        notification.informativeText = informativeText
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notification)
    }
    
    static func openURL(URLString: String) {
        if let URL = NSURL(string: URLString) {
            NSWorkspace.sharedWorkspace().openURL(URL)
        }
    }
}

import UIKit

func autocorrect(_ text: String) -> String {
    var newString = ""
    
    let lowered = text.lowercased()
    var textArray = text.components(separatedBy: " ")
    var newArray = [String]()
    
    if textArray[0] == "You" || textArray[0] == "U" || textArray[0] == "Youuu" || textArray[0] == "Youuuu" || textArray[0] == "Youuuuu"{
        textArray = lowered.components(separatedBy: " ")
    }
    
    for wording in textArray {
        if wording == "u" || wording.contains("you") && Set(wording).count == 3 && !wording.contains("youy"){
            newString = wording.replacingOccurrences(of: wording, with: "your client", options: .literal, range: nil)
            newArray.append(newString)
        } else if wording.contains("you.") && Set(wording).count == 4 || wording == "u."{
            newString = wording.replacingOccurrences(of: wording, with: "your client.", options: .literal, range: nil)
            newArray.append(newString)
        } else {
            newArray.append(wording)
        }
    }
    
    return newArray.joined(separator: " ")
}

autocorrect("u are welcome")
autocorrect("We have sent the deliverables to you.")
// "We have sent the deliverables to your client."
autocorrect("Our team is excited to finish this with you.")
// "Our team is excited to finish this with your client."
autocorrect("youtube")
// "youtube"
autocorrect("Look forward to meeting youuuuu")
// "Look forward to meeting your client"
autocorrect("We want to film the commercial with you and syndicate it to youtube")
// "We want to film the commercial with your client and syndicate it to youtube"
autocorrect("You should begin on Monday")
// "your client should begin on Monday"
autocorrect("You u youville utube you youyouyou uuu raiyou united youuuu u you")
// "your client your client youville utube your client youyouyou uuu raiyou united your client your client your client"
autocorrect("You = so close")
// "your client = so close"
autocorrect("The case is finished with u")
// "The case is finished with your client"
autocorrect("Let's market you on youtube")
// "Let's market your client on youtube"
autocorrect("Our friend Alabinyou is conveniently named, and he wants to build a website called youwin with youuu")
// "Our friend Alabinyou is conveniently named, and he wants to build a website called youwin with your client"
autocorrect("You should be active on younation")
// "your client should be active on younation"
autocorrect("Hope to see u there!")
// "Hope to see your client there!"


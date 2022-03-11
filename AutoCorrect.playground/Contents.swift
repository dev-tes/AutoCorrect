import UIKit

func autocorrect(_ text: String) -> String {
    // declare a new string variable
    var newString = ""
    
    // Due to the fact that every first word that changes starts with small letter regardless of their position in the sentence, there's need to turn some to lower case.
    let lowered = text.lowercased()
    
    // Separate all words into an array - "textArray" and declare an empty array of string - "newArray"
    //    var textArray = text.components(separatedBy: " ")
    let textArray = lowered.components(separatedBy: " ")
    var newArray = [String]()
    
    // For every word in the textArray, if the word is U or You and its casual variants with several U's, it should replace the word with "your client" and append to the newArray.
    for word in textArray {
        if word == "u" || word.contains("you") && Set(word).count == 3 && !word.contains("youy"){
            newString = word.replacingOccurrences(of: word, with: "your client", options: .literal, range: nil)
            newArray.append(newString)
            
            // else for those with full stop behind them, this is because the separation doesn't exclude the full stop, it should add full stop to their "your client" too.
        } else if word.contains("you.") && Set(word).count == 4 || word == "u."{
            newString = word.replacingOccurrences(of: word, with: "your client.", options: .literal, range: nil)
            newArray.append(newString)
        } else {
            newArray.append(word)
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


//
//  E+String.swift
//  WPFacebookTableView
//
//  Created by Alex on 12/12/20.
//

import Foundation
import UIKit

extension String {
    func strSize(with bound: CGSize, font: UIFont, miniHeight: Bool) -> CGSize {
        let nss = NSString(string: self)
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin,.usesFontLeading]
        let size = nss.boundingRect(with: bound, options: options, attributes: [.font: font], context: nil).size
        var height = CGFloat(ceilf(Float(size.height)))
        if miniHeight {
            height = max(height, 40)
        }
        return CGSize(width: size.width, height: height)
    }
}


extension String {

    static var random: String {
        get {
            let texts = String.full.split(separator: "\n")
            let idx = Int.random(in: 0 ..< texts.count)
            return String(texts[idx])
        }
        
    }
    
    static var full: String {
        get {
            return
                """
                Team New Zealand could be facing a day without an opponent on Friday as INEOS Team UK race the clock to overcome an issue with their AC75 for the second day of the America's Cup World Series.

                Team New Zealand are set to meet the British outfit twice on Friday, however the challenger needs to repair an issue with the foil cant system that saw them struggle in their opening race and withdraw from their second on the first day of racing.

                The foil cant system has been a sticking point for teams in the lead up to the event, with Luna Rossa's Max Sirena revealing last month that his team had been having their own issues with the supplied component of the AC75.

                At the time Sirena described the key design component, provided by Team New Zealand to all teams, as something from a regular car being put into a Formula One car.

                INEOS Team UK Britannia pulls out during the third race against Luna Rossa in the America's Cup World Series regatta. Photo / Dean Purcell
                INEOS Team UK Britannia pulls out during the third race against Luna Rossa in the America's Cup World Series regatta. Photo / Dean Purcell
                Speaking after Thursday's sailing, INEOS Team UK skipper Sir Ben Ainslie admitted there was no guarantee his crew would be ready to take their place on the water for day two because of the issue.

                "We've probably lost weeks of this campaign on the water dealing with the foil cant system," Ainslie said.

                "I can't speak for the other teams, but I imagine they've also lost a number of days. It's a challenge."

                The foil cant system, a one-design component provided to all teams which is effectively the hydraulics that control the foil arms on the AC75s, was designed by Team New Zealand so the software is the team's intellectual property.

                Ainslie suggested the Kiwi crew had been reluctant to share that software with other teams, but hoped the issues that saw them become mere spectators on the first day of competitive racing in an AC75 would prompt a better working relationship on the issue.

                "I'm not saying it's any one team's fault, I just think we need to work together better than we are doing to resolve it, and we need some resolution for a team who loses races through no fault of their own, but through supplied software," Ainslie said.

                Related articles

                17 Dec, 2020 06:30 PMQuick Read

                17 Dec, 2020 05:10 PMQuick Read

                "We've been working together to try and resolve the issue. It's trickier, because a lot of the information, the software is Team New Zealand sourced. On the one hand, I can understand they don't want to share that data and that intellectual property, but unless we understand, it's really hard for the other teams to input back and to solve it. And it's not solved, so as much as it's our issue today, it'll be someone else's issue tomorrow.

                "It's not a perfect scenario; I think it needs fixing, if not for our team, it will be another team, another day and wouldn't it be terrible if the America's Cup was decided because of something like that. It needs resolving.

                "Generally, the teams have been pretty collaborative on these issues; this has been a bit of a sticking point and hopefully this is the final nail that gets it across the line."

                The issue has limited the British challenger's ability to really prove what their vessel is capable of. While Ainslie admitted they still had some ground to make up in sailing in the lighter wind conditions, he was confident in his team.

                INEOS Team UK (right) races against Team New Zealand on day one of the America's Cup World Series regatta. Photo / Dean Purcell
                INEOS Team UK (right) races against Team New Zealand on day one of the America's Cup World Series regatta. Photo / Dean Purcell
                "We've got a number of issues; the foil cant system is just one of them," he admitted.

                "Our performance in the lighter airs is not good enough; it's not where it needs to be and it's certainly not as good as the Italians and the Kiwis. We're working hard to resolve that and that's the challenge of the Cup – it's never going to be easy. It's particularly difficult for us and the moment, but I'm confident in the team and that we've got the right people to sort this out."

                Enjoy smooth sailing to the Cup with Auckland Transport

                Avoid traffic congestion and parking niggles and download the AT Mobile app to plot your bus, train or ferry ride to race venues before you leave home.

                Make sure your AT HOP card is in your pocket. It's the best way to ride to the Cup

                For more ways to enjoy race day, visit at.govt.nz/americascup
                """
        }
    }

}

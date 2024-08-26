//
//  ReviewView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import SwiftUI

struct ReviewView: View {
    let review: Review

    @State private var isTextExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Circle()
                            .fill()
                            .foregroundStyle(.gray)
                        Image(systemName: "person")
                            .font(.title)
                    }
                }
                .cornerRadius(90)
                .frame(width: 50, height: 50)
                .padding(.bottom, 4)

                VStack(alignment: .leading) {
                    Text(review.author)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Text(review.formattedCreatedAt)
                        .foregroundStyle(.gray)
                        .font(.caption)
                }

                Spacer()

                if !review.authorRating.isEmpty {
                    Text("\(review.authorRating)/10")
                        .bold()
                        .foregroundStyle(
                            colorForRating(review.authorDetails?.rating ?? 0))
                }
            }

            HStack {
                if isTextExpanded {
                    Text(review.content)
                } else {
                    Text(review.content)
                        .lineLimit(3)
                        .truncationMode(.tail)
                }
            }
        }
        .onTapGesture {
            isTextExpanded.toggle()
        }
    }
}

#Preview {
    ReviewView(
        review: Review(
            author: "John Chard",
            authorDetails: AuthorDetails(
                name: "",
                username: "John Chard",
                avatarPath: "/utEXl2EDiXBK6f41wCLsvprvMg4.jpg",
                rating: 9
            ),
            content: """
                Some birds aren't meant to be caged.

                The Shawshank Redemption is written and directed by Frank Darabont. It is an adaptation of the Stephen King novella Rita Hayworth and Shawshank Redemption. Starring Tim Robbins and Morgan Freeman, the film portrays the story of Andy Dufresne (Robbins), a banker who is sentenced to two life sentences at Shawshank State Prison for apparently murdering his wife and her lover. Andy finds it tough going but finds solace in the friendship he forms with fellow inmate Ellis "Red" Redding (Freeman). While things start to pick up when the warden finds Andy a prison job more befitting his talents as a banker. However, the arrival of another inmate is going to vastly change things for all of them.

                There was no fanfare or bunting put out for the release of the film back in 94, with a title that didn't give much inkling to anyone about what it was about, and with Columbia Pictures unsure how to market it, Shawshank Redemption barely registered at the box office. However, come Academy Award time the film received several nominations, and although it won none, it stirred up interest in the film for its home entertainment release. The rest, as they say, is history. For the film finally found an audience that saw the film propelled to almost mythical proportions as an endearing modern day classic. Something that has delighted its fans, whilst simultaneously baffling its detractors. One thing is for sure, though, is that which ever side of the Shawshank fence you sit on, the film continues to gather new fans and simply will never go away or loose that mythical status.

                It's possibly the simplicity of it all that sends some haters of the film into cinematic spasms. The implausible plot and an apparent sentimental edge that makes a nonsense of prison life, are but two chief complaints from those that dislike the film with a passion. Yet when characters are this richly drawn, and so movingly performed, it strikes me as churlish to do down a human drama that's dealing in hope, friendship and faith. The sentimental aspect is indeed there, but that acts as a counterpoint to the suffering, degradation and shattering of the soul involving our protagonist. Cosy prison life you say? No chance. The need for human connection is never more needed than during incarceration, surely? And given the quite terrific performances of Robbins (never better) & Freeman (sublimely making it easy), it's the easiest thing in the world to warm to Andy and Red.

                Those in support aren't faring too bad either. Bob Gunton is coiled spring smarm as Warden Norton, James Whitmore is heart achingly great as the "Birdman Of Shawshank," Clancy Brown is menacing as antagonist Capt. Byron Hadley, William Sadler amusing as Heywood & Mark Rolston is impressively vile as Bogs Diamond. Then there's Roger Deakins' lush cinematography as the camera gracefully glides in and out of the prison offering almost ethereal hope to our characters (yes, they are ours). The music pings in conjunction with the emotional flow of the movie too. Thomas Newman's score is mostly piano based, dovetailing neatly with Andy's state of mind, while the excellently selected soundtrack ranges from the likes of Hank Williams to the gorgeous Le Nozze di Figaro by Mozart.

                If you love Shawshank then it's a love that lasts a lifetime. Every viewing brings the same array of emotions - anger - revilement - happiness - sadness - inspiration and a warmth that can reduce the most hardened into misty eyed wonderment. Above all else, though, Shawshank offers hope - not just for characters in a movie - but for a better life and a better world for all of us.
                """,
            createdAt: "2016-07-10T00:16:50.561Z",
            id: "578193f29251417c28001764",
            updatedAt: "2024-05-16T15:22:14.028Z",
            url: "https://www.themoviedb.org/review/578193f29251417c28001764"
        )
    )
}

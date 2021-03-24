//
//  ContentView.swift
//  TikTok Stats Profile
//
//  Created by Arrinal Sholifadliq on 03/03/21.
//

import CoreData
import SwiftUI
import MobileCoreServices

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var tasks: FetchedResults<Task>
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""

    var body: some View {
        
            NavigationView {
                ZStack {
                    VStack {
                        
                        //profile picture
                        Image(uiImage: joy(8).load())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 5))
                        
                        //username
                        Text(joy(0))
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(Color("Color-text"))
                        
                        //bio
                        Text("\(joy(1))")
                            .font(.system(size: 12))
                            .foregroundColor(Color("Color-text"))
                            .lineLimit(2)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .multilineTextAlignment(.center)
                        
                        //link
                        Text(joy(2))
                            .font(.system(size: 12))
                            .foregroundColor(Color("Color-text"))
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            //nickname
                            Text(joy(3))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .kerning(2.0)
                                .frame(maxWidth: .infinity, idealHeight: 100 ,maxHeight: 100, alignment: .leading)
                                .padding(.leading, 25)
                                .font(.system(size: 25))
                                .background(
                                    ZStack {
                                        Color("Color-1")
                                    }
                                )
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .strokeBorder(Color.black, lineWidth: 0)
                                )
                            
                            Spacer()
                            
                            //follower
                            Text("FOLLOWER    : " + joy(4))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .kerning(2.0)
                                .frame(maxWidth: .infinity, idealHeight: 100 ,maxHeight: 100, alignment: .leading)
                                .padding(.leading, 25)
                                .font(.system(size: 25))
                                .background(
                                    ZStack {
                                        Color("Color-2")
                                    }
                                )
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .strokeBorder(Color.black, lineWidth: 0)
                                )

                            Spacer()

                            //following
                            Text("FOLLOWING  : " + joy(5))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .kerning(2.0)
                                .frame(maxWidth: .infinity, idealHeight: 100 ,maxHeight: 100, alignment: .leading)
                                .padding(.leading, 25)
                                .font(.system(size: 25))
                                .background(
                                    ZStack {
                                        Color("Color-3")
                                    }
                                )
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .strokeBorder(Color.black, lineWidth: 0)
                                )

                            Spacer()

                            //liked by
                            Text("LIKED BY       : " + joy(6))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .kerning(2.0)
                                .frame(maxWidth: .infinity, idealHeight: 100 ,maxHeight: 100, alignment: .leading)
                                .padding(.leading, 25)
                                .font(.system(size: 25))
                                .background(
                                    ZStack {
                                        Color("Color-4")
                                    }
                                )
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .strokeBorder(Color.black, lineWidth: 0)
                                )

                            Spacer()

                            //videostotal
                            Text("VID TOTAL     : " + joy(7))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .kerning(2.0)
                                .frame(maxWidth: .infinity, idealHeight: 100 ,maxHeight: 100, alignment: .leading)
                                .padding(.leading, 25)
                                .font(.system(size: 25))
                                .background(
                                    ZStack {
                                        Color("Color-5")
                                    }
                                )
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .strokeBorder(Color.black, lineWidth: 0)
                                )
                        }
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        .onAppear(perform: {
                            addTask()
                        })
                                    }
                                    .navigationBarTitle("TikTok Stats Finder")
                                    .navigationBarItems(trailing: Button("Search") {
                                        self.isPresented = true
                                        print(self.isPresented)
                                    })
                                    .onTapGesture {
                                        if self.isPresented == true {
                                            self.isPresented = false
                                            endEditing()
                                            
                                        }
                                    }
                    
                    //search alert
                    SearchAlert(title: "Search Profile", isShown: $isPresented, text: $text, onDone: { text in
                        ambil(text)
                        })
                }
                
            }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved errro \(error)")
        }
    }
    
    
    private func updateTask() {
        tasks.last?.nickname = "updated"
        
        saveContext()
    }

    private func addTask() {
        let newTask = Task(context: viewContext)
        newTask.usernameProfile = "Username: -"
        newTask.bio = "No bio yet."
        newTask.linkProfile = "Link: NONE"
        newTask.nickname = "NICKNAME    : -"
        newTask.follower = "-"
        newTask.following = "-"
        newTask.likedBy = "-"
        newTask.videosTotal = "-"
        newTask.profilePicture = "-"
        
        saveContext()
}
    
    //Isian Teks
    private func joy(_ pilihan: Int) -> String {
        if tasks.isEmpty == true {
            return "Untitled"
        } else {
            switch pilihan {
            case 0:
                return (tasks.last?.usernameProfile) ?? "Username: -"

            case 1:
                return (tasks.last?.bio) ?? "No bio yet."
                
            case 2:
                return (tasks.last?.linkProfile) ?? "Link: NONE"
                
            case 3:
                return (tasks.last?.nickname) ?? "NICKNAME    : -"
                
            case 4:
                return (tasks.last?.follower) ?? "-"
                
            case 5:
                return (tasks.last?.following) ?? "-"
                
            case 6:
                return (tasks.last?.likedBy) ?? "-"
                
            case 7:
                return (tasks.last?.videosTotal) ?? "-"
                
            case 8:
                return (tasks.last?.profilePicture) ?? "-"

            default:
                return "Untitled"
            }
            
        }
    }
    
    
    
    
    private func ambil(_ tiktokUsername: String) {

        let baseUrl = "https://www.tiktok.com/@"
        let username = tiktokUsername
        
        var usernameProfile = ""
        var nickname = ""
        var bio = ""
        var linkProfile = ""
        var follower = ""
        var following = ""
        var likedBy = ""
        var videosTotal = ""
        var profilePicture = ""
        
        func addPoint(numberVar: [String.Element] ) -> [String.Element] {
            var aNumberVar = numberVar
            if aNumberVar.count <= 3 {
                
            } else if aNumberVar.count >= 7 && aNumberVar.count <= 9 {
                aNumberVar.insert(".", at: aNumberVar.count - 6)
                aNumberVar.insert(".", at: aNumberVar.count - 3)
            } else if aNumberVar.count >= 4 && aNumberVar.count <= 6 {
                aNumberVar.insert(".", at: aNumberVar.count - 3)

            }
            return aNumberVar
        }
        
        let leftSideOfTheUsername = """
        "$pageUrl":"/
        """

        let rightSideOfTheUsername = """
        ","$fullUrl"
        """

        let leftSideOfTheNickname = """
        ,"nickname":"
        """

        let rightSideOfTheNickname = """
        ","avatarLarger"
        """
        
        let leftSideOfTheBio = """
        <h2 class="share-desc mt10">
        """

        let rightSideOfTheBio = """
        </h2><div class="share-links">
        """
        
        let leftSideOfTheLink = """
        {"link":"
        """

        let rightSideOfTheLink = """
        ","risk":
        """
        
        let leftSideOfTheFollower = """
        stats":{"followerCount":
        """

        let rightSideOfTheFollower = """
        ,"followingCount":
        """

        let leftSideOfTheFollowing = """
        ,"followingCount":
        """

        let rightSideOfTheFollowing = """
        ,"heart":
        """

        let leftSideOfTheLikes = """
        ,"heartCount":
        """

        let rightSideOfTheLikes = """
        ,"videoCount":
        """

        let leftSideOfTheVideosTotal = """
        ,"videoCount":
        """

        let rightSideOfTheVideosTotal = """
        ,"diggCount":
        """
        
        let leftSideOfTheImage = """
        property="og:image" content="
        """

        let rightSideOfTheImage = """
        "/><meta property="og:image:secure_url"
        """
        
        let url = URL(string: baseUrl + username) ?? URL(string: baseUrl + "")!
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in

            guard let data = data else {
                print("data was nil")
                return
            }

            guard let htmlString = String(data: data, encoding: String.Encoding.utf8) else {
                print("cannot cast data into string")
                return
            }
            
            //Username
            guard let leftRangeUsername = htmlString.range(of: leftSideOfTheUsername) else {
                print("cannot find left range")
                return
            }

            guard let rightRangeUsername = htmlString.range(of: rightSideOfTheUsername) else {
                print("cannot find right range")
                return
            }

            let rangeOfTheUsername = leftRangeUsername.upperBound..<rightRangeUsername.lowerBound

            usernameProfile = String(htmlString[rangeOfTheUsername])
            tasks.last?.usernameProfile = usernameProfile

            //Nickname
            guard let leftRangeNickname = htmlString.range(of: leftSideOfTheNickname) else {
                print("cannot find left range di nickname")
                tasks.last?.usernameProfile = "Untitled"
                tasks.last?.nickname = "Profile Not Found"
                tasks.last?.bio = "No bio yet."
                tasks.last?.linkProfile = "Link: NONE"
                tasks.last?.follower = "-"
                tasks.last?.following = "-"
                tasks.last?.likedBy = "-"
                tasks.last?.videosTotal = "-"
                tasks.last?.profilePicture = ""
                return
            }

            guard let rightRangeNickname = htmlString.range(of: rightSideOfTheNickname) else {
                print("cannot find right range")
                return
            }

            let rangeOfTheNickname = leftRangeNickname.upperBound..<rightRangeNickname.lowerBound

            nickname = String(htmlString[rangeOfTheNickname])
            tasks.last?.nickname = nickname
            
            //Bio
            guard let leftRangeBio = htmlString.range(of: leftSideOfTheBio) else {
                print("cannot find left range di bio")
                return
            }
            
            guard let rightRangeBio = htmlString.range(of: rightSideOfTheBio) else {
                print("cannot find right range")
                return
            }
            
            let rangeOfTheBio = leftRangeBio.upperBound..<rightRangeBio.lowerBound
            
            if htmlString[rangeOfTheBio] == "" {
                bio = "No bio yet."
                tasks.last?.bio = bio
            } else {
                bio = String(htmlString[rangeOfTheBio]).replacingOccurrences(of: "\\n", with: "\n")
                print(bio)
                tasks.last?.bio = bio
            }
            
            //Link
            var rangeOfTheLink: Range<String.Index>?
            func link() {
                guard let leftRangeLink = htmlString.range(of: leftSideOfTheLink) else {
                    return
                }

                guard let rightRangeLink = htmlString.range(of: rightSideOfTheLink) else {
                    return
                }

                rangeOfTheLink = leftRangeLink.upperBound..<rightRangeLink.lowerBound
            }
            link()
            if let link = rangeOfTheLink {
                linkProfile = String(htmlString[link])
                tasks.last?.linkProfile = linkProfile
            } else {
                linkProfile = "Link: NONE"
                tasks.last?.linkProfile = linkProfile
            }
            
            
            //Follower
            guard let leftRangeFollower = htmlString.range(of: leftSideOfTheFollower) else {
                print("cannot find left range")
                return
            }
            
            guard let rightRangeFollower = htmlString.range(of: rightSideOfTheFollower) else {
                print("cannot find right range")
                return
            }
            
            let rangeOfTheFollower = leftRangeFollower.upperBound..<rightRangeFollower.lowerBound
            
            let followerTotalInString = String(htmlString[rangeOfTheFollower])
            let followerTotalInArray = Array(followerTotalInString)
            let followerAddedPoint = addPoint(numberVar: followerTotalInArray)
            
            for x in followerAddedPoint {
                follower = follower + String(x)
            }
            tasks.last?.follower = follower
            
            
            
            //Following
            guard let leftRangeFollowing = htmlString.range(of: leftSideOfTheFollowing) else {
                print("cannot find left range")
                return
            }
            
            guard let rightRangeFollowing = htmlString.range(of: rightSideOfTheFollowing) else {
                print("cannot find left range")
                return
            }
            
            let rangeOfTheFollowing = leftRangeFollowing.upperBound..<rightRangeFollowing.lowerBound
            
            let followingTotalInString = String(htmlString[rangeOfTheFollowing])
            let followingTotalInArray = Array(followingTotalInString)
            let followingAddedPoint = addPoint(numberVar: followingTotalInArray)
            
            for x in followingAddedPoint {
                following = following + String(x)
            }
            tasks.last?.following = following
            
            //Likes
            guard let leftRangeLikes = htmlString.range(of: leftSideOfTheLikes) else {
                print("cannot find left range")
                return
            }
            
            guard let rightRangeLikes = htmlString.range(of: rightSideOfTheLikes) else {
                print("cannot find right range")
                return
            }
            
            let rangeOfTheLikes = leftRangeLikes.upperBound..<rightRangeLikes.lowerBound
            
            let likesTotalInString = String(htmlString[rangeOfTheLikes])
            let likesTotalInArray = Array(likesTotalInString)
            let likesAddedPoint = addPoint(numberVar: likesTotalInArray)
            
            for x in likesAddedPoint {
                likedBy = likedBy + String(x)
            }
            tasks.last?.likedBy = likedBy
            
            //Videos Total
            guard let leftRangeVideosTotal = htmlString.range(of: leftSideOfTheVideosTotal) else {
                print("cannot find left range")
                return
            }
            
            guard let rightRangeVideosTotal = htmlString.range(of: rightSideOfTheVideosTotal) else {
                print("cannot find right range")
                return
            }
            
            let rangeOfTheVideosTotal = leftRangeVideosTotal.upperBound..<rightRangeVideosTotal.lowerBound
            
            videosTotal = String(htmlString[rangeOfTheVideosTotal])
            tasks.last?.videosTotal = videosTotal
            
            //Image
            guard let leftRangeImage = htmlString.range(of: leftSideOfTheImage) else {
                print("cannot find left range")
                return
            }
            
            guard let rightRangeImage = htmlString.range(of: rightSideOfTheImage) else {
                print("cannot find right range")
                return
            }
            
            let rangeOfTheImage = leftRangeImage.upperBound..<rightRangeImage.lowerBound
            
            profilePicture = String(htmlString[rangeOfTheImage])
            tasks.last?.profilePicture = profilePicture
        }

        task.resume()
    }
    
    private func endEditing() {
            UIApplication.shared.endEditing()
        }
    
}

extension String {
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        
        return UIImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

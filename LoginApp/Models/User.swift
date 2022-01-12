//
//  File.swift
//  LoginApp
//
//  Created by Leysan Latypova on 10.01.2022.
//

import Foundation

struct User {
    let name: String
    let surname: String
    let loginData: LoginData
    let hobby: Hobby
    let imageName: String
}

struct LoginData {
    let userName: String
    let password: String
}

struct Hobby {
    let title: String
    let description: String
}

extension User {
    
    static func getUserInfo() -> User {
        User(
            name: "Leisan",
            surname: "Latypova",
            loginData: LoginData(
                    userName: "User",
                    password: "1234"
            ),
            hobby: Hobby(
                    title: "Изучение иностранных языков",
                    description: "Это не просто полезное хобби, а билет в новый, удивительный мир, который полон интересными знакомствами, литературой, которая не переведена на русский язык, обогащение новыми терминами даже в родном языке"
            ),
            imageName: "cat"
        )
    }
}

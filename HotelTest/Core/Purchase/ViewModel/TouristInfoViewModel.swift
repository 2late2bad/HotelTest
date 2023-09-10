//
//  TouristInfoViewModel.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation
import Combine

final class TouristInfoViewModel: ObservableObject {
    
    @Published var show: Bool
    
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var birthday: String = ""
    @Published var country: String = ""
    @Published var passport: String = ""
    @Published var periodPassport: String = ""
    
    @Published var isCorrectName = false
    @Published var isCorrectSurname = false
    @Published var isCorrectBirthday = false
    @Published var isCorrectCountry = false
    @Published var isCorrectPassport = false
    @Published var isCorrectPeriodPassport = false

    @Published var canPass = false
    @Published var showError = false
        
    private var cancellables: Set<AnyCancellable>
    
    init(show: Bool) {
        self.show = show
        cancellables = Set<AnyCancellable>()
                
        addPublishers()
    }
    
    func checkTextFields() {
        showError = true
    }
    
    private func addPublishers() {
        // Разбиты отдельно в целях возможного изменения валидации по индивидуальным условиям для каждого textfield
        $name
            .map { !$0.isEmpty }
            .assign(to: \.isCorrectName, on: self)
            .store(in: &cancellables)
        
        $surname
            .map { !$0.isEmpty }
            .assign(to: \.isCorrectSurname, on: self)
            .store(in: &cancellables)
        
        $birthday
            .map { !$0.isEmpty }
            .assign(to: \.isCorrectBirthday, on: self)
            .store(in: &cancellables)
        
        $country
            .map { !$0.isEmpty }
            .assign(to: \.isCorrectCountry, on: self)
            .store(in: &cancellables)
        
        $passport
            .map { !$0.isEmpty }
            .assign(to: \.isCorrectPassport, on: self)
            .store(in: &cancellables)
        
        $periodPassport
            .map { !$0.isEmpty }
            .assign(to: \.isCorrectPeriodPassport, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest3($isCorrectName, $isCorrectSurname, $isCorrectBirthday)
            .combineLatest(Publishers.CombineLatest3($isCorrectCountry, $isCorrectPassport, $isCorrectPeriodPassport))
            .map { nameSurnameBirthday, countryPassportPeriodPassport in
                let (name, surname, birthday) = nameSurnameBirthday
                let (country, passport, periodPassport) = countryPassportPeriodPassport
                
                return name && surname && birthday && country && passport && periodPassport
            }
            .assign(to: \.canPass, on: self)
            .store(in: &cancellables)
    }
}

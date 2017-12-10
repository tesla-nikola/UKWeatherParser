//
//  ViewController.swift
//  WeatherStatParser
//
//  Created by Soham Ray on 07/12/17.
//  Copyright © 2017 Soham Ray. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let writePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("weather.csv")
    
    var arrayOfWeatherObjects = [CSVobject]()
    var tipHead = 0
    var currentCountry = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createEmptyFile()
        downloadFileFromURL(url: arrayOfURLs[tipHead])
    }
    
    
    /// To create an empty file that is the weather.csv
    func createEmptyFile() {
        let text = "region_code,weather_param,year, key, value "
        do {
            try "\(text)\n".write(to: writePath!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
    }
    
    
    /// Downloads the text file from the URL
    ///
    /// - Parameter url: The remote url where the text files are stored
    func downloadFileFromURL(url : String) {
        let englandUrl = URL(string: url)
        Alamofire.download(englandUrl!, to : arrayOfDestUrls[tipHead]).response { (response) in
            print(response.destinationURL!.path)
            self.readFromFile(url: response.destinationURL!.path)
            self.tipHead += 1
            if self.tipHead == arrayOfURLs.count {
            } else {
                self.downloadFileFromURL(url: arrayOfURLs[self.tipHead])
            }
        }
    }
    
    /// After the file is downloaded, this methodis used to read from the file
    ///
    /// - Parameter url: local url where the file is stored
    func readFromFile(url : String) {
        let localPath = URL(fileURLWithPath: url)
        do {
            currentCountry = fetchCurrentCountry()
            let text = try NSString(contentsOf: localPath, encoding: String.Encoding.utf8.rawValue)
            /// Deleting carriage return from the rawstring file
            let something = text.replacingOccurrences(of: "\r", with: "")
            /// Breaking each the whole file in array of lines(which are string) basically
            var lineComponents = something.components(separatedBy: .newlines)
            for _ in 0...7 {
                lineComponents.removeFirst()        // removing the first 7 lines from the text file as it is unneccessary
            }
            for eachString in lineComponents {
                extractDataLineByLine(line: eachString)
            }
            
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    /// Extrating data in a meanigful way to create the desired .csv file
    ///
    /// - Parameter line: Each line containing values for each month for each year
    func extractDataLineByLine(line: String)  {
        let temporaryString = line.trimmingCharacters(in: .whitespaces)
        let sentenceComponents = temporaryString.components(separatedBy: .whitespaces)
        let year = sentenceComponents[0]
        var i = 1
        arrayOfWeatherObjects.removeAll()
        for (index,eachCompo) in sentenceComponents.enumerated() { // Enumerating through all the substrings to capture weather data
            if (eachCompo == "" || index == 0) {continue}
            arrayOfWeatherObjects.append(CSVobject(year: year, month: getMonth(month: i), temp: eachCompo == "---" ? "N/A" : eachCompo, property: fetchProperty(),country: currentCountry))
            i = i+1
        }
        guard arrayOfWeatherObjects.count != 0 else {return}
        for _ in 0...4 {
            arrayOfWeatherObjects.removeLast() // removing unwanted data like data captured during seasons
        }
        writeDateToCSV()
    }
    
    /// This method writes the data into weather.csv file in csv format
    func writeDateToCSV() {
        guard let urlPath = writePath else {
            return
        }
        for eachValue in arrayOfWeatherObjects {
            let textToWrite = "\(eachValue.country!),\(eachValue.property!),\(eachValue.year!),\(eachValue.month!),\(eachValue.temp!)\n"
            //Check if file exists
            do {
                let fileHandle = try FileHandle(forWritingTo: urlPath)
                fileHandle.seekToEndOfFile()
                fileHandle.write(textToWrite.data(using: .utf8)!)
                fileHandle.closeFile()
            } catch {
                print("Error writing to file \(error)")
            }
        }
    }
    
    
    /// Returns month name from the month number
    ///
    /// - Parameter month: month number
    /// - Returns: month name is string
    func getMonth(month: Int) -> String {
        switch month {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sept"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return "NA"
        }
    }
    
    /// Returns the weather parameter on which the data parsing is going on
    ///
    /// - Returns: The weather parameter
    func fetchProperty() -> String {
        switch tipHead%5 {
        case 0:
            return WeatherProperty.Maxtemp.rawValue
        case 1:
            return WeatherProperty.MinTemp.rawValue
        case 2:
            return WeatherProperty.MeanTemp.rawValue
        case 3:
            return WeatherProperty.Sunshine.rawValue
        case 4:
            return WeatherProperty.Rainfall.rawValue
        default:
            return "N/A"
        }
    }
    
    /// This method fetches the country name on which the current fetching and writing is going on
    ///
    /// - Returns: The country name in string
    func fetchCurrentCountry() -> String {
        switch tipHead {
        case 0...4:
            return arrayOFCountries[0]
        case 5...9:
            return arrayOFCountries[1]
        case 10...14:
            return arrayOFCountries[2]
        case 15...19:
            return arrayOFCountries[3]
        default:
            return "N/A"
        }
    }
    
}

/// The model object from on which the csv is created
struct CSVobject {
    var year : String?
    var month : String?
    var temp : String?
    var property : String?
    var country: String!
    
}

/// Enum for the weather parameters
///
/// - Maxtemp: maximum temperature
/// - MinTemp: minimum temperature
/// - MeanTemp: average temperature
/// - Sunshine: total hours of sunlight
/// - Rainfall: amount of rainfall
enum WeatherProperty : String {
    case Maxtemp = "Maxtemp"
    case MinTemp = "MinTemp"
    case MeanTemp = "MeanTemp"
    case Sunshine = "Sunshine"
    case Rainfall = "Rainfall"
}

//
//  Constants.swift
//  WeatherStatParser
//
//  Created by Soham Ray on 09/12/17.
//  Copyright © 2017 Soham Ray. All rights reserved.
//

import Foundation
import Alamofire

/// Array of urls of the text file
let arrayOfURLs = ["https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/UK.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/UK.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/UK.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/UK.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/UK.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Wales.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Wales.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Wales.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Wales.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Wales.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Scotland.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Scotland.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Scotland.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Scotland.txt",
                   "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Scotland.txt"]
/// List of constants for the local url where the text files are stored
let ukmaxTempDest:DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("ukMaxTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let ukminTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("ukMinTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let ukMeanTemp: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("ukMeanTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let uksunshineDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("ukSunshine.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let ukRainDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("ukRain.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let englandmaxTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("englandMaxTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let englandminTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("englandMinTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let englandmeanTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("englandMeanTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let englandsunshineDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("englandSunshine.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let englandRainDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("englandRain.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let walesmaxTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("walesMaxTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let walesminTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("walesMinTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let walesmeanTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("walesMeanTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let walessunshineDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("walesSunshine.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let walesRainDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("walesRain.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let scottmaxTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("scottMaxTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let scottminTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("scottMinTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let scottmeanTempDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("scottMeanTemp.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let scottsunshineDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("scottSunshine.txt")
    return (fileURL, [.createIntermediateDirectories])
}
let scottRainDest: DownloadRequest.DownloadFileDestination = { _, _ in
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent("scottRain.txt")
    return (fileURL, [.createIntermediateDirectories])
}

let arrayOFCountries = ["UK","England","Wales","Scottland"] // array of countries
let arrayOfDestUrls = [ukmaxTempDest,ukminTempDest,ukMeanTemp,uksunshineDest,ukRainDest, englandmaxTempDest,englandminTempDest,englandmeanTempDest,englandsunshineDest,englandRainDest,walesmaxTempDest,walesminTempDest,walesmeanTempDest,walessunshineDest,walesRainDest,scottmaxTempDest,scottminTempDest,scottmeanTempDest,scottsunshineDest,scottRainDest] // array of destination urlsßß

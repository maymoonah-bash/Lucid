//
//  LucidWidg.swift
//  LucidWidg
//
//  Created by Amaal on 17/06/1444 AH.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct LucidWidgEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily{
       
        case.accessoryCircular:
            ZStack{ ContainerRelativeShape().tint(.gray).cornerRadius(30)
                
                HStack{
                    Image("OnLogo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 30).frame(width: 50)
                    
                }
                
            }
            
        case.accessoryRectangular:
            ZStack{ ContainerRelativeShape().tint(.gray).cornerRadius(30)
                
                HStack{
                    Image("OnLogo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 30).frame(width: 50).frame(maxWidth: 30, alignment: .leading).padding(.leading, 1)
                    
                    Text("Lucid").foregroundColor(.black).padding()
                    
                }
                
            }
            
        default:
            
            ZStack{
                ContainerRelativeShape().fill(Color("ourBlue").gradient)
                VStack{
                    Image("logoW").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 50).frame(maxWidth: 1150, alignment: .leading)
                    
                    Text("Lucid").font(.title2).fontWeight(.bold).frame(maxWidth: 150, alignment: .leading)
                    Text("Your speech impediment helper").frame(maxWidth: 1150, alignment: .leading)
                        .font(.caption)
                }.foregroundColor(.white).padding().frame(maxWidth: 150, alignment: .leading)
            }.padding(1).background(.gray.gradient)
            
        }
        
    }
    
}

struct LucidWidg: Widget {
    let kind: String = "LucidWidg"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LucidWidgEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .systemSmall])
    }
}

struct LucidWidg_Previews: PreviewProvider {
    static var previews: some View {
        LucidWidgEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        LucidWidgEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular)).previewDisplayName("circular")
        LucidWidgEntryView(entry: SimpleEntry(date: Date()))
        .previewContext(WidgetPreviewContext(family: .accessoryRectangular)).previewDisplayName("rectangular")
    }
}

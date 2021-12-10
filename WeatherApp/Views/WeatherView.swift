
import SwiftUI 

struct WeatherView: View {
    
    let vm: WeatherInfoViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Image(systemName: vm.icon)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    Text(vm.summaryTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(vm.summaryDescription)
                        .font(.body)
                        .foregroundColor(.white)
                }
                
                Spacer()
                VStack {
                    Text(vm.temperature.formatAsTemperature())
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    
                    Text("Feels like \(vm.feelsLike.formatAsTemperature())")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color(#colorLiteral(red: 0.3411446214, green: 0.4495401382, blue: 0.9995139241, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Rohit Patil on 18/06/23.
//

import SwiftUI


struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    let image:Image
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                DescriptionView()
                    .offset(y:-40)
            }
            .edgesIgnoringSafeArea(.top)
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action:{}) {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50,corners: .topLeft)
            .frame(maxHeight:.infinity,alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackBarButtonView(action:{presentationMode.wrappedValue.dismiss()}),
                            trailing: Image("threeDot"))
    }
}
struct RoundedCorner:Shape{
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View{
    func cornerRadius(_ radius:CGFloat,corners:UIRectCorner)->some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen( image: Image("chair_1"))
    }
}
struct DescriptionView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Luxury Swedia \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing:4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading,8)
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            
            Text("Luxury Swedian Chair is a contemporary chair based on the virtus of modern craft. it carries on the simplicity and honesty of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Height: 120cm")
                        .opacity(0.6)
                    Text("Wide: 80cm")
                        .opacity(0.6)
                    Text("Diameter: 72cm")
                        .opacity(0.6)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                VStack(alignment:.leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    
                    Text("Jati Wood, Canvas,\nAmzing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
            }
            .padding(.vertical)
            
            HStack(alignment:.bottom){
                VStack(alignment:.leading){
                    Text("Colors")
                    .fontWeight(.semibold)
                    
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button(action:{}){
                            Image(systemName: "minus")
                                .padding(.all,8)
                        }
                        .frame(width:30,height:30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal,8)
                        
                        Button(action:{}){
                            Image(systemName: "plus")
                                .padding(.all,8)
                        }
                        .frame(width:30,height:30)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }

            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color:Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct CustomBackBarButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action:action) {
            Image(systemName: "chevron.backward")
                .padding(.all,12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        }
    }
}

//
//  ChatGPTView.swift
//  Influence me!
//
//  Created by I3LT-027 on 7/9/23.
//
import OpenAISwift
import SwiftUI
//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

final class ViewModel: ObservableObject{
    init(){}
    
    private var client:OpenAISwift?
    
    func setup(){
        client = OpenAISwift( config: OpenAISwift.Config.makeDefaultOpenAI(apiKey: "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"))
    }
    func send(text:String, completion:@escaping (String) -> Void ){
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result{
            case.success(let model):
                print(model)
                print(result)
                let output = model.choices?.first?.text ?? ""
                completion(output)
                print("response:"+output)
            case.failure(let error):
                print("Api error:\(error)")
                break
            }
        })
    }
}
    


struct ChatGPTView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var models = [String]()
    
    var body: some View {
        VStack(alignment:.leading){
            ForEach(models, id:\.self){string in
                Text(string)
            }
            Spacer()
            
            HStack{
                TextField("Type here...", text: $text)
                Button("Send"){
                    send()
                    
                }
            }
        }.onAppear{
            viewModel.setup()
        }.padding()
    }
    
    func send(){
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        models.append("Me: \(text)")
        viewModel.send(text: text){response in
            DispatchQueue.main.async{
                self.models.append("ChatGPT: "+response)
                self.text = ""
            }
        }
    }
}

struct ChatGPTView_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTView()
    }
}

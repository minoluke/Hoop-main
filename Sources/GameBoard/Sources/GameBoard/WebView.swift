import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap))
        webView.addGestureRecognizer(tapGesture)
        
        if let localUrl = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(localUrl, allowingReadAccessTo: localUrl.deletingLastPathComponent())
        }
        
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self, url: url)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var url: URL

        init(_ parent: WebView, url: URL) {
            self.parent = parent
            self.url = url
        }

        @objc func handleTap() {
            UIApplication.shared.open(url)
        }
    }
}

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://google.co.jp")!)
            .frame(width: 300, height: 300)
    }
}


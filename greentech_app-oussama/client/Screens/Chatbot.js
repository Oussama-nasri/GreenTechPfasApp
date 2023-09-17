import React, { useEffect } from 'react';
import { View, StyleSheet } from 'react-native';
import WebView from 'react-native-webview';

function ChatBot() {
  
    // Initialize the Botpress Web Chat
    const injectedJavaScripts = `
      window.botpressWebChat.init({
        composerPlaceholder: "Say Hello",
        botConversationDescription: "Your Guide for better better healthier and cheaper buys.",
        botId: "f3930b1f-5a17-411d-8a00-2ee2e2a9ec84",
        hostUrl: "https://cdn.botpress.cloud/webchat/v1",
        messagingUrl: "https://messaging.botpress.cloud",
        clientId: "f3930b1f-5a17-411d-8a00-2ee2e2a9ec84",
        lazySocket: true,
        botName: "Conscious Beauty Genie",
        avatarUrl: "https://postimg.cc/Yh4g6S1b",
        enableConversationDeletion: true
        hideWidget: true,
        disableAnimations: false,
      });

      window.botpressWebChat.onEvent(() => {
        window.botpressWebChat.sendEvent({ type: 'show' });
      }, ['LIFECYCLE.LOADED']);
    `;
    useEffect(() => {
    return () => {
      // Clean up the Botpress Web Chat script
      // (This is not guaranteed to run in all cases)
      const cleanupScript = `
        if (window.botpressWebChat && window.botpressWebChat.clear) {
          window.botpressWebChat.clear();
        }
      `;
      webviewRef.current?.injectJavaScript(cleanupScript);
    };
  }, []);

  const webviewRef = React.useRef(null);

  return (
    <View style={styles.container}>
      <WebView
        ref={webviewRef}
        source={{ uri: 'https://mediafiles.botpress.cloud/f3930b1f-5a17-411d-8a00-2ee2e2a9ec84/webchat/bot.html' }} // Change this to your HTML file hosting the ChatBot
        injectedJavaScript={injectedJavaScripts}
        javaScriptEnabledAndroid={true}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

export default ChatBot;

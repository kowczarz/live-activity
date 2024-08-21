import { StyleSheet, Text, View } from 'react-native';

import * as TestSample from 'test-sample';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{TestSample.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

import { Button, StyleSheet, View } from 'react-native';

import * as LiveActivity from 'test-sample';

export default function App() {
  return (
    <View style={styles.container}>
      <Button title="start activity" onPress={() => LiveActivity.createActivity()} />
      <Button title="end" onPress={() => LiveActivity.endAllActivities()} />
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

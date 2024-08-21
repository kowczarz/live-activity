import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { TestSampleViewProps } from './TestSample.types';

const NativeView: React.ComponentType<TestSampleViewProps> =
  requireNativeViewManager('TestSample');

export default function TestSampleView(props: TestSampleViewProps) {
  return <NativeView {...props} />;
}

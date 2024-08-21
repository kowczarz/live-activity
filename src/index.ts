import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to TestSample.web.ts
// and on native platforms to TestSample.ts
import TestSampleModule from './TestSampleModule';
import TestSampleView from './TestSampleView';
import { ChangeEventPayload, TestSampleViewProps } from './TestSample.types';

// Get the native constant value.
export const PI = TestSampleModule.PI;

export function hello(): string {
  return TestSampleModule.hello();
}

export async function setValueAsync(value: string) {
  return await TestSampleModule.setValueAsync(value);
}

const emitter = new EventEmitter(TestSampleModule ?? NativeModulesProxy.TestSample);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { TestSampleView, TestSampleViewProps, ChangeEventPayload };

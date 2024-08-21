import * as React from 'react';

import { TestSampleViewProps } from './TestSample.types';

export default function TestSampleView(props: TestSampleViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}

# Basic component template

```typescript
import * as React from 'react';
import { connect } from 'react-redux';
import { RouteComponentProps } from 'react-router';
import { ApplicationState } from '../store';
import * as <TemplateStore>Store from '../store/<TemplateStore>';

type <TemplateProp> =
    <TemplateStore>.CounterState &
    typeof <TemplateStore>.actionCreators &
    RouteComponentProps<{}>;

class Counter extends React.PureComponent<TemplateProp> {
    public render() {
        return (
            <React.Fragment>
                <p>Hello, World!</p>
            </React.Fragment>
        );
    }
};

export default connect(
    (state: ApplicationState) => state.counter,
    <TemplateStore>.actionCreators
)(Counter);
```
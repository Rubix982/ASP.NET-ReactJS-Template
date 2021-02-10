import React from 'react';
import { render } from '@testing-library/react';
import '@testing-library/jest-dom';
import { Provider } from 'react-redux';
import configureStore from '../store/configureStore';
import App from './../App';

// Browser history
import { createBrowserHistory } from 'history';

// History configuration
const history = createBrowserHistory();

// Get the application-wide store instance, prepopulating with state from the server where available.
const store = configureStore(history);

test('renders learn react link', () => {
    const { getByText } = render(
        <Provider store={store}>
            <App />
        </Provider>
    );

    expect(getByText(/learn/i)).toBeInTheDocument();
});

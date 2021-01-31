import 'bootstrap/dist/css/bootstrap.css';

// React imports
import React from 'react';
import ReactDOM from 'react-dom';

// Redux imports
import { Provider } from 'react-redux';

// Router module
import { Switch } from 'react-router';

// Router history
import { ConnectedRouter } from 'connected-react-router';

// Browser history
import { createBrowserHistory } from 'history';

// Store configuration
import configureStore from './store/configureStore';

// Style imports
import './styles/index.module.scss';

// Main component import
import App from './App';

// Report web vitals
import reportWebVitals from './reportWebVitals';

// Register service worker
import serviceWorker from './serviceWorker';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as _ from 'lodash';

// Testing with Hot Module Reload
import printMe from './print';

// History configuration
const history = createBrowserHistory();

// Get the application-wide store instance, prepopulating with state from the server where available.
const store = configureStore(history);

ReactDOM.render(
    <React.StrictMode>
        <Provider store={store}>
            <ConnectedRouter history={history}>
                <Switch>
                    <App />
                </Switch>
            </ConnectedRouter>
        </Provider>
    </React.StrictMode>,
    document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker();

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

/* eslint @typescript-eslint/no-unsafe-member-access: "off",
          @typescript-eslint/no-unsafe-call: "off",
          @typescript-eslint/no-unsafe-assignment: "off",
          @typescript-eslint/no-var-requires: "off"
*/
// Hot Module Replacement
declare let module: { hot: any };

if (module.hot) {
    module.hot.accept('./print.js', function () {
        console.log('Accepting the updated printMe module!');
        printMe();
    });
}

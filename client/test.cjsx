React = require('react')
ReactDOM = require('react-dom')

Test = React.createClass
  render: () ->
    return <img src="/img/unicorn.png" />

ReactDOM.render(<Test />, document.getElementById('content'))

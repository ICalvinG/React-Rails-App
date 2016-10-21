@Giphies = React.createClass
	getInitialState: ->
		giphies: @props.data
	getDefaultProps: ->
		giphies: []
	render: ->
		React.DOM.div
			className: 'giphies'
			React.DOM.h2
				className: 'title'
				'Giphies'
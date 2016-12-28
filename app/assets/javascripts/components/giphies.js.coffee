@Giphies = React.createClass
	getInitialState: ->
		giphies: @props.data
	getDefaultProps: ->
		giphies: []
	handleChange: (e) ->
		name = e.target.name
		@setState "#{ name }": e.target.value
	render: ->
		React.DOM.div
			className: 'giphies'
			React.DOM.div
				className: 'title'
				React.DOM.h4
					className: 'question'
					'What random gif would you like to see?'
					React.DOM.form
						className: 'form-inline'
						React.DOM.input
							type: 'text'
							className: 'form-control'
							placeholder: 'Gif'
							name: 'gif'
							value: @state.gif
							onChange: @handleChange
						React.DOM.button
							type: 'submit'
							className: 'btn btn-primary submit-button'
							'Enter'
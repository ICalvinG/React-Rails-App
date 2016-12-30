@Giphies = React.createClass
	getInitialState: ->
		giphies: this.props.data
	getDefaultProps: ->
		giphies: []
	handleChange: (e) ->
		name = e.target.name
		this.setState "#{ name }": e.target.value
	render: ->
		`<div className="giphies">
			<h4 className="question">
				What random gif would you like to see?
			</h4>
			<form className="form-inline" action="/giphies" method="get">
				<input type="text" className="form-control" placeholder="Gif" name="gif" value={this.state.gif} onChange={this.handleChange} />
					<button type="submit" className="btn btn-primary submit-button">
					Enter</button>
			</form>
		</div>`
import React from 'react'
import { render } from 'react-dom'

import './index.less'
class List1 extends React.Component {

	render(){
		return (
			<div className="test">
				<ul>
					<li>List Item 1</li>
					<li>List Item 2</li>
					<li>List Item 3</li>
					<li>List Item 4</li>
				</ul>
			</div>
		)
	}
}

export default List1
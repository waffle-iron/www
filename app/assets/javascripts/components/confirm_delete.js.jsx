var ConfirmDelete = React.createClass({

  propTypes: {
    delete_url: React.PropTypes.string,
    modal_id: React.PropTypes.string,
    ok_handler: React.PropTypes.func
  },

  render: function () {
    return (
        <div className="modal fade"
             id={this.props.modal_id}
             tabIndex="-1"
             role="dialog"
             aria-labelledby="myModalLabel">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 className="modal-title" id="myModalLabel">Are you sure?</h4>
              </div>
              <div className="modal-body">
                <p>Are you sure you want to delete this?</p>
              </div>
              <div className="modal-footer">
                <button onClick={this.props.ok_handler}
                        type="button"
                        className="btn btn-primary">
                  OK
                </button>
                <button type="button" className="btn btn-default" data-dismiss="modal">Cancel</button>
              </div>
            </div>
          </div>
        </div>
    );
  }
});
import React from "react";

function DeleteCompanyModal({ company, onClose, onConfirm }) {
  if (!company) return null;

  return (
    <div className="modal show d-block" style={{ backgroundColor: "rgba(0,0,0,0.5)" }}>
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title">Confirm Delete</h5>
            <button type="button" className="btn-close" onClick={onClose}></button>
          </div>
          <div className="modal-body">
            <p>Are you sure you want to delete <strong>{company.name}</strong>?</p>
          </div>
          <div className="modal-footer">
            <button className="btn btn-danger" onClick={() => onConfirm(company.id)}>
              Delete
            </button>
            <button className="btn btn-secondary" onClick={onClose}>
              Cancel
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default DeleteCompanyModal;

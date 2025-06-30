import React, { useState, useEffect } from "react";

function AddEditCompanyModal({ company, onClose, onSubmit }) {
  const [name, setName] = useState("");
  const [latitude, setLatitude] = useState("");
  const [longitude, setLongitude] = useState("");

  useEffect(() => {
    if (company) {
      setName(company.name);
      setLatitude(company.latitude);
      setLongitude(company.longitude);
    }
  }, [company]);

  function handleSubmit(e) {
    e.preventDefault();
    onSubmit({
      ...company,
      name,
      latitude,
      longitude,
    });
  }

  return (
    <div className="modal show d-block" style={{ backgroundColor: "rgba(0,0,0,0.5)" }}>
      <div className="modal-dialog">
        <form className="modal-content" onSubmit={handleSubmit}>
          <div className="modal-header">
            <h5 className="modal-title">{ company ? 'Edit' : 'Add' } Company</h5>
            <button className="btn-close" onClick={onClose}></button>
          </div>
          <div className="modal-body">
            <div className="mb-3">
              <label className="form-label">Name</label>
              <input
                id="companyName"
                type="text"
                className="form-control"
                value={name}
                onChange={e => setName(e.target.value)}
                required
              />
            </div>
            <div className="mb-3">
              <label className="form-label">Latitude</label>
              <input
                id="companyLatitude"
                type="text"
                className="form-control"
                value={latitude}
                onChange={e => setLatitude(e.target.value)}
                required
              />
            </div>
            <div className="mb-3">
              <label className="form-label">Longitude</label>
              <input
                id="companyLongitude"
                type="text"
                className="form-control"
                value={longitude}
                onChange={e => setLongitude(e.target.value)}
                required
              />
            </div>
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-secondary" onClick={onClose}>Cancel</button>
            <button type="submit" className="btn btn-primary">{ company ? 'Save Changes' : 'Add Company' }</button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default AddEditCompanyModal;

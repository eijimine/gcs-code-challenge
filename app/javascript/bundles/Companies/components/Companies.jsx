import React, { useState, useEffect } from 'react';
import axios from 'axios';
import AddEditCompanyModal from './AddEditCompanyModal';
import DeleteCompanyModal from './DeleteCompanyModal';
import Map from './Map';
import { getDistanceInMeters } from './DistanceCalculator';

function Companies(props) {
  const [companies, setCompanies] = useState([]);
  const [openAddCompanyModal, setOpenAddCompanyModal] = useState(false);
  const [companyToEdit, setCompanyToEdit] = useState(null);
  const [companyToDelete, setCompanyToDelete] = useState(null);
  const [coordinates, setCoordinates] = useState({});
  const [center, setCenter] = useState({ lat: 39.8283, lng: -98.5795 });
  const [radius, setRadius] = useState(0);
  const [companiesInRadius, setCompaniesInRadius] = useState([]);
  const [errors, setErrors] = useState([]);

  useEffect(() => {
    fetchCompanies();
  }, []);

  const fetchCompanies = () => {
    axios.get('companies/get_companies')
      .then(response => {
        setCompanies(response.data)})
  };

  function handleCloseModal() {
    setOpenAddCompanyModal(false);
    setCompanyToEdit(null);
    setCompanyToDelete(null);
  }

  const handleSave = (company) => {
    const method = openAddCompanyModal ? 'post' : 'patch';
    const url = openAddCompanyModal ? '/companies' : `/companies/${company.id}`;

    axios[method](url, {
      company: {
        name: company.name,
        latitude: company.latitude,
        longitude: company.longitude
      }
    })
    .then(() => {
      fetchCompanies();
      handleCloseModal();
    }).catch((error) => {{
      if (error.response && error.response.status === 422) {
        handleCloseModal();
        const errorMessages = error.response.data.error || {};
        setErrors(errorMessages);
        setTimeout(() => {
          setErrors({});
        }, 5000);
      };
    }});
  };

  const handleDelete = (companyId) => {
    axios.delete(`/companies/${companyId}`)
      .then(() => {
        fetchCompanies();
        handleCloseModal();
      });
  };

  const filterCompaniesByRadius = (companyList, centerPoint, rad) => {
    return companyList.filter(company => {
      const distance = getDistanceInMeters(
        centerPoint.lat,
        centerPoint.lng,
        parseFloat(company.latitude),
        parseFloat(company.longitude)
      );
      return distance <= rad;
    });
  };

  const updateFilteredCompanies = (lat, lng, radInMiles) => {
    const newCenter = { lat, lng };
    const newRadius = radInMiles * 1609.34;
  
    setCenter(newCenter);
    setRadius(newRadius);
  
    const filtered = filterCompaniesByRadius(companies, newCenter, newRadius);
    setCompaniesInRadius(filtered);
  };

  const setParams = () => {
    const { lat, lng, rad } = coordinates;
    if (lat && lng && rad) {
      updateFilteredCompanies(lat, lng, rad);
    }
  };

  useEffect(() => {
    const { lat, lng, rad } = coordinates;
    if (lat && lng && rad && radius > 0) {
      updateFilteredCompanies(lat, lng, rad);
    }
  }, [companies]);

  const companiesToDisplay = radius > 0 ? companiesInRadius : companies;
  
  return (
    <div className="container mt-5">
      <h1 className="mb-4 text-center">Companies</h1>
      <div className="mb-5">
        <Map googleMapsApiKey={props.googleMapsApiKey} companies={companiesToDisplay} center={center} radius={radius} />
        <form onSubmit={(e) => { e.preventDefault(); setParams(); }}className="p-4 border rounded bg-light">
          <div className="row mb-3">
            <div className="col-md-4">
              <label htmlFor="latitude" className="form-label">Latitude</label>
              <input
                id="latitude"
                type="number"
                step="any"
                className="form-control"
                value={coordinates.lat || ''}
                onChange={e => setCoordinates({ ...coordinates, lat: parseFloat(e.target.value)})}
              />
            </div>
            <div className="col-md-4">
              <label htmlFor="longitude" className="form-label">Longitude</label>
              <input
                id="longitude"
                type="number"
                step="any"
                className="form-control"
                value={coordinates.lng || ''}
                onChange={e => setCoordinates({ ...coordinates, lng: parseFloat(e.target.value)})}
              />
            </div>
            <div className="col-md-4">
              <label htmlFor="radius" className="form-label">Radius (miles)</label>
              <input
                id="radius"
                type="number"
                className="form-control"
                value={coordinates.rad || ''}
                onChange={e => setCoordinates({ ...coordinates, rad: parseInt(e.target.value)})}
              />
            </div>
          </div>
          <div className="d-flex justify-content-between align-items-center mt-3">
            <div className="text-muted">
              Enter Latitude, Longitude and Radius to show companies within given coordinates and radius
            </div>
            <div>
              <button className="btn btn-primary" type="submit">
                Set Params
              </button>
              <button type="button" className="btn btn-secondary ms-3" onClick={() => window.location.reload()}>
                Clear
              </button>
            </div>
          </div>
        </form>
      </div>
      {Object.keys(errors).length > 0 && (
        <div className="alert alert-danger mt-3">
          <ul>
            {Object.keys(errors).map((field, index) => (
              <li key={index}>
                <strong>{field}:</strong>
                <ul>
                  {errors[field].map((msg, msgIndex) => (
                    <li key={msgIndex}>{msg}</li>
                  ))}
                </ul>
              </li>
            ))}
          </ul>
        </div>
      )}
      <div className="container mt-4">
        <div className="d-flex justify-content-between align-items-center mb-4">
          <h2 className="mb-0">Company List</h2>
          <button
            className="btn btn-primary"
            onClick={() => setOpenAddCompanyModal(true)}
          >
            Add Company
          </button>
        </div>
        <table className="table table-sm table-hover table-striped shadow-sm">
          <thead className="table-light">
            <tr>
              <th>Company</th>
              <th>Latitude</th>
              <th>Longitude</th>
              <th className="text-center">Actions</th>
            </tr>
          </thead>
          <tbody>
            {companiesToDisplay.length === 0 ? (
              <tr>
                <td colSpan="4" className="text-center text-muted py-4">
                  No companies found.
                </td>
              </tr>
            ) : (
              companiesToDisplay.map((company) => (
                <tr key={company.id}>
                  <td>{company.name}</td>
                  <td>{company.latitude}</td>
                  <td>{company.longitude}</td>
                  <td className="text-center">
                    <button
                      className="btn btn-sm btn-outline-primary me-2"
                      onClick={() => setCompanyToEdit(company)}
                    >
                      Edit
                    </button>
                    <button
                      className="btn btn-sm btn-outline-danger"
                      onClick={() => setCompanyToDelete(company)}
                    >
                      Delete
                    </button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
        {(openAddCompanyModal || companyToEdit) && (
          <AddEditCompanyModal
            company={companyToEdit}
            onClose={handleCloseModal}
            onSubmit={handleSave}
          />
        )}
        {companyToDelete && (
          <DeleteCompanyModal 
            company={companyToDelete}
            onClose={handleCloseModal}
            onConfirm={handleDelete}
          />
        )}
      </div>
    </div>
  );
};

export default Companies;

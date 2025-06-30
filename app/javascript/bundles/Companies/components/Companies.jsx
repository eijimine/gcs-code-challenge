import React, { useState, useEffect } from 'react';
import axios from 'axios';

function Companies() {
  const [companies, setCompanies] = useState([]);

  useEffect(() => {
    fetchCompanies();
  }, []);

  const fetchCompanies = () => {
    axios.get('companies/get_companies')
      .then(response => {
        setCompanies(response.data)})
  };  

  return (
    <div className="container mt-4">
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h2 className="mb-0">Company List</h2>
        <button
          className="btn btn-primary"
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
          {companies.length === 0 ? (
            <tr>
              <td colSpan="4" className="text-center text-muted py-4">
                No companies found.
              </td>
            </tr>
          ) : (
            companies.map((company) => (
              <tr key={company.id}>
                <td>{company.name}</td>
                <td>{company.latitude}</td>
                <td>{company.longitude}</td>
                <td className="text-center">
                  <button
                    className="btn btn-sm btn-outline-primary me-2"
                  >
                    Edit
                  </button>
                  <button
                    className="btn btn-sm btn-outline-danger"
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
};

export default Companies;

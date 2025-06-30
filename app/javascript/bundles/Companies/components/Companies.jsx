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
    <div>
      Test
    </div>
  );
};

export default Companies;

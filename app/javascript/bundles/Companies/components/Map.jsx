import React from 'react';
import { GoogleMap, Marker, useJsApiLoader } from '@react-google-maps/api';

const mapContainerStyle = {
  width: '100%',
  height: '500px',
};

const center = {
  lat: 39.8283,
  lng: -98.5795,
};

function Map({ companies, googleMapsApiKey }) {
  const { isLoaded } = useJsApiLoader({
    googleMapsApiKey
  });

  if (!isLoaded) return <div>Loading Map...</div>;

  return (
    <GoogleMap
      mapContainerStyle={mapContainerStyle}
      zoom={4}
      center={center}
    >
      {companies.map((company, index) => (
        <Marker
          key={index}
          position={{
            lat: parseFloat(company.latitude),
            lng: parseFloat(company.longitude),
          }}
          label={company.name}
        />
      ))}
    </GoogleMap>
  );
}

export default Map;

import React, { useRef, useEffect } from 'react';
import { GoogleMap, Marker, useJsApiLoader, Circle } from '@react-google-maps/api';

const mapContainerStyle = {
  width: '100%',
  height: '500px',
};

function Map({ companies, googleMapsApiKey, center, radius }) {
  const mapRef = useRef(null);

  const { isLoaded } = useJsApiLoader({
    googleMapsApiKey
  });

  useEffect(() => {
    if (mapRef.current && center.lat && center.lng && radius) {
      const bounds = new window.google.maps.Circle({
        center,
        radius
      }).getBounds();
      mapRef.current.fitBounds(bounds);
    }
  }, [center, radius]);

  if (!isLoaded) return <div>Loading Map...</div>;

  return (
    <>
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        center={center}
        zoom={4.5}
        onLoad={map => (mapRef.current = map)}
      >
        {companies.map((company, index) => (
          <Marker
            key={index}
            position={{
              lat: parseFloat(company.latitude),
              lng: parseFloat(company.longitude),
            }}
            label={{
              text: company.name,
              fontSize: "12px",
              fontWeight: "normal",
              color: "black",
            }}
          />
        ))}
        <Circle
          center={center}
          radius={radius}
          options={{
            fillColor: '#007bff',
            fillOpacity: 0.2,
            strokeColor: '#007bff',
            strokeOpacity: 0.7,
            strokeWeight: 2,
          }}
        />
      </GoogleMap>
    </>
  );
}

export default Map;

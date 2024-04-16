@EndUserText.label: 'Booking Projection View'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZAP_CDS_PROJ_BOOKING_U as projection on ZAP_CDS_BOOKING_U
{
@Search.defaultSearchElement: true
  key TravelID,
      @Search.defaultSearchElement: true
  key BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Customer',
                                                   element:     'CustomerID' } } ]
      CustomerID,
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Carrier',
                                                   element:     'AirlineID' } } ]
      CarrierID,
      @Consumption.valueHelpDefinition: [ { entity: { name:    '/DMO/I_Flight',
                                                      element: 'ConnectionID' },
                                            additionalBinding: [ { localElement: 'FlightDate',
                                                                   element:      'FlightDate',
                                                                   usage: #RESULT },
                                                                 { localElement: 'CarrierID',
                                                                        element: 'AirlineID',
                                                                          usage: #RESULT },
                                                                 { localElement: 'FlightPrice',
                                                                        element: 'Price',
                                                                          usage: #RESULT },
                                                                 { localElement: 'CurrencyCode',
                                                                        element: 'CurrencyCode',
                                                                          usage: #RESULT } ]
                                            } ]
      ConnectionID,
      FlightDate,
      FlightPrice,
      @Consumption.valueHelpDefinition: [ {entity: { name:    'I_Currency',
                                                     element: 'Currency' } } ]
      CurrencyCode,
      
      /* Associations */   
      _Carrier,
      _Customer,
      _Travel : redirected to parent ZAP_CDS_PROJ_TRAVEL_U
}

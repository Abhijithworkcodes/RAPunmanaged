@EndUserText.label: 'Projection view for Booking BO'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZAP_CDS_PROJ_TRAVEL_U as projection on ZAP_CDS_TRAVEL_U
{
    key TravelID,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
      @Search.defaultSearchElement: true
      AgencyID,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'FirstName' ]
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
// inorder to show customer id with text 
      _Customer.FirstName,
      
      /* Associations */
      //ZI_RAP_TRAVEL_U_####
      _Agency,
      _Booking : redirected to composition child ZAP_CDS_PROJ_BOOKING_U,
      _Currency,
      _Customer
}

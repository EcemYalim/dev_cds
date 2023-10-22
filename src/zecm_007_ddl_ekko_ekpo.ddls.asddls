@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EKKO - EKPO CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZECM_007_DDL_EKKO_EKPO as select from ekko
                                                    inner join ekpo on ekpo.ebeln = ekko.ebeln
//                                                    left join mara on mara.matnr = ekpo.matnr
                                                    left outer join makt on  makt.matnr = ekpo.matnr
                                                                         and makt.spras = $session.system_language
                                                    left outer join lfa1 on  lfa1.lifnr = ekko.lifnr
{
    key ekpo.ebeln,
    key ekpo.ebelp,
        ekpo.matnr,
        makt.maktx,
        ekpo.werks,
        ekpo.lgort,
        ekpo.meins,
        ekko.lifnr,
        lfa1.name1,
        concat( lfa1.stras, lfa1.mcod3 ) as satici_adresi
}

view: distribution_centers {
  sql_table_name: `big-query-sales-demo.thelook_ecommerce.distribution_centers` ;;

  dimension: id {
    label: "Distribution Center ID"
    description: "Uniquely identifies a distribution center"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Distribution Center Dashboard - {{ value }}"
      url: "/dashboards/933?Distribution%20Center%20ID={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=looker.com"
    }
  }
  measure: count {
    type: count
  }

### Descriptive Fields {
  dimension: name {
    label: "Distribution Center Name"
    description: "The name of the distribution center"
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: distribution_center_location{
    description: "Latitude and Longitude of the distribution center"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
### Descriptive Fields }

### Hidden Fields {
  dimension: latitude {
    type: number
    hidden: yes
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    hidden: yes
    sql: ${TABLE}.longitude ;;
  }
### End of Hidden Fields }
}

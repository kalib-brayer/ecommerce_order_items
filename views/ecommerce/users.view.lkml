### Information on all prospects whose signed-up
view: users {
  sql_table_name: `big-query-sales-demo.thelook_ecommerce.users` ;;

  dimension: id {
    label: "User ID"
    description: "Uniquely identifies a user"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    value_format_name: id
    link: {
      label: "Users Dashboard - {{ value }}"
      url: "/dashboards/906?User%20ID={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=looker.com"
    }
  }
  measure: count {
    label: "Count Users"
    type: count
    drill_fields: [id,first_and_last_name,gender, age, street_address,city,state, postal_code]
  }
### User Demographics Fields {
  dimension: age {
    label: "Age"
    description: "Age of a user.  Use this field in questions about age that use words such as greater than, less than, over, under.  Do not pivot on this field"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tiers {
    label: "Segmented Age Groupings"
    description: "Buckets ages for grouped analysis.  Include this field in questions about buying behavior or questions about age profile or age groupings"
    type: tier
    tiers: [18,25,40,60]
    style: integer
    sql: ${age} ;;
    tags: ["Demographics"]
    drill_fields: [gender, country]
  }

  dimension: gender {
    type: string
    description: "gender of a user,customer,client"
    tags: ["Demographics, sex, males and females,men,women,customer base,identities"]
    sql: ${TABLE}.gender ;;
  }
### End of Profile Fields }

### User Location Fields {
  dimension: user_location {
    group_label: "Locations"
    label: "User_Location"
    description: "The latitude and longitude of a user.  use with map viz only.  use on geographical questions about users"
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude} ;;
  }
  dimension: country {
    group_label: "Locations"
    label: "Country"
    description: "Country of user, customers, client.  Use in map or table viz only.  Geographical info"
    tags: ["Demographics"]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    drill_fields: [state, city, postal_code, gender,products.brand, products.category]
  }
  dimension: city {
    group_label: "Locations"
    label: "City"
    description: "City of user, customers, client.  Use in map or table viz only.Geographical info"
    tags: ["Location"]
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [gender,products.brand, postal_code]
  }
  dimension: postal_code {
    group_label: "Locations"
    label: "Postal Code"
    description: "User's postal code"
    type: string
    sql: ${TABLE}.postal_code ;;
    drill_fields: [gender,products.brand, street_address]
  }
  dimension: street_address {
    group_label: "Locations"
    label: "Street Address"
    tags: ["Location"]
    description: "User's street address"
    type: string
    sql: ${TABLE}.street_address ;;
  }
### End of User Location Fields }

### Date Fields {
  dimension_group: created {
    label: "User Sign-up"
    description: "Timeframes of when a user signed-up"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    drill_fields: [time_drill_set*]
  }
### End of Date Fields }

### Parameter example{
  parameter: user_attributes_parameter{
    type: unquoted
    allowed_value: {
      label: "Country"
      value: "country"
    }
    allowed_value: {
      label: "City"
      value: "city"
    }
    allowed_value: {
      label: "Gender"
      value: "gender"
    }
    allowed_value: {
      label: "Age Tiers"
      value: "agetiers"
    }
    allowed_value: {
      label: "Traffic Source"
      value: "trafficsource"
    }
  }
  dimension: dynamic_user_attributes {
    label_from_parameter: user_attributes_parameter
    sql:
    {% if user_attributes_parameter._parameter_value == 'country' %}
      ${country}
    {% elsif user_attributes_parameter._parameter_value == 'city' %}
      ${city}
      {% elsif user_attributes_parameter._parameter_value == 'gender' %}
      ${gender}
      {% elsif user_attributes_parameter._parameter_value == 'agetiers' %}
      ${age_tiers}
      {% elsif user_attributes_parameter._parameter_value == 'trafficsource' %}
      ${traffic_source}
    {% else %}
      ${country}
    {% endif %};;
  }
### }


  dimension: traffic_source {
    label: "Traffic Source"
    description: "The source that drove users to sign-up"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  ### Hidden Fields {
  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.first_name ;;
  }
  dimension: last_name {
    type: string
    hidden: yes
    sql: ${TABLE}.last_name ;;
  }
  dimension: latitude {
    type: number
    hidden: yes
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    hidden: yes
    sql: ${TABLE}.longitude ;;
  }
  dimension: first_and_last_name {
    # required_access_grants: [admin_only]
    label: "Customer Full Name"
    description: "Full name of a user.  Include this field in questions about a specific customer.  Only use this field in a table viz"
    type: string
    # hidden: yes
    sql: concat( ${first_name}," ", ${last_name}) ;;
    action:  {
      label: "Send User Gift Certificate"
      url: "https://example.com/posts"
      icon_url: "https://looker.com/favicon.ico"
      #form_url: "https://example.com/ping/{{ value }}/form.json"
      # param: {
      #    name: "name string"
      #    value: "value string"
      #  }
      form_param: {
        name:  "Amount"
        type: string
        label:  "Amount"
        required:  no
        description:  "Amount to send"
        default:  "$100"
      }
      form_param: {
        name:  "Note"
        type: textarea
        label:  "Note to User"
        required:  no
        description:  "Note to User"
        default:  "Thanks your for being a loyal customer.  Attached, please find your gift certificate"
      }
    }
  }
  dimension: state {
    group_label: "Locations"
    description: "Geographical info"
    tags: ["Location,area,region,different parts of the country"]
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [geographical_drill_set*]
  }


  # measure: count_cities {
  #   type: count_distinct
  #   sql: ${city} ;;
  # }

  set: geographical_drill_set{
    fields: [city,postal_code,user_location]
  }

  set: time_drill_set{
    fields: [created_year, created_quarter,created_month,created_week,created_date,created_time,created_raw]
  }

  ### End of Hidden Fields }

}

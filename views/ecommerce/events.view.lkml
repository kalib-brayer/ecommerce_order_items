view: events {
  sql_table_name: `big-query-sales-demo.thelook_ecommerce.events` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: viewed_product_id {
    label: "Product ID"
    description: "The product ID of the product a vistior is viewing"
    type: string
    sql: cast(if(${event_type} = "product", substr(${uri},10), null) as numeric) ;;
  }
  measure: count {
    type: count
  }
### Base Table Fields{
  dimension: browser {
    description: "The browser the visitor entered the site from"
    type: string
    sql: ${TABLE}.browser ;;
  }
  dimension_group: created {
    description: "The start time of entering a new page on the website"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: sequence_number {
    description: "The sequence number in a session depicted by a new event type"
    type: number
    sql: ${TABLE}.sequence_number ;;
  }
  dimension: session_id {
    description: "Uniquely identifies a new session"
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: traffic_source {
    description: "The source the user came from before entering the website"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: uri {
    description: "The actions taken in a website page/event type"
    type: string
    sql: ${TABLE}.uri ;;
  }
  dimension: user_id {
    description: "Uniquely identifies a user"
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
### }
### Session Fields {
  measure: count_unique_sessions {
    description: "Counting the number of unique session id's"
    type: count_distinct
    sql: ${session_id} ;;
    value_format_name: decimal_0
  }
  measure: avg_pages_per_session{
    label: "Average Pages Per Session"
    description: "Average amount of pages they flip between during a session"
    type: number
    sql: ${count}/nullif(${count_unique_sessions}) ;;
  }
###}
### Event type fields {
  dimension: event_type {
    description: "The website page type the user is currently on"
    type: string
    sql: ${TABLE}.event_type ;;
  }
  measure: number_of_product_pages{
    label: "Number of product pages"
    description: "Counts the number of times an someone was on a product page"
    type: count
    filters: [event_type: "product"]
  }
  measure: number_of_cart_pages{
    label: "Number of cart pages"
    description: "Counts the number of times an someone was on a cart page"
    type: count
    filters: [event_type: "cart"]
  }
  measure: number_of_purchases {
    description: "Count of Events where Event Type is equal to 'Purchase'"
    type: count
    filters: [event_type: "purchase"]
  }
  measure: cart_conversion {
    label: "Cart conversion"
    description: "The percent of sessions that ended in a customer getting to a cart page"
    type: number
    value_format_name: percent_2
    sql: 1.0 *  ${number_of_cart_pages} / nullif(${count_unique_sessions},0);;
  }
  measure: purchase_conversion {
    label: "Purchase conversion"
    description: "The percent of sessions that ended in a customer purchasing an item"
    type: number
    value_format_name: percent_2
    sql: 1.0 *  ${number_of_purchases} / nullif(${count_unique_sessions},0);;
  }
  ### }
### Duration of sessions NDT fields {
  measure: start_of_session{
    description: "The first timestamp of the events view"
    hidden: yes
    type: date
    sql: min(${created_raw}) ;;
  }
  measure: end_of_session {
    hidden: yes
    description: "The last timestamp of the events view"
    type: date
    sql: max(${created_raw}) ;;
  }
### }
### Location Fields {
  dimension: state {
    description: "The state the visitor is viewing the website"
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: postal_code {
    description: "The postal code the visitor is viewing the website"
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: ip_address {
    description: "The IP address the visitor is viewing the website"
    type: string
    sql: ${TABLE}.ip_address ;;
  }
  dimension: city {
    description: "The city the visitor is viewing the website"
    type: string
    sql: ${TABLE}.city ;;
  }
### }













}

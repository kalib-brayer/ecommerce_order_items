view: abandoned_cart_info {
  derived_table: {
    explore_source: events {
      column: session_id {}
      column: id {}
      column: sequence_number {}
      column: event_type {}
      derived_column: following_event_type {
        sql: LEAD(event_type) OVER (PARTITION BY session_id ORDER BY sequence_number asc) ;;
      }
    }
  }
  dimension: id {
    primary_key: yes
    hidden: yes
    description: ""
    type: number
  }
  dimension: following_event_type {
    description: "The next event type in the sequence of a session"
    type: string
  }
  ### Abandoned Cart Fields {
  dimension: abandoned_cart {
    description: "A cart that doesn't have a purchase action afterwards"
    type: yesno
    sql: ${event_type} = "cart" and ${following_event_type} != "purchase";;
  }
  measure: count_abandoned_cart {
    description: "Counts the number of rows where there is an abandoned cart"
    type: count
    filters: [abandoned_cart: "yes"]
  }
  measure: abandoned_cart_rate {
    description: "The percent a session ends with an abandoned cart"
    type: number
    value_format_name: percent_0
    sql: ${count_abandoned_cart} / nullif(${count_session_id},0) ;;
  }
  ### }

  ### Hidden fields {
  measure: count_session_id {
    type: count_distinct
    hidden: yes
    sql: ${session_id} ;;
  }
  dimension: session_id {
    hidden: yes
    description: "Uniquely identifies a new session"
  }
  dimension: sequence_number {
    hidden: yes
    description: "The sequence number in a session depicted by a new event type"
    type: number
  }
  dimension: event_type {
    hidden: yes
    description: "The website page type the user is currently on"
  }
  ### }













}

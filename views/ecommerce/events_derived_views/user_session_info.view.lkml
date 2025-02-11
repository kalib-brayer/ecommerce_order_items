view: user_session_info {
  derived_table: {
    explore_source: events {
      column: user_id {}
      column: count_unique_sessions {}
      column: number_of_purchases {}
    }
  }
  dimension: user_id {
    primary_key: yes
    description: "Uniquely identifies a user"
    type: number
  }
  dimension: count_unique_sessions {
    description: "Counting the number of unique session id's"
    value_format: "#,##0"
    type: number
  }
  dimension: number_of_purchases {
    description: "Count of Events where Event Type is equal to 'Purchase'"
    type: number
  }
#### Returning visitor and customer{
  dimension: is_returning_visitor {
    description: "A user has been to the website more than once"
    type: yesno
    sql: ${count_unique_sessions} > 1 ;;
  }
  dimension: is_returning_customer {
    description: "A user who has more than one purchase "
    type: yesno
    sql: ${number_of_purchases} > 1 ;;
  }
  measure: count_of_returning_visitors{
    type: count
    filters: [is_returning_visitor: "yes"]
  }
  measure: count_of_returning_customers{
    type: count
    filters: [is_returning_customer: "yes"]
  }
  ####}
  ### derived fields {
  dimension: session_tiers {
    label: "Session Tiers"
    description: "Groups users by how many times they've had a session on the website"
    type: tier
    style: integer
    tiers: [3,7]
    sql: ${count_unique_sessions} ;;
  }
  dimension: purchase_tiers {
    label: "Purchase Tiers"
    description: "Groups users by how many times they've had a purchase"
    type: tier
    style: integer
    tiers: [3,7]
    sql: ${number_of_purchases} ;;
  }
  ###}





}

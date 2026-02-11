view: orders {
  sql_table_name: `big-query-sales-demo.thelook_ecommerce.orders` ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
    value_format: "######"
    description: "identifies an order.  Use this field when a user asks questions about the identity of an order"
  }
  dimension: num_of_item {
    label: "Number of Order Items"
    description: "Number of items in an order"
    type: number
    sql: ${TABLE}.num_of_item ;;
  }
  dimension_group: created {
    label: "Order sold"
    description: "Timeframes an order was sold"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: returned {
    label: "Order Return"
    description: "Timeframe an order was returned"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: status {
    label: "Order Status"
    description: "The current status of the order."
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    label: "User ID"
    description: "Uniquely identifies a user"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    hidden: yes
    label: "Count Orders"
    type: count
    drill_fields: [order_id, created_date, delivered_date,status, sers.first_and_last_name,gender, users.city,ussers.state, users.country, num_of_item]
  }
  measure: count_of_customers {
    sql: ${user_id} ;;
    description: "Distinct count number of customers.  Use this field for common questions such as:
    How many people have shopped with us?
    What’s the total client base we have?
    How many unique buyers do we have in the system?
    Can you tell me the size of our customer base?"
    tags: ["Customer Volume, Customer Base Size, Total Customers, number of users"]
    type: count_distinct
  }
  measure: count_of_orders {
    type: count_distinct
    sql: ${order_id} ;;
    description: "count of distinct orders"
    tags: ["Completed Orders, Number of Orders,Order Frequency,Order Quantity,Total Orders,Purchase Count,Sales Transactions,Transaction Count,Order Total"]
  }
  measure: sum_num_of_orders {
    label: "Items in Order"
    description: "Number of items in an order. Use this field for questions related to count of items."
    type: sum
    sql: ${num_of_item} ;;
  }


### Hidden Fields {
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    hidden: yes
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: gender {
    type: string
    hidden: yes
    sql: ${TABLE}.gender ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    hidden: yes
    sql: ${TABLE}.shipped_at ;;
  }
  ### End of Hidden Fields }
}

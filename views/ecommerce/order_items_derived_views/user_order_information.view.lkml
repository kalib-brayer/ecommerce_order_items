view: user_order_information {
  derived_table: {
    explore_source: order_items {
      column: id { field: users.id }
      column: total_sales {}
      column: count_of_orders { field: orders.count_of_orders }
    }
    # datagroup_trigger: daily
  }
  dimension: id {
    primary_key: yes
    type: number
  }
  dimension: is_multi_purchase_customer {
    type: yesno
    sql: ${count_of_orders} > 1 ;;
  }
  dimension: is_big_spender {
    type: yesno
    sql: ${total_sales} > 200 ;;
  }
  dimension: total_sales {
    type: number
    value_format_name: usd_0
  }
  dimension: count_of_orders {
    type: number
  }
  dimension: customer_order_tier {
    type: string
    sql: CASE
          When ${count_of_orders} = 1 then "Single Purchase Customer"
          When ${count_of_orders} > 1 then "Multi Purchase Customer"
          else "No Purchase Customer"
          end ;;
    description: "Buckets customers based on number of purchases into no purchases, single purchase, multiple purchases purchases.  Use this field with count of customers or total sales."
  }
  dimension: user_spend_buckets{
    type: string
    sql: Case
              when ${total_sales} > 200 then "Big Spender"
                  else "Small Spender"
            end;;
    description: "Determines if customer is a small or big spender.  Use this field for pivots."

  }
  measure: sum_lifetime_sales{
    description: "Sums all users total sales"
    type: sum
    sql: ${total_sales} ;;
    value_format_name: usd_0
  }
  measure: count_single_purchase_customer {
    type: count
    filters: [customer_order_tier: "Single Purchase Customer"]
  }
  measure: count_multi_purchase_customer {
    type: count
    filters: [customer_order_tier: "Multi Purchase Customer"]
  }
  measure: percent_of_repeat_customers {
    type: number
    description: "this field is a percentage of total customers who have returned or made multiple purchaeses.   Use this field for question like:
    What percentage of buyers came back to shop again?
    How often do customers come back to make another purchase?"
    value_format_name: percent_0
    sql: ${count_multi_purchase_customer}/nullif(${count},0) ;;
  }
  measure: percent_of_one_time_customers {
    description: "this field is a percentage of total customers who have made only 1 purchase."
    type: number
    value_format_name: percent_0
    sql: ${count_single_purchase_customer}/nullif(${count},0) ;;
  }

  measure: count {
    type: count
  }
  measure: min_lifetime_sales {
    label: "Minimum Lifetime Sales"
    description: "The lowest lifetime revenue from all users"
    type: min
    sql: ${total_sales} ;;
    value_format_name: usd
  }
  measure: median_lifetime_sales{
    label: "Median Lifetime Sales"
    description: "The median lifetime revenue from all users"
    type: median
    sql: ${total_sales} ;;
    value_format_name: usd
  }
  measure: max_lifetime_sales {
    label: "Maximum Lifetime Sales"
    description: "The highest lifetime revenue from all users"
    type: max
    sql: ${total_sales} ;;
    value_format_name: usd
  }
  measure: 75th_percentile_lifetime_sales {
    label: "75th Percentile Lifetime Sales"
    description: "The average between maximum and average lifetime revenue from all users"
    type: percentile
    percentile: 75
    sql: ${total_sales};;
    value_format_name: usd
  }
  measure: 25th_percentile_lifetime_sales{
    label: "25th Percentile Lifetime Sales"
    description: "The average between minimum and average lifetime revenue from all users"
    type: percentile
    percentile: 25
    sql: ${total_sales} ;;
    value_format_name: usd
  }
  measure: avg_lifetime_sales {
    label: "Average Lifetime Sales"
    description: "Average lifetime sales of all users"
    type: average
    sql: ${total_sales} ;;
    value_format_name: usd
  }
}

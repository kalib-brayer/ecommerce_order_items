### Per order item and context around when, what, and how.
# include: "/views/added_views/period_comparison.view.lkml"
view: order_items {
  sql_table_name: `big-query-sales-demo.thelook_ecommerce.order_items` ;;
  # extends: [period_comparison]
  # extension: required


# Auto-populated dimensions from project connection {
  dimension: product_id {
    label: "Product ID"
    description: "Uniquely describe a product with a number identifier"
    type: number

    sql: ${TABLE}.product_id ;;
  }
  dimension: inventory_item_id {
    label: "Inventory Item ID"
    description: "Uniquely describe a inventory item with a number identifier"
    type: number

    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: id {
    label: "Order Item ID"
    description: "Uniquely identifies each sold item"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: order_id {
    label: "Order ID"
    description: "Uniquely identifies each purchase"
    type: number

    sql: ${TABLE}.order_id ;;
    drill_fields: [id]
  }
  dimension: user_id {
    label: "Customer ID"
    description: "Uniquely identifies each customers"
    type: number
    #
    sql: ${TABLE}.user_id ;;
    drill_fields: [order_id, id]
  }
  dimension_group: created {
    label: "Item Paid"
    description: "Date and timestamp for orders placed.  Use this date field in order related date filters and date pivots and relative date comparisions.
    This is the most popular date field for queries related to orders, order items, and purchases for Explore Assistant."
    tags: ["purchase date, order date, placed date, paid date"]
    type: time
    timeframes:  [raw, time, date, week, month,month_num,month_name,hour_of_day,day_of_week,day_of_week_index,day_of_month,day_of_year,year,quarter]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: returned {
    label: "Item Returned"
    description: "The timeframe an item was returned"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension_group: shipped {
    label: "Item Shipped"
    description: "The timeframe an item was shipped"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension_group: delivered {
    label: "Item Delivered"
    description: "The timeframe an item was delivered to a customer"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  ### Auto-populated dimensions from project connection }

# To date example dashboard's lookml {

  # Use Case Problem: User selects a date. Based on the date selected, the report has to display the number of items sold;
  # for that date, month to that date using physical calendar, quarter to that date using physical calendar, and life to that date.
  # How does it work? End user selects a date on the date selector and sql statements update information to the date parameter

  parameter: date_selector {
    type: date
    description: "Date selector enables an end user to select any date on a calendar format. Use this parameter to manipulate the count of items on the date,
    month to date, quarter to date, and life to date"
  }
  dimension: is_created_on_date {
    group_label: "Date Selector Objects"
    description: "This dimension returns yes if the item's sale date equals the date in the date selector parameter."
    type: yesno

    sql: ${created_date} = DATE({% parameter date_selector%});;
  }
  dimension: is_created_mtd {
    group_label: "Date Selector Objects"
    description: "This dimension returns yes if the item's sale date is between the first day of the month, in the date selected, and the date selected."
    type: yesno

    sql: ${created_date} between DATE(date_trunc({% parameter date_selector%}, month)) and DATE({% parameter date_selector%});;
  }
  dimension: is_created_qtd {
    group_label: "Date Selector Objects"
    description: "This dimension returns yes if the item's sale date is between the first day of the quarter, in the date selected, and the date selected."
    type: yesno

    sql: ${created_date} between DATE(date_trunc({% parameter date_selector%}, quarter)) and DATE({% parameter date_selector%});;
  }
  dimension: is_created_ltd{
    group_label: "Date Selector Objects"
    description: "This dimension returns yes if the item's sale date is before and equal to the date selected"
    type: yesno

    sql: ${created_date} <= DATE({% parameter date_selector%});;
  }
  measure: count_items_on_date {

    group_label: "Date Selector Objects"
    label: "Count items on date"
    description: "This measure returns the count of items sold on the date selected by the date selector"
    type: count
    filters: [is_created_on_date: "yes"]
  }
  measure: count_items_mtd {

    group_label: "Date Selector Objects"
    label: "Count items Month to date"
    description: "This measure returns the count of items sold month to date on the date of the date selector."
    type: count
    filters: [is_created_mtd: "yes"]
  }
  measure: count_items_qtd {

    group_label: "Date Selector Objects"
    label: "Count items Quarter to date"
    description: "This measure returns the count of items sold quarter to date on the date of the date selector."
    type: count
    filters: [is_created_qtd: "yes"]
  }
  measure: count_items_ltd {

    group_label: "Date Selector Objects"
    label: "Count items Life to date"
    description: "This measure returns the count of all items sold before and equal to the date of the date selector"
    type: count
    filters: [is_created_ltd: "yes"]
  }

  # Use Case: the end user wants to compare ytd to last ytd but on a date they've selected
  # Solution: end users can use the date parameter to choose a date, which creates this ytd and last ytd on the date they've selected
  dimension: is_created_this_ytd {
    group_label: "Date Selector Objects"
    description: "This dimension returns yes if the item's sale date is between the first day of the year, in the date selected, and the date selected."
    type: yesno

    sql: ${created_date} between DATE(date_trunc({% parameter date_selector%}, year)) and DATE({% parameter date_selector%});;
  }
  dimension: is_created_last_ytd {
    group_label: "Date Selector Objects"
    description: "This dimension returns yes if the item's sale date is between the first day of last year, in the date selected, and last year's date of the date selected"
    type: yesno

    sql: ${created_date} between DATE_SUB(date_trunc(date({% parameter date_selector%}), year), INTERVAL 1 YEAR)
          and
          DATE_SUB(DATE({% parameter date_selector%}), INTERVAL 1 YEAR) ;;
  }

  measure: total_final_sale_this_ytd{

    label: "Sales This YTD"
    description: "Sums the sale price of all items past their return date, not returned, and is in the YTD of the date selected"
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd_0
    filters: [is_past_return_policy: "yes", is_returned: "no", is_created_this_ytd: "yes"]
  }
  measure: total_final_sale_last_ytd{
    label: "Sales Last YTD"
    description: "Sums the sale price of all items past their return date, not returned, and is in the last YTD of the date selected"
    type: sum
    sql: ${sale_price} ;;

    value_format_name: usd_0
    filters: [is_past_return_policy: "yes", is_returned: "no", is_created_last_ytd: "yes"]
  }
  measure: percent_change_yoy {

    label: "% Change YOY"
    description: "Returns the percentage increase or decrease of sales from last YTD based on the date selected"
    type: number
    value_format_name: percent_0
    sql: (${total_final_sale_this_ytd} - ${total_final_sale_last_ytd})/ ${total_final_sale_last_ytd} ;;
  }
  # Date parameter manipulating sql statement demo }

  measure: total_sales {
    group_label: "Sales Fields"
    label: "Total Sales"
    description: "Sum of all item's sale price.  This field is in US dollars.  Use this field when a user asks a questions with a dollar amount.
    Use this field for questions on best performance, best sellers,highest performing, lowest peforming, worst performance, worst selling.  Amount spent by the customer."

    tags: ["Total Revenue, Total Sales Price, Sales Amount, Order Value, Total Amount,Total Spend,customer lifetime value,
    invoice amount, and Transaction Total"]
    type: sum
    sql: ${sale_price} ;;
    drill_fields: [users.id,users.first_and_last_name,id,products.brand,distribution_centers.id, created_date,
      sale_price,]
    value_format_name: usd_0
  }


  measure: average_order_value {
    type: number
    label: "AOV"
    description: "average value per order.  Typical questions include: What’s the typical amount customers spend per order?
    How much do people usually buy in a single transaction?
    What is the average amount spent on each purchase?
    How big is the typical order in dollar value?
    What’s the usual value of a customer’s order?
    Are customers spending more or less per order lately?
    How much do customers usually pay per checkout?
    What’s the average size of the orders we receive?
    Is the amount customers spend per purchase increasing?
    How much revenue do we get on average from each sale?"
    tags: ["Mean Order Value, Average Transaction Value, Order Average, Average Purchase Value,Per-Order Value,Transaction Average,Mean Purchase Size
    ,Order Size Average,Revenue per Order (RPO),Purchase Amount Average"]
    sql: ${total_sales} / nullif(${count_all_orders},0) ;;
  }


# Liquid changing the visual appearance of field values
  dimension: status {
    tags:["default_filter: app-test"]
    # label: "Order Item Status"
    description: "The current status of the order item. (Shipped, Cancelled, Complete, Processing, Returned)"
    type: string
    sql: ${TABLE}.status ;;
    html: {% if value == 'Complete' %}
          <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>

      {% elsif value == 'Shipped' %}
      <p style="color: black; background-color: yellow; font-size:100%; text-align:center">{{ rendered_value }}</p>

      {% elsif value == 'Processing' %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>

      {% else %}
      <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
      {% endif %}
      ;;
  }

# Cascading logic Demo {
  dimension: sale_price {
    label: "Sales Price"
    description: "The price the item sold for"
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd_0
  }

  dimension: is_returned {
    group_label: "Status Fields"
    label: "Is Returned"
    description: "Whether an order item was returned(Yes) or not returned(No)"
    type: yesno
    sql: ${status} = "Returned" ;;
  }
  dimension: is_past_return_policy{
    label: "Is past 30 Day Return Policy"
    description: "Flags whether an item has been delivered for 30 days, used for our company's return policy"
    type: yesno
    sql: ${created_date} < DATE_SUB(CURRENT_DATE,INTERVAL 30 DAY) ;;
  }

  measure: total_of_final_sales{
    group_label: "Sales Fields"
    label: "Final Sales Total"
    description: "Sums sale price of items past the return policy and not returned"
    type: sum
    sql: ${sale_price} ;;
    filters: [is_past_return_policy: "yes", is_returned: "no"]
    value_format_name: usd_0
  }
# Cascading logic Demo }

# Count Fields {
  measure: count {
    group_label: "Count Fields"
    type: count
  }
  measure: count_all_orders {
    group_label: "Count Fields"
    label: "Count Unique Orders"
    description: "Counts the number of unique orders"
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: num_order_items_per_order {
    type: number
    sql: ${count}/${count_all_orders} ;;
  }

  measure: count_order_id_complete {
    group_label: "Count Fields"
    label: "Count Completed Orders"
    description: "Counts the number of completed, unique orders"
    type: count_distinct
    filters: [status: "Complete"]
    sql: ${order_id} ;;
  }

###################################################################################################
#######       Adding Dynamic Measure + Parameter to train the Explore Assistant             #######
###################################################################################################

  parameter: dynamic_count_field {
    group_label: "Count Fields"
    type: unquoted
    allowed_value: {
      label: "Count"
      value: "count"
    }
    allowed_value: {
      label: "Count Unique Orders"
      value: "count_all_orders"
    }
    allowed_value: {
      label: "Count Completed Orders"
      value: "count_order_id_complete"
    }
  }

  measure: dynamic_count_measure {
    label_from_parameter: dynamic_count_field
    group_label: "Count Fields"
    type: number
    sql:
      {% if dynamic_count_field._parameter_value == "count" %} ${count}
      {% elsif dynamic_count_field._parameter_value == "count_all_orders" %} ${count_all_orders}
      {% else %} ${count_order_id_complete}
      {% endif %} ;;
  }

### additional dynamic measure including dynamic number formatting to mix counts, totals, or currencies ###
  # measure: dynamic_measure {
  #   label_from_parameter: dynamic_count_field
  #   type: number
  #   sql:
  #     {% if dynamic_count_field._parameter_value == "count" %} ${count}
  #     {% elsif dynamic_count_field._parameter_value == "count_all_orders" %} ${count_all_orders}
  #     {% else %} ${count_order_id_complete}
  #     {% endif %};;
  #   html:
  #     {% if dynamic_count_field._parameter_value == "count" %} {{ count._rendered_value }}
  #     {% elsif dynamic_count_field._parameter_value == "count_all_orders" %} {{ count_all_orders._rendered_value }}
  #     {% else %} {{ count_order_id_complete._rendered_value }}
  #     {% endif %} ;;
  # }

### Count Fields }

# Status Fields {
  dimension: is_cancelled {
    group_label: "Status Fields"
    label: "Is Cancelled"
    description: "Whether an order item was cancelled(Yes) or not cancelled(No)"
    type: yesno
    sql: ${status} = "Cancelled" ;;
  }
  dimension: is_complete {
    group_label: "Status Fields"
    description: "Order Items that are complete, meaning payment is fully processed,
    item was delivered, wasnt cancelled, and hasn't been returned"
    type: yesno
    sql: ${status} = "Complete";;
  }
### Status fields }

# POP analysis {
  parameter: select_timeframe {

    type: unquoted
    default_value: "month"
    allowed_value: {
      value: "year"
      label: "Years"
    }
    allowed_value: {
      value: "month"
      label: "Months"
    }
    allowed_value: {
      value: "week"
      label: "Weeks"
    }
    allowed_value: {
      value: "day"
      label: "Days"
    }

  }

  parameter: select_reference_date {
    type: date

    convert_tz: no
  }


  dimension_group: current_timestamp {

    type: time
    datatype: date
    timeframes: [raw,date,hour_of_day,day_of_week_index,day_of_month,day_of_year]
    convert_tz: no
    sql:  CURRENT_TIMESTAMP() ;;
  }

  dimension: current_vs_previous_period_bigquery {

    label: "Current_vs_Previous_Period"
    description: "Use this dimension along with \"Select Timeframe\" Filter"
    type: string
    sql:
    CASE
      WHEN DATE_TRUNC(DATE(${created_date}),  {% parameter select_timeframe %}) = DATE_TRUNC({% if select_reference_date._is_filtered %}DATE({% parameter select_reference_date %}) {% else %} DATE(current_date()){% endif %}, {% parameter select_timeframe %})
        THEN '{% if select_reference_date._is_filtered %}Reference {% else %}Current {% endif %} {% parameter select_timeframe %}'
      WHEN DATE(DATE_TRUNC(${created_date},  {% parameter select_timeframe %})) = DATE_TRUNC(DATE_SUB({% if select_reference_date._is_filtered %}DATE({% parameter select_reference_date %}) {% else %} DATE(current_date()) {% endif %}, INTERVAL 1 {% parameter select_timeframe %}), {% parameter select_timeframe %})
        THEN "Previous {% parameter select_timeframe %}"
      ELSE NULL
    END
    ;;
  }

  dimension: selected_dynamic_day_of  {

    label: "{%
    if select_timeframe._is_filtered and select_timeframe._parameter_value == 'month' %}Day of Month{%
    elsif select_timeframe._is_filtered and select_timeframe._parameter_value == 'week' %}Day of Week{%
    elsif select_timeframe._is_filtered and select_timeframe._parameter_value == 'day' %}Hour of Day{%
    elsif select_timeframe._is_filtered and select_timeframe._parameter_value == 'year' %}Months{%
    else %}Selected Dynamic Timeframe Granularity{%
    endif %}"
    order_by_field: selected_dynamic_day_of_sort
    type: string
    sql:
    {% if select_timeframe._parameter_value == 'day' %}
      ${created_hour_of_day}
    {% elsif select_timeframe._parameter_value == 'week' %}
      ${created_day_of_week}
    {% elsif select_timeframe._parameter_value == 'year' %}
      ${created_month_name}
    {% else %}
      ${created_day_of_month}
    {% endif %}
    ;;
  }

  dimension: selected_dynamic_day_of_sort  {
    type: number

    sql:
    {% if select_timeframe._parameter_value == 'day' %}
      ${created_hour_of_day}
    {% elsif select_timeframe._parameter_value == 'week' %}
      ${created_day_of_week_index}
    {% elsif select_timeframe._parameter_value == 'year' %}
      ${created_month_num}
    {% else %}
      ${created_day_of_month}
    {% endif %}
    ;;
  }

  dimension: selected_dynamic_date {
    sql:
    {% if select_timeframe._parameter_value == 'day' %}
      ${created_date}
    {% elsif select_timeframe._parameter_value == 'week' %}
      ${created_week}
    {% elsif select_timeframe._parameter_value == 'month' %}
      ${created_month}
    {% elsif select_timeframe._parameter_value == 'year' %}
      ${created_year}
    {% else %}
      ${created_date}
    {% endif %};;
  }

  parameter: apply_to_date_filter {
    type: yesno

    default_value: "false"
  }



  dimension: is_to_date {


    type: yesno
    sql:
      {% if apply_to_date_filter._parameter_value == 'true' %}

                          {% if select_timeframe._parameter_value == 'day' %}
                            ${created_hour_of_day} <=${current_timestamp_hour_of_day}
                          {% elsif select_timeframe._parameter_value == 'year' %}
                            ${created_day_of_year} <= ${current_timestamp_day_of_year}
                          {% else %}
                            ${created_day_of_month} <= ${current_timestamp_day_of_month}
                          {% endif %}
                        {% else %} true
                        {% endif %}
                      ;;
  }

  ### End of PoP Analysis }

# Business pulse fields {
  measure: average_sale_price {
    group_label: "Sales Fields"
    label: "Average Sale Price"
    description: "Averages all item's sale price"
    type: average
    value_format_name: usd_0
    sql: ${sale_price} ;;
  }
  measure: last_years_avg_sales_price {
    description: "Average price of an item sold last year and before"
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd_0
    filters: [is_last_year_and_before: "yes"]

  }
  dimension: is_last_year_and_before{
    description: "flags yes is the item was sold last year and before"
    type: yesno
    sql: ${created_date} <= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) ;;
  }

  measure: cumulative_total_revenue {
    type: running_total
    sql: ${total_sales} ;;
    value_format_name: usd
  }
  set: eccomerce_order_items {
    fields: [product_id, inventory_item_id, id, order_id, user_id, created_date,returned_date,shipped_date,delivered_date,
      total_sales,status,sale_price,is_returned,count,count_all_orders,is_cancelled, is_complete,average_sale_price
    ]
  }
# }
# commented out fields {


  # set: simple_set {
  #   fields: [
  #     id,
  #     order_id,
  #     user_id,
  #     total_sales,
  #     count
  #   ]
  # }
  # set: revenue_fields {
  #   fields: [
  #     sale_price,
  #     status,
  #     is_delivered_more_than_30_days,
  #     total_revenue,
  #     avg_revenue_per_order,
  #     count_of_finalized_orders
  #   ]
  # }
  # measure: total_revenue {
  #   label: "Total Revenue"
  #   description: "Sum of all item's sale price after 30 days delivered. These items are not returned or cancelled"
  #   type: sum
  #   sql: ${sale_price};;
  #   filters: [is_delivered_more_than_30_days: "yes"]
  #   drill_fields: [users.full_name, users.gender, users.age_tier, id, created_date, sale_price]
  #   value_format_name: usd_0
  # }
  # measure: count_of_finalized_orders {
  #   type: count_distinct
  #   sql: ${order_id} ;;
  #   filters: [is_delivered_more_than_30_days: "yes"]
  # }
  # measure: avg_revenue_per_order {
  #   type: number
  #   sql: ${total_revenue}/${count_of_finalized_orders} ;;
  #   value_format_name: usd_0
  # }
# commented out fields }






}

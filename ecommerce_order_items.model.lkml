connection: "sales_demo_the_look"

include: "/views/ecommerce/*.view.lkml"
include: "/views/ecommerce/events_derived_views/*.view.lkml"
include: "/views/ecommerce/order_items_derived_views/*.view.lkml"
include: "/Dashboards/*.dashboard.lookml"

access_grant: explore_assistant_tester {
  allowed_values: ["yes"]
  user_attribute: explore_assistant_test_group
}

datagroup: daily {
  max_cache_age: "24 hours"
  sql_trigger: select CURRENT_DATE() ;;
}

### Explore to ask customer behavior and order summary questions
explore: order_items{
   label: "Orders and Users- Explore Assistant Sandbox"
  description: "Use this explore to ask questions about orders and users for Explore Assistant Sandbox"
  view_label: "Order Items"

  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }
  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.id} ;;
  }
  join: user_session_info {
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_items.user_id} = ${user_session_info.user_id};;
  }
  join: user_order_information {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${user_order_information.id} ;;
  }
  join: distribution_centers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id};;
  }
  join: parameter_subquery_demo {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.dynamic_user_attributes} = ${parameter_subquery_demo.dynamic_user_attributes};;
  }

  aggregate_table: rollup_sales_by_day_by_brand{
    query: {
      dimensions: [created_date, products.brand]
      measures: [total_sales,order_items.count_all_orders]

    }
    materialization: {
      sql_trigger_value: SELECT CURDATE() ;;
    }
  }
  aggregate_table: rollup_sales_by_week{
    query: {
      dimensions: [created_week]
      measures: [total_sales]
    }
    materialization: {
      sql_trigger_value: SELECT CURDATE() ;;
    }
  }

}

### Explore to ask questions about visitors on the fashion.ly website
explore: events {
  label: "Web Analytics Explore"
  join: abandoned_cart_info {
    type: inner
    relationship: one_to_one
    sql_on: ${events.id} = ${abandoned_cart_info.id} ;;
  }
  join: session_duration_info {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.session_id} = ${session_duration_info.session_id} ;;
  }
  join: user_session_info {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.user_id} = ${user_session_info.user_id} ;;
  }
  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.viewed_product_id} = ${products.id};;
  }
}

explore: users {
  label: "Users explore"
  join: user_order_information {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id} = ${user_order_information.id} ;;
  }
  join: user_session_info {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id} = ${user_session_info.user_id};;
  }
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${orders.user_id} ;;
  }
  join: order_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }
}

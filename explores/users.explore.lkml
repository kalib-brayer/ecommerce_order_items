include: "/views/ecommerce/*.view.lkml"
include: "/views/ecommerce/events_derived_views/*.view.lkml"
include: "/views/ecommerce/order_items_derived_views/*.view.lkml"

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

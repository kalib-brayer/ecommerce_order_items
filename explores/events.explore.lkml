include: "/views/ecommerce/*.view.lkml"
include: "/views/ecommerce/events_derived_views/*.view.lkml"
include: "/views/ecommerce/order_items_derived_views/*.view.lkml"

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

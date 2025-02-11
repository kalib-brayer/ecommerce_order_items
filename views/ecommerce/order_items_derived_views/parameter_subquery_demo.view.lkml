view: parameter_subquery_demo {
  derived_table: {
    explore_source: order_items {
      column: dynamic_user_attributes { field: users.dynamic_user_attributes }
      column: total_sales {}
      column: count {}
      bind_all_filters: yes
      # bind_filters: {
      #   from_field: user_attributes_parameter
      #   to_field: parameter_subquery_demo.dynamic_user_attributes
      #}
    }
  }
  dimension: dynamic_user_attributes {
    description: ""
  }
  dimension: total_sales {
    description: "Sum of all item's sale price"
    value_format: "$#,##0"
    type: number
  }
  dimension: count {
    description: ""
    type: number
  }
}

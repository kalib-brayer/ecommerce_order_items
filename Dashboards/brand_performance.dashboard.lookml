---
- dashboard: brand_performance Austin
  title: Brand Performance Austin
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: 'Reference Dashboards: 1042'
  preferred_slug: J0M722c9nPelBQiuBDVpUu
  elements:
  - title: Total Customers
    name: Total Customers
    model: ecommerce_order_items
    explore: order_items
    type: single_value
    fields: [products.brand, users.number_of_users]
    sorts: [users.number_of_users desc 0]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: 1.3 * ${users.number_of_users}
      label: Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: goal
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Brand: products.brand
      Created Date: order_items.created_date
      State: users.state
      Country: users.country
    row: 2
    col: 0
    width: 4
    height: 4
  - name: <img src="https://directoriosvitocommx/wp-content/uploads/2018/06/proanlogojpg"
      height="75">
    type: text
    title_text: <img src="https://directoriosvito.com.mx/wp-content/uploads/2018/06/proanlogo.jpg"
      height="75">
    subtitle_text: How are sales performing?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Total Orders
    name: Total Orders
    model: ecommerce_order_items
    explore: order_items
    type: single_value
    fields: [products.brand, order_items.reporting_period, orders.number_of_orders]
    filters: {}
    sorts: [order_items.reporting_period desc]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      label: "% Change"
      value_format:
      value_format_name: percent_1
      calculation_type: percent_of_previous
      table_calculation: change
      args:
      - orders.number_of_orders
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: vs Prior Period
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [products.brand]
    y_axes: []
    listen:
      Brand: products.brand
      Created Date: order_items.created_date
      State: users.state
      Country: users.country
    row: 2
    col: 8
    width: 4
    height: 4
  - title: Most Popular Categories
    name: Most Popular Categories
    model: ecommerce_order_items
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, products.category, products.department]
    pivots: [products.department]
    sorts: [products.department, order_items.total_sale_price desc 0]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    y_axes: []
    listen:
      Brand: products.brand
      Created Date: order_items.created_date
      State: users.state
      Country: users.country
    row: 2
    col: 12
    width: 12
    height: 11
  - title: Sales Trendline
    name: Sales Trendline
    model: ecommerce_order_items
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_year, order_items.created_day_of_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year]
    filters:
      order_items.created_day_of_year: "<=90"
    sorts: [order_items.created_year, order_items.total_sale_price desc 0]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_items.average_sale_price,
            id: order_items.average_sale_price, name: Average Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      2023 - order_items.total_sale_price: "#FBB555"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Brand: products.brand
      State: users.state
      Country: users.country
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Average Order Value
    name: Average Order Value
    model: ecommerce_order_items
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Brand: products.brand
      State: users.state
      Country: users.country
    row: 2
    col: 4
    width: 4
    height: 4
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ecommerce_order_items
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 90 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: ecommerce_order_items
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ecommerce_order_items
    explore: order_items
    listens_to_filters: []
    field: users.country
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ecommerce_order_items
    explore: order_items
    listens_to_filters: []
    field: users.state

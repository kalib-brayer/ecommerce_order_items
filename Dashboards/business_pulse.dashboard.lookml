- dashboard: business_pulse
  title: Business Pulse
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: iLbXBKhQelwWVlLQ0YTJ6A
  elements:
  - title: Business Pulse 20
    name: Business Pulse 20
    model: ecommerce_order_items
    explore: users
    type: single_value
    fields: [users.number_of_users]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: 1.25 * ${users.number_of_users}
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
    single_value_title: New Users Aquired
    comparison_label: ''
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 4
    height: 4
  - title: Average Sales per Item
    name: Average Sales per Item
    model: ecommerce_order_items
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Price per Item
    defaults_version: 1
    listen: {}
    row: 2
    col: 4
    width: 4
    height: 4
  - title: Percent of Repeat Customers
    name: Percent of Repeat Customers
    model: ecommerce_order_items
    explore: order_items
    type: single_value
    fields: [user_order_information.percent_of_repeat_customers]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Percent of Repeat Customers
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 2
    col: 8
    width: 6
    height: 4
  - title: Total Sales YoY
    name: Total Sales YoY
    model: ecommerce_order_items
    explore: order_items
    type: looker_line
    fields: [order_items.created_year, order_items.total_sale_price, order_items.created_month_name]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year, order_items.created_month_name]
    sorts: [order_items.created_year, order_items.created_month_name]
    limit: 500
    column_limit: 50
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: false
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    series_labels: {}
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen: {}
    row: 2
    col: 17
    width: 7
    height: 11
  - title: Orders per Day and Category
    name: Orders per Day and Category
    model: ecommerce_order_items
    explore: order_items
    type: looker_area
    fields: [order_items.count_all_orders, order_items.created_date, products.category]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    sorts: [products.category, order_items.created_date desc]
    limit: 500
    column_limit: 50
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 6
    col: 0
    width: 17
    height: 7
  - title: Gender Profile
    name: Gender Profile
    model: ecommerce_order_items
    explore: order_items
    type: looker_donut_multiples
    fields: [order_items.count_all_orders, users.gender, users.traffic_source]
    pivots: [users.traffic_source]
    sorts: [users.traffic_source, order_items.count_all_orders desc 0]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 15
    col: 5
    width: 5
    height: 8
  - title: Age Profile
    name: Age Profile
    model: ecommerce_order_items
    explore: order_items
    type: looker_donut_multiples
    fields: [users.age_tiers, order_items.count_all_orders]
    pivots: [users.age_tiers]
    fill_fields: [users.age_tiers]
    sorts: [users.age_tiers]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 14
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: false
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 15
    col: 0
    width: 5
    height: 8
  - title: Session KPI
    name: Session KPI
    model: ecommerce_order_items
    explore: events
    type: single_value
    fields: [events.count_unique_sessions, events.purchase_conversion]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Sessions
    comparison_label: of sessions lead to a purchase
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
    listen: {}
    row: 25
    col: 6
    width: 8
    height: 4
  - title: Website Page Funnel
    name: Website Page Funnel
    model: ecommerce_order_items
    explore: events
    type: looker_funnel
    fields: [events.number_of_product_pages, events.number_of_cart_pages, events.number_of_purchases]
    limit: 500
    column_limit: 50
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    isStepped: false
    labelOverlap: false
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen: {}
    row: 29
    col: 0
    width: 14
    height: 8
  - title: Abandon Cart Rate
    name: Abandon Cart Rate
    model: ecommerce_order_items
    explore: events
    type: single_value
    fields: [abandoned_cart_info.abandoned_cart_rate]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Abandon Cart Rate
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    listen: {}
    row: 25
    col: 0
    width: 6
    height: 4
  - title: Traffic Source Boxplot
    name: Traffic Source Boxplot
    model: ecommerce_order_items
    explore: users
    type: looker_boxplot
    fields: [users.traffic_source, user_order_information.min_lifetime_revenue, user_order_information.25th_percentile_lifetime_revenue,
      user_order_information.median_lifetime_revenue, user_order_information.75th_percentile_lifetime_revenue,
      user_order_information.max_lifetime_revenue]
    sorts: [user_order_information.min_lifetime_revenue desc 0]
    limit: 500
    column_limit: 50
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
    hidden_pivots: {}
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
    listen: {}
    row: 25
    col: 14
    width: 10
    height: 6
  - title: Traffic Source Sankey
    name: Traffic Source Sankey
    model: ecommerce_order_items
    explore: events
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [events.traffic_source, events.event_type, events.count_unique_sessions]
    sorts: [events.count_unique_sessions desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 0
    listen: {}
    row: 31
    col: 14
    width: 10
    height: 6
  - title: Brand Performance
    name: Brand Performance
    model: ecommerce_order_items
    explore: order_items
    type: looker_grid
    fields: [products.brand, user_order_information.percent_of_repeat_customers, products.gross_margin,
      products.gross_margin_percentange, order_items.total_sale_price, order_items.count_all_orders]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 39
    col: 0
    width: 13
    height: 12
  - title: Brand Roll-up
    name: Brand Roll-up
    model: ecommerce_order_items
    explore: order_items
    type: looker_grid
    fields: [products.brand, products.category, order_items.total_sale_price]
    sorts: [products.brand, products.category desc]
    subtotals: [products.brand]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 39
    col: 13
    width: 11
    height: 12
  - name: "<span class='fa fa-laptop'> </span> Web Analytics"
    type: text
    title_text: "<span class='fa fa-laptop'> </span> Web Analytics"
    subtitle_text: What are customers doing on our website?
    body_text: ''
    row: 23
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    subtitle_text: Are we headed in the right direction?
    body_text: ''
    row: 0
    col: 7
    width: 11
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="data:image/png;base64,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"
      style="width:150px;height:78px;">
    row: 0
    col: 0
    width: 3
    height: 2
  - name: "<span class='fa fa-users'> </span> Customer Demographics"
    type: text
    title_text: "<span class='fa fa-users'> </span> Customer Demographics"
    subtitle_text: Who are our customers?
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-tachometer'> Brand Comparison</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Brand Comparison</span>"
    subtitle_text: ''
    body_text: ''
    row: 37
    col: 0
    width: 24
    height: 2
  - title: Total Revenue by Country
    name: Total Revenue by Country
    model: ecommerce_order_items
    explore: order_items
    type: looker_google_map
    fields: [users.country, order_items.total_sale_price]
    sorts: [order_items.total_revenue desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    listen: {}
    row: 15
    col: 10
    width: 14
    height: 8

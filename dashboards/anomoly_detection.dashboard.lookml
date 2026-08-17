---
- dashboard: anomoly_detection
  title: 'Anomoly Detection'
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5cO6nQ5loWtxWRRsAylPCd
  theme_name: ''
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Top Items This Month
    name: Top Items This Month
    model: ecommerce_order_items
    explore: order_items
    type: looker_bar
    fields: [products.name, order_items.count]
    filters:
      order_items.delivered_month: this month
    sorts: [order_items.count desc 0]
    limit: 20
    column_limit: 200
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
    hidden_fields: []
    y_axes: [{gridlines: true, label: Orders, orientation: left, series: [{axisId: order_items.count_all_orders,
            id: Accessories - order_items.count_all_orders, name: Accessories}, {
            axisId: order_items.count_all_orders, id: Active - order_items.count_all_orders,
            name: Active}, {axisId: order_items.count_all_orders, id: Blazers & Jackets
              - order_items.count_all_orders, name: Blazers & Jackets}, {axisId: order_items.count_all_orders,
            id: Clothing Sets - order_items.count_all_orders, name: Clothing Sets},
          {axisId: order_items.count_all_orders, id: Dresses - order_items.count_all_orders,
            name: Dresses}, {axisId: order_items.count_all_orders, id: Fashion Hoodies
              & Sweatshirts - order_items.count_all_orders, name: Fashion Hoodies
              & Sweatshirts}, {axisId: order_items.count_all_orders, id: Intimates
              - order_items.count_all_orders, name: Intimates}, {axisId: order_items.count_all_orders,
            id: Jeans - order_items.count_all_orders, name: Jeans}, {axisId: order_items.count_all_orders,
            id: Jumpsuits & Rompers - order_items.count_all_orders, name: Jumpsuits
              & Rompers}, {axisId: order_items.count_all_orders, id: Leggings - order_items.count_all_orders,
            name: Leggings}, {axisId: order_items.count_all_orders, id: Maternity
              - order_items.count_all_orders, name: Maternity}, {axisId: order_items.count_all_orders,
            id: Outerwear & Coats - order_items.count_all_orders, name: Outerwear
              & Coats}, {axisId: order_items.count_all_orders, id: Pants - order_items.count_all_orders,
            name: Pants}, {axisId: order_items.count_all_orders, id: Pants & Capris
              - order_items.count_all_orders, name: Pants & Capris}, {axisId: order_items.count_all_orders,
            id: Plus - order_items.count_all_orders, name: Plus}, {axisId: order_items.count_all_orders,
            id: Shorts - order_items.count_all_orders, name: Shorts}, {axisId: order_items.count_all_orders,
            id: Skirts - order_items.count_all_orders, name: Skirts}, {axisId: order_items.count_all_orders,
            id: Sleep & Lounge - order_items.count_all_orders, name: Sleep & Lounge},
          {axisId: order_items.count_all_orders, id: Socks - order_items.count_all_orders,
            name: Socks}, {axisId: order_items.count_all_orders, id: Socks & Hosiery
              - order_items.count_all_orders, name: Socks & Hosiery}, {axisId: order_items.count_all_orders,
            id: Suits - order_items.count_all_orders, name: Suits}, {axisId: order_items.count_all_orders,
            id: Suits & Sport Coats - order_items.count_all_orders, name: Suits &
              Sport Coats}, {axisId: order_items.count_all_orders, id: Sweaters -
              order_items.count_all_orders, name: Sweaters}, {axisId: order_items.count_all_orders,
            id: Swim - order_items.count_all_orders, name: Swim}, {axisId: order_items.count_all_orders,
            id: Tops & Tees - order_items.count_all_orders, name: Tops & Tees}, {
            axisId: order_items.count_all_orders, id: Underwear - order_items.count_all_orders,
            name: Underwear}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Men - order_items.count_all_orders: "#118ab2"
    x_axis_datetime_label: "%B %y"
    swap_axes: false
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 12
    tab_name: ''
  - title: sales by location
    name: sales by location
    model: ecommerce_order_items
    explore: order_items
    type: looker_line
    fields: [order_items.total_sales, orders.created_date, distribution_centers.name]
    pivots: [distribution_centers.name]
    sorts: [distribution_centers.name, orders.created_date desc]
    limit: 20
    column_limit: 200
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_fields: []
    y_axes: [{gridlines: true, label: Orders, orientation: left, series: [{axisId: order_items.count_all_orders,
            id: Accessories - order_items.count_all_orders, name: Accessories}, {
            axisId: order_items.count_all_orders, id: Active - order_items.count_all_orders,
            name: Active}, {axisId: order_items.count_all_orders, id: Blazers & Jackets
              - order_items.count_all_orders, name: Blazers & Jackets}, {axisId: order_items.count_all_orders,
            id: Clothing Sets - order_items.count_all_orders, name: Clothing Sets},
          {axisId: order_items.count_all_orders, id: Dresses - order_items.count_all_orders,
            name: Dresses}, {axisId: order_items.count_all_orders, id: Fashion Hoodies
              & Sweatshirts - order_items.count_all_orders, name: Fashion Hoodies
              & Sweatshirts}, {axisId: order_items.count_all_orders, id: Intimates
              - order_items.count_all_orders, name: Intimates}, {axisId: order_items.count_all_orders,
            id: Jeans - order_items.count_all_orders, name: Jeans}, {axisId: order_items.count_all_orders,
            id: Jumpsuits & Rompers - order_items.count_all_orders, name: Jumpsuits
              & Rompers}, {axisId: order_items.count_all_orders, id: Leggings - order_items.count_all_orders,
            name: Leggings}, {axisId: order_items.count_all_orders, id: Maternity
              - order_items.count_all_orders, name: Maternity}, {axisId: order_items.count_all_orders,
            id: Outerwear & Coats - order_items.count_all_orders, name: Outerwear
              & Coats}, {axisId: order_items.count_all_orders, id: Pants - order_items.count_all_orders,
            name: Pants}, {axisId: order_items.count_all_orders, id: Pants & Capris
              - order_items.count_all_orders, name: Pants & Capris}, {axisId: order_items.count_all_orders,
            id: Plus - order_items.count_all_orders, name: Plus}, {axisId: order_items.count_all_orders,
            id: Shorts - order_items.count_all_orders, name: Shorts}, {axisId: order_items.count_all_orders,
            id: Skirts - order_items.count_all_orders, name: Skirts}, {axisId: order_items.count_all_orders,
            id: Sleep & Lounge - order_items.count_all_orders, name: Sleep & Lounge},
          {axisId: order_items.count_all_orders, id: Socks - order_items.count_all_orders,
            name: Socks}, {axisId: order_items.count_all_orders, id: Socks & Hosiery
              - order_items.count_all_orders, name: Socks & Hosiery}, {axisId: order_items.count_all_orders,
            id: Suits - order_items.count_all_orders, name: Suits}, {axisId: order_items.count_all_orders,
            id: Suits & Sport Coats - order_items.count_all_orders, name: Suits &
              Sport Coats}, {axisId: order_items.count_all_orders, id: Sweaters -
              order_items.count_all_orders, name: Sweaters}, {axisId: order_items.count_all_orders,
            id: Swim - order_items.count_all_orders, name: Swim}, {axisId: order_items.count_all_orders,
            id: Tops & Tees - order_items.count_all_orders, name: Tops & Tees}, {
            axisId: order_items.count_all_orders, id: Underwear - order_items.count_all_orders,
            name: Underwear}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Men - order_items.count_all_orders: "#118ab2"
    x_axis_datetime_label: "%B %y"
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 6
    col: 12
    width: 12
    height: 6
    tab_name: ''
  - title: Orders Volume Trends
    name: Orders Volume Trends
    model: ecommerce_order_items
    explore: order_items
    type: looker_line
    fields: [orders.created_date, orders.sum_num_of_orders, orders.count_of_orders]
    fill_fields: [orders.created_date]
    filters:
      orders.created_date: 90 days
    sorts: [orders.created_date]
    limit: 200
    column_limit: 200
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: [{gridlines: true, label: Orders, orientation: left, series: [{axisId: order_items.count_all_orders,
            id: Accessories - order_items.count_all_orders, name: Accessories}, {
            axisId: order_items.count_all_orders, id: Active - order_items.count_all_orders,
            name: Active}, {axisId: order_items.count_all_orders, id: Blazers & Jackets
              - order_items.count_all_orders, name: Blazers & Jackets}, {axisId: order_items.count_all_orders,
            id: Clothing Sets - order_items.count_all_orders, name: Clothing Sets},
          {axisId: order_items.count_all_orders, id: Dresses - order_items.count_all_orders,
            name: Dresses}, {axisId: order_items.count_all_orders, id: Fashion Hoodies
              & Sweatshirts - order_items.count_all_orders, name: Fashion Hoodies
              & Sweatshirts}, {axisId: order_items.count_all_orders, id: Intimates
              - order_items.count_all_orders, name: Intimates}, {axisId: order_items.count_all_orders,
            id: Jeans - order_items.count_all_orders, name: Jeans}, {axisId: order_items.count_all_orders,
            id: Jumpsuits & Rompers - order_items.count_all_orders, name: Jumpsuits
              & Rompers}, {axisId: order_items.count_all_orders, id: Leggings - order_items.count_all_orders,
            name: Leggings}, {axisId: order_items.count_all_orders, id: Maternity
              - order_items.count_all_orders, name: Maternity}, {axisId: order_items.count_all_orders,
            id: Outerwear & Coats - order_items.count_all_orders, name: Outerwear
              & Coats}, {axisId: order_items.count_all_orders, id: Pants - order_items.count_all_orders,
            name: Pants}, {axisId: order_items.count_all_orders, id: Pants & Capris
              - order_items.count_all_orders, name: Pants & Capris}, {axisId: order_items.count_all_orders,
            id: Plus - order_items.count_all_orders, name: Plus}, {axisId: order_items.count_all_orders,
            id: Shorts - order_items.count_all_orders, name: Shorts}, {axisId: order_items.count_all_orders,
            id: Skirts - order_items.count_all_orders, name: Skirts}, {axisId: order_items.count_all_orders,
            id: Sleep & Lounge - order_items.count_all_orders, name: Sleep & Lounge},
          {axisId: order_items.count_all_orders, id: Socks - order_items.count_all_orders,
            name: Socks}, {axisId: order_items.count_all_orders, id: Socks & Hosiery
              - order_items.count_all_orders, name: Socks & Hosiery}, {axisId: order_items.count_all_orders,
            id: Suits - order_items.count_all_orders, name: Suits}, {axisId: order_items.count_all_orders,
            id: Suits & Sport Coats - order_items.count_all_orders, name: Suits &
              Sport Coats}, {axisId: order_items.count_all_orders, id: Sweaters -
              order_items.count_all_orders, name: Sweaters}, {axisId: order_items.count_all_orders,
            id: Swim - order_items.count_all_orders, name: Swim}, {axisId: order_items.count_all_orders,
            id: Tops & Tees - order_items.count_all_orders, name: Tops & Tees}, {
            axisId: order_items.count_all_orders, id: Underwear - order_items.count_all_orders,
            name: Underwear}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Men - order_items.count_all_orders: "#118ab2"
    x_axis_datetime_label: "%B %y"
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 6
    tab_name: ''
  - title: Delivery times by Location
    name: Delivery times by Location
    model: ecommerce_order_items
    explore: order_items
    type: looker_column
    fields: [orders.average_delivery_days, distribution_centers.name, orders.created_week]
    pivots: [distribution_centers.name]
    fill_fields: [orders.created_week]
    filters:
      orders.created_date: 90 days
    sorts: [distribution_centers.name, orders.created_week desc]
    limit: 200
    column_limit: 200
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
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
    hidden_fields: []
    y_axes: [{gridlines: true, label: Orders, orientation: left, series: [{axisId: order_items.count_all_orders,
            id: Accessories - order_items.count_all_orders, name: Accessories}, {
            axisId: order_items.count_all_orders, id: Active - order_items.count_all_orders,
            name: Active}, {axisId: order_items.count_all_orders, id: Blazers & Jackets
              - order_items.count_all_orders, name: Blazers & Jackets}, {axisId: order_items.count_all_orders,
            id: Clothing Sets - order_items.count_all_orders, name: Clothing Sets},
          {axisId: order_items.count_all_orders, id: Dresses - order_items.count_all_orders,
            name: Dresses}, {axisId: order_items.count_all_orders, id: Fashion Hoodies
              & Sweatshirts - order_items.count_all_orders, name: Fashion Hoodies
              & Sweatshirts}, {axisId: order_items.count_all_orders, id: Intimates
              - order_items.count_all_orders, name: Intimates}, {axisId: order_items.count_all_orders,
            id: Jeans - order_items.count_all_orders, name: Jeans}, {axisId: order_items.count_all_orders,
            id: Jumpsuits & Rompers - order_items.count_all_orders, name: Jumpsuits
              & Rompers}, {axisId: order_items.count_all_orders, id: Leggings - order_items.count_all_orders,
            name: Leggings}, {axisId: order_items.count_all_orders, id: Maternity
              - order_items.count_all_orders, name: Maternity}, {axisId: order_items.count_all_orders,
            id: Outerwear & Coats - order_items.count_all_orders, name: Outerwear
              & Coats}, {axisId: order_items.count_all_orders, id: Pants - order_items.count_all_orders,
            name: Pants}, {axisId: order_items.count_all_orders, id: Pants & Capris
              - order_items.count_all_orders, name: Pants & Capris}, {axisId: order_items.count_all_orders,
            id: Plus - order_items.count_all_orders, name: Plus}, {axisId: order_items.count_all_orders,
            id: Shorts - order_items.count_all_orders, name: Shorts}, {axisId: order_items.count_all_orders,
            id: Skirts - order_items.count_all_orders, name: Skirts}, {axisId: order_items.count_all_orders,
            id: Sleep & Lounge - order_items.count_all_orders, name: Sleep & Lounge},
          {axisId: order_items.count_all_orders, id: Socks - order_items.count_all_orders,
            name: Socks}, {axisId: order_items.count_all_orders, id: Socks & Hosiery
              - order_items.count_all_orders, name: Socks & Hosiery}, {axisId: order_items.count_all_orders,
            id: Suits - order_items.count_all_orders, name: Suits}, {axisId: order_items.count_all_orders,
            id: Suits & Sport Coats - order_items.count_all_orders, name: Suits &
              Sport Coats}, {axisId: order_items.count_all_orders, id: Sweaters -
              order_items.count_all_orders, name: Sweaters}, {axisId: order_items.count_all_orders,
            id: Swim - order_items.count_all_orders, name: Swim}, {axisId: order_items.count_all_orders,
            id: Tops & Tees - order_items.count_all_orders, name: Tops & Tees}, {
            axisId: order_items.count_all_orders, id: Underwear - order_items.count_all_orders,
            name: Underwear}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Men - order_items.count_all_orders: "#118ab2"
    x_axis_datetime_label: "%B %y"
    show_null_points: false
    interpolation: linear
    swap_axes: false
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 12
    col: 0
    width: 12
    height: 6
    tab_name: ''

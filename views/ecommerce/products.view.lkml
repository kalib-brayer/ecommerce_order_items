# The name of this view in Looker is "Products"
view: products {
  sql_table_name: `big-query-sales-demo.thelook_ecommerce.products` ;;

  dimension: id {
    label: "Product ID"
    description: "Uniquely describes a product"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  measure: count {
    type: count
  }
### Product Description Fields {
  dimension: category {
    label: "Category"
    description: "Category of a product. Many brands roll up to a category.  Category values include: Outerwear & Coats,Jeans,Sweaters,Suits & Sport Coats  ,Swim,
    Fashion Hoodies & SweatshirtsSleep & Lounge,Dresses,Active,Shorts,Accessories,Intimates,Tops & Tees,Pants,Blazers & Jackets,Maternity,
    Pants & Capris,Underwear,Plus,Skirts,Suits,Socks,Socks & Hosiery,Leggings,Jumpsuits & Rompers,Clothing Sets"
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: brand {
    label: "Brand"
    description: "Brand of a product.  Popular brand values include Calvin Klein, Diesel, Carhartt, True Religion, 7 For All Mankind, Ray-Ban, Tommy Hilfiger, Columbia, and North Face
    Do not pivot on this field unless it is filtered."
    tags: ["Label,Manufacturer, Companies, Makers"]
    type: string
    sql: ${TABLE}.brand ;;
    link: {
      label: "Brand Dashboard - {{ value }}"
      url: "/dashboards/934?Brand={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=looker.com"
    }
  }
  dimension: name {
    label: "Product Name"
    description: "Name of the product.  There are many products to a brand."
    tags: ["item"]
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Product Dashboard - {{ value }}"
      url: "/dashboards/907?Product+Name={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=looker.com"
    }
  }

  dimension: department {
    label: "Department"
    description: "Department of the product.  Values include men and women.  Do not include this field if a user asks for gender. This is a good field for pivots."
    type: string
    sql: ${TABLE}.department ;;
  }
  ### End of Product Description Fields }


### Hidden Fields {
  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }
  dimension: sku {
    type: string
    hidden: yes
    sql: ${TABLE}.sku ;;
  }
  dimension: retail_price {
    type: number
    hidden: yes
    sql: ${TABLE}.retail_price ;;
  }
  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }
  measure: count_departments {
    type: count_distinct
    sql: ${department} ;;
  }
  measure: count_categories {
    type: count_distinct
    sql: ${category} ;;
  }
  measure: count_brands {
    type: count_distinct
    sql: ${brand} ;;
  }
  measure: count_names {
    type: count_distinct
    sql: ${name} ;;
  }
  measure: count_centers {
    type: count_distinct
    sql: ${distribution_center_id} ;;
  }

### End of Hidden Fields }

###################################################################################################
#######       Adding Dynamic Measure + Parameter to train the Explore Assistant             #######
###################################################################################################

  parameter: dynamic_total_field {
    group_label: "Dynamic Totals"
    type: unquoted
    allowed_value: {
      label: "Total Cost"
      value: "cost"
    }
    allowed_value: {
      label: "Total Retail Price"
      value: "retail_price"
    }
  }

  measure: dynamic_product_totals {
    group_label: "Dynamic Totals"
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.{% parameter dynamic_total_field %} ;;
  }

  ### End of dynamic count measure & parameter

  measure: total_cost {
    # required_access_grants: [can_view_financial_data]
    description: "Cost of an item or product.  The amount paid for the item by the company.  Do not use this field for inquires about customers"
    tags: ["total charges, amount spent"]
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
  }
  measure: gross_margin {
    # required_access_grants: [can_view_financial_data]
    type: number
    sql:  ${total_retail_price} - ${total_cost} ;;
    description: "difference between revenue and costs"
    tags: ["markup, profitability"]
    value_format_name: usd_0
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  measure: total_retail_price {
    type: sum
    sql: ${retail_price} ;;
    value_format_name: usd_0
  }

  measure: average_retail_price {
    type: average
    sql: ${retail_price} ;;
    value_format_name: usd_0
    drill_fields: [brand,category,department,average_retail_price, gross_margin,repeat_purchases.percentage_repeat_purchase]
  }

  measure: gross_margin_percentange {
    label: "Gross Margin %"
    description: "gross margin divided by total sales.  gross margin percentage."
    tags: ["profitability percentage"]
    type: number
    sql:  ${gross_margin} / nullif(${total_retail_price},0) ;;
    value_format_name: percent_1
  }
}

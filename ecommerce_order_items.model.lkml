connection: "sales_demo_the_look"

## Include explore files
include: "/explores/*.explore.lkml"

## Include dashboard files
include: "/dashboards/*.dashboard.lookml"

access_grant: explore_assistant_tester {
  allowed_values: ["yes"]
  user_attribute: explore_assistant_test_group
}

datagroup: daily {
  max_cache_age: "24 hours"
  sql_trigger: select CURRENT_DATE() ;;
}

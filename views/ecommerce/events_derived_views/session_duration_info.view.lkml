view: session_duration_info {
  derived_table: {
    explore_source: events {
      column: start_of_session {}
      column: end_of_session {}
      column: session_id {}
    }
  }
  dimension: start_of_session {
    description: "The time of the start of a session"
    type: number
  }
  dimension: end_of_session {
    description: "The time of the end of a session"
    type: number
  }
  dimension: session_id {
    primary_key: yes
    hidden: yes
    description: "A unique identifier for a user session. This dimension is critical for session-level analysis, tracking the full set of actions a user takes in a single visit."
  }

  dimension_group: time_per_session {
    description: "Duration of time between the start of a session and the end of a session"
    type: duration
    intervals: [second, minute, hour, day, week]
    sql_start: ${start_of_session} ;;
    sql_end: ${end_of_session} ;;
  }

  measure: avg_seconds_spent_per_session {
    group_label: "Time spent per session"
    label: "Average seconds per session"
    description: "The average amount of seconds spent per website session"
    type: average
    value_format_name: decimal_0
    sql: ${seconds_time_per_session} ;;
  }
  measure: avg_minutes_spent_per_session {
    group_label: "Time spent per session"
    label: "Average minutes per session"
    description: "The average amount of minutes spent per website session"
    type: average
    value_format_name: decimal_0
    sql: ${minutes_time_per_session} ;;
  }
}

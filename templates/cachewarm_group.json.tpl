{
    "id": 5662170556794934,
    "definition": {
        "title": "{{ portal_name }} cache rate",
        "type": "group",
        "show_title": true,
        "layout_type": "ordered",
        "widgets": [
            {
                "id": 3938598211230524,
                "definition": {
                    "title": "Credentials Cache Rate",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "creds_cache_rate",
                                    "formula": "(query5 / (query5 + query6)) * 100"
                                }
                            ],
                            "conditional_formats": [
                                {
                                    "comparator": ">",
                                    "palette": "white_on_green",
                                    "value": 90
                                },
                                {
                                    "comparator": ">=",
                                    "palette": "white_on_yellow",
                                    "value": 80
                                },
                                {
                                    "comparator": "<",
                                    "palette": "white_on_red",
                                    "value": 80
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.credentials.success{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query5",
                                    "aggregator": "avg"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.credentials.failure{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query6",
                                    "aggregator": "avg"
                                }
                            ]
                        }
                    ],
                    "autoscale": true,
                    "precision": 2
                }
            },
            {
                "id": 3214713849689912,
                "definition": {
                    "title": "ACH Enabled Cache Rate",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "creds_cache_rate",
                                    "formula": "(query5 / (query5 + query6)) * 100"
                                }
                            ],
                            "conditional_formats": [
                                {
                                    "comparator": ">",
                                    "palette": "white_on_green",
                                    "value": 90
                                },
                                {
                                    "comparator": ">=",
                                    "palette": "white_on_yellow",
                                    "value": 80
                                },
                                {
                                    "comparator": "<",
                                    "palette": "white_on_red",
                                    "value": 80
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.ach_enabled.success{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query5",
                                    "aggregator": "avg"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.ach_enabled.failure{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query6",
                                    "aggregator": "avg"
                                }
                            ]
                        }
                    ],
                    "autoscale": true,
                    "precision": 2
                }
            },
            {
                "id": 3553248255711172,
                "definition": {
                    "title": "Balance Cache Rate",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "creds_cache_rate",
                                    "formula": "(query5 / (query5 + query6)) * 100"
                                }
                            ],
                            "conditional_formats": [
                                {
                                    "comparator": ">",
                                    "palette": "white_on_green",
                                    "value": 90
                                },
                                {
                                    "comparator": ">=",
                                    "palette": "white_on_yellow",
                                    "value": 80
                                },
                                {
                                    "comparator": "<",
                                    "palette": "white_on_red",
                                    "value": 80
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.balance.success{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query5",
                                    "aggregator": "avg"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.balance.failure{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query6",
                                    "aggregator": "avg"
                                }
                            ]
                        }
                    ],
                    "autoscale": true,
                    "precision": 2
                }
            },
            {
                "id": 2338406432068060,
                "definition": {
                    "title": "Avg cache runtime per customer",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "data_source": "spans",
                                    "name": "query1",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "avg",
                                        "metric": "@duration"
                                    },
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @portal_name:{{ portal_name }}"
                                    },
                                    "group_by": []
                                }
                            ],
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "conditional_formats": [
                                {
                                    "comparator": "<=",
                                    "palette": "white_on_green",
                                    "value": 120000000000
                                },
                                {
                                    "comparator": ">",
                                    "palette": "white_on_yellow",
                                    "value": 120000000000
                                },
                                {
                                    "comparator": ">",
                                    "palette": "white_on_red",
                                    "value": 300000000000
                                }
                            ]
                        }
                    ],
                    "autoscale": true,
                    "precision": 2
                }
            },
            {
                "id": 8366213331204409,
                "definition": {
                    "title": "Last validate-credentials errors found",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "toplist",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "a",
                                    "limit": {
                                        "count": 10,
                                        "order": "desc"
                                    }
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @portal_name:{{ portal_name }} @http.status_code:500 @cached.credentials:false"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "name": "a",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": [
                                        {
                                            "facet": "@error.message",
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "limit": 10,
                                            "should_exclude_missing": true
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 8610456278753176,
                "definition": {
                    "title": "Last is ACH enabled errors found",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "toplist",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "a",
                                    "limit": {
                                        "count": 10,
                                        "order": "desc"
                                    }
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @cached.ach:false @cached.balance:true @portal_name:{{ portal_name }} @http.status_code:500"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "name": "a",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": [
                                        {
                                            "facet": "@error.message",
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "limit": 10,
                                            "should_exclude_missing": true
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 7850672894058152,
                "definition": {
                    "title": "Last extract-balance errors found",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "toplist",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "a",
                                    "limit": {
                                        "count": 10,
                                        "order": "desc"
                                    }
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "data_source": "spans",
                                    "name": "a",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @cached.ach:true @cached.balance:false @portal_name:{{ portal_name }} @http.status_code:500"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": [
                                        {
                                            "facet": "@error.message",
                                            "limit": 10,
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "should_exclude_missing": true
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 1101038751048912,
                "definition": {
                    "title": "Last ACH & Balance together errors found",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "toplist",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "a",
                                    "limit": {
                                        "count": 10,
                                        "order": "desc"
                                    }
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @cached.balance:false @cached.ach:false @cached.credentials:true @http.status_code:500 @portal_name:{{ portal_name }}"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "name": "a",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": [
                                        {
                                            "facet": "@error.message",
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "limit": 10,
                                            "should_exclude_missing": true
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 1615073872189480,
                "definition": {
                    "title": "Cache failure reasons",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "toplist",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "a",
                                    "limit": {
                                        "count": 10,
                                        "order": "desc"
                                    }
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @portal_name:{{ portal_name }}"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "name": "a",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": [
                                        {
                                            "facet": "error.type",
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "limit": 10,
                                            "should_exclude_missing": true
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 67580894102654,
                "definition": {
                    "title": "Credentials Cached Responses",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "toplist",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "a",
                                    "limit": {
                                        "count": 10,
                                        "order": "desc"
                                    }
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @portal_name:{{ portal_name }}"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "name": "a",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": [
                                        {
                                            "facet": "@gateway_response.validate_credentials",
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "limit": 10,
                                            "should_exclude_missing": true
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 4301316624539314,
                "definition": {
                    "title": "Warm Cache rate per method",
                    "title_size": "16",
                    "title_align": "left",
                    "show_legend": true,
                    "legend_layout": "horizontal",
                    "legend_columns": [
                        "avg",
                        "min",
                        "max",
                        "value",
                        "sum"
                    ],
                    "time": {},
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "creds_cache_rate",
                                    "formula": "(query5 / (query5 + query6)) * 100"
                                },
                                {
                                    "alias": "ach_cache_rate",
                                    "formula": "(query1 / (query1 + query2)) * 100"
                                },
                                {
                                    "alias": "balance_cache_rate",
                                    "formula": "(query3 / (query3 + query4)) * 100"
                                }
                            ],
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.credentials.success{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query5"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.credentials.failure{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query6"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.ach_enabled.success{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query1"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.ach_enabled.failure{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query2"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.balance.success{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query3"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.cache.balance.failure{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 300)",
                                    "data_source": "metrics",
                                    "name": "query4"
                                }
                            ],
                            "response_format": "timeseries",
                            "style": {
                                "palette": "dog_classic",
                                "line_type": "solid",
                                "line_width": "normal"
                            },
                            "display_type": "line"
                        }
                    ]
                }
            },
            {
                "id": 2328315528717930,
                "definition": {
                    "title": "Portal accounts to cache",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "avg:flex2.billing_service.api.portals.tasks.submitted{env:production,service:warm-portal-cache-*,pool_name:{{ portal_name }}}",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "last"
                                }
                            ],
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "precision": 0
                }
            },
            {
                "id": 4128145419019835,
                "definition": {
                    "title": "ACH responses",
                    "title_size": "16",
                    "title_align": "left",
                    "show_legend": true,
                    "legend_layout": "horizontal",
                    "legend_columns": [
                        "avg",
                        "min",
                        "max",
                        "value",
                        "sum"
                    ],
                    "time": {},
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "enabled",
                                    "style": {
                                        "palette": "green",
                                        "palette_index": 3
                                    },
                                    "formula": "query1"
                                },
                                {
                                    "alias": "disabled",
                                    "style": {
                                        "palette": "warm",
                                        "palette_index": 4
                                    },
                                    "formula": "query2"
                                }
                            ],
                            "queries": [
                                {
                                    "data_source": "spans",
                                    "name": "query1",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.is_ach_enabled:true @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                },
                                {
                                    "data_source": "spans",
                                    "name": "query2",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.is_ach_enabled:false @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                }
                            ],
                            "response_format": "timeseries",
                            "style": {
                                "palette": "dog_classic"
                            },
                            "display_type": "area"
                        }
                    ]
                }
            },
            {
                "id": 1085276266308918,
                "definition": {
                    "title": "Balance amounts",
                    "title_size": "16",
                    "title_align": "left",
                    "show_legend": true,
                    "legend_layout": "horizontal",
                    "legend_columns": [
                        "avg",
                        "min",
                        "max",
                        "value",
                        "sum"
                    ],
                    "time": {},
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "negative",
                                    "style": {
                                        "palette_index": 5,
                                        "palette": "warm"
                                    },
                                    "formula": "query2"
                                },
                                {
                                    "alias": "$0",
                                    "style": {
                                        "palette_index": 3,
                                        "palette": "warm"
                                    },
                                    "formula": "query3"
                                },
                                {
                                    "alias": "$1-$250",
                                    "style": {
                                        "palette_index": 2,
                                        "palette": "warm"
                                    },
                                    "formula": "query4"
                                },
                                {
                                    "alias": "$250-$800",
                                    "style": {
                                        "palette_index": 2,
                                        "palette": "green"
                                    },
                                    "formula": "query1"
                                },
                                {
                                    "alias": ">$800",
                                    "style": {
                                        "palette_index": 4,
                                        "palette": "green"
                                    },
                                    "formula": "query5"
                                }
                            ],
                            "queries": [
                                {
                                    "data_source": "spans",
                                    "name": "query2",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.extract_balance:<0 @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                },
                                {
                                    "data_source": "spans",
                                    "name": "query3",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.extract_balance:(>=0 <1) @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                },
                                {
                                    "data_source": "spans",
                                    "name": "query4",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.extract_balance:(>=1 <250) @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                },
                                {
                                    "data_source": "spans",
                                    "name": "query1",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.extract_balance:(>=250 <800) @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                },
                                {
                                    "data_source": "spans",
                                    "name": "query5",
                                    "search": {
                                        "query": "service:warm-portal-cache operation_name:portals.executeTask env:production @gateway_response.extract_balance:>=800 @portal_name:{{ portal_name }}"
                                    },
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "group_by": []
                                }
                            ],
                            "response_format": "timeseries",
                            "style": {
                                "palette": "dog_classic"
                            },
                            "display_type": "area"
                        }
                    ]
                }
            },
            {
                "id": 5228989338718062,
                "definition": {
                    "title": "Warm Cache invocations",
                    "title_size": "16",
                    "title_align": "left",
                    "show_legend": true,
                    "legend_layout": "horizontal",
                    "legend_columns": [
                        "avg",
                        "min",
                        "max",
                        "value",
                        "sum"
                    ],
                    "time": {},
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "Num of invocations",
                                    "formula": "query6"
                                }
                            ],
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.warmcache.execution.processed{env:production,portal:{{ portal_name }}}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query6"
                                }
                            ],
                            "response_format": "timeseries",
                            "style": {
                                "palette": "dog_classic",
                                "line_type": "solid",
                                "line_width": "normal"
                            },
                            "display_type": "bars"
                        }
                    ]
                }
            }
        ]
    }
}

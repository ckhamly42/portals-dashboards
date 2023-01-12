{
    "id": 6697905901622872,
    "definition": {
        "title": "Portal: {{ portal_name }} payment status",
        "type": "group",
        "show_title": true,
        "layout_type": "ordered",
        "widgets": [
            {
                "id": 4088859928790909,
                "definition": {
                    "title": "Payment accepted vs Declined resons",
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
                                    "style": {
                                        "palette": "red"
                                    },
                                    "formula": "query1"
                                },
                                {
                                    "style": {
                                        "palette": "green",
                                        "palette_index": 3
                                    },
                                    "alias": "Accepted",
                                    "formula": "query2"
                                }
                            ],
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.declined{portal:{{ portal_name }}} by {reason}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.accepted{portal:{{ portal_name }}}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query2"
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
            },
            {
                "id": 1259172781923338,
                "definition": {
                    "title": "Payments Accepted",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.accepted{env:production,portal:{{ portal_name }}}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "sum"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "accepted",
                    "precision": 0
                }
            },
            {
                "id": 5089607168091598,
                "definition": {
                    "title": "Payment Success",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.success{env:production,execution:automatic,portal:{{ portal_name }}}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "sum"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "paid",
                    "text_align": "center",
                    "precision": 0
                }
            },
            {
                "id": 5089607168091598,
                "definition": {
                    "title": "Payment PPF Success",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.success{env:production,execution:automatic,portal:{{ portal_name }},auto_remediation:true}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "sum"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "remediated",
                    "text_align": "center",
                    "precision": 0
                }
            },
            {
                "id": 7909021801579760,
                "definition": {
                    "title": "Last Batch Payment queued",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "avg:flex2.billing_service.api.portals.tasks.submitted{env:production,service:portal-payment-executor-*,pool_name:{{ portal_name }}}",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "last"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "queued",
                    "precision": 0
                }
            },
            {
                "id": 7515833294650892,
                "definition": {
                    "title": "Payment attempts in pre-payment",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.failed_attempt{env:production,portal:{{ portal_name }},stage:pre_payment}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query2",
                                    "aggregator": "sum"
                                }
                            ],
                            "formulas": [
                                {
                                    "formula": "query2"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "attempts",
                    "precision": 0
                }
            },
            {
                "id": 6664569397738734,
                "definition": {
                    "title": "Payment attempts in post-payment",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "query_value",
                    "requests": [
                        {
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.failed_attempt{env:production,portal:{{ portal_name }},stage:post_payment}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query2",
                                    "aggregator": "sum"
                                }
                            ],
                            "formulas": [
                                {
                                    "formula": "query2"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "attempts",
                    "precision": 0
                }
            },
            {
                "id": 1216751611001316,
                "definition": {
                    "title": "Payment Canceled PrePayment",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.canceled{env:production,portal:{{ portal_name }},stage:pre_payment}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "sum"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "canceled",
                    "precision": 0
                }
            },
            {
                "id": 919102433583484,
                "definition": {
                    "title": "Payment Canceled PostPayment",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.canceled{env:production,portal:{{ portal_name }},stage:post_payment}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1",
                                    "aggregator": "sum"
                                }
                            ]
                        }
                    ],
                    "autoscale": false,
                    "custom_unit": "canceled",
                    "precision": 0
                }
            },
            {
                "id": 6671548279024288,
                "definition": {
                    "title": "Avg successful payment runtime",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "conditional_formats": [
                                {
                                    "comparator": ">",
                                    "palette": "white_on_red",
                                    "value": 180000000000
                                },
                                {
                                    "comparator": ">=",
                                    "palette": "white_on_yellow",
                                    "value": 60000000000
                                },
                                {
                                    "comparator": "<",
                                    "palette": "white_on_green",
                                    "value": 60000000000
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:portal-payment-executor* operation_name:portals.executeTask env:production @portal_name:{{ portal_name }} @http.status_code:200"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "metric": "@duration",
                                        "interval": 600000,
                                        "aggregation": "avg"
                                    },
                                    "name": "query1",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": []
                                }
                            ]
                        }
                    ],
                    "autoscale": true,
                    "precision": 2
                }
            },
            {
                "id": 6671548279024288,
                "definition": {
                    "title": "Avg failed payment runtime",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_value",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "conditional_formats": [
                                {
                                    "comparator": ">",
                                    "palette": "white_on_red",
                                    "value": 180000000000
                                },
                                {
                                    "comparator": ">=",
                                    "palette": "white_on_yellow",
                                    "value": 60000000000
                                },
                                {
                                    "comparator": "<",
                                    "palette": "white_on_green",
                                    "value": 60000000000
                                }
                            ],
                            "response_format": "scalar",
                            "queries": [
                                {
                                    "search": {
                                        "query": "service:portal-payment-executor* operation_name:portals.executeTask env:production @portal_name:{{ portal_name }} @http.status_code:500"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "metric": "@duration",
                                        "interval": 600000,
                                        "aggregation": "avg"
                                    },
                                    "name": "query1",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": []
                                }
                            ]
                        }
                    ],
                    "autoscale": true,
                    "precision": 2
                }
            },
            {
                "id": 2882358954574254,
                "definition": {
                    "title": "Last reported execution errors",
                    "title_size": "16",
                    "title_align": "left",
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
                                        "query": "service:portal-payment-executor* operation_name:portals.executeTask env:production @portal_name:{{ portal_name }}"
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
                "id": 1116190008395978,
                "definition": {
                    "title": "Customers in POST_PAYMENT_FAILURE",
                    "title_size": "16",
                    "title_align": "left",
                    "type": "query_table",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1",
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
                                        "query": "service:portal-payment-executor* operation_name:portals.executeTask env:production @execution_status:POST_PAYMENT_FAILURE @portal_name:{{ portal_name }}"
                                    },
                                    "data_source": "spans",
                                    "compute": {
                                        "aggregation": "count"
                                    },
                                    "name": "query1",
                                    "indexes": [
                                        "trace-search"
                                    ],
                                    "group_by": [
                                        {
                                            "facet": "@customer_id",
                                            "sort": {
                                                "aggregation": "count",
                                                "order": "desc"
                                            },
                                            "limit": 10
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "id": 7711458022328532,
                "definition": {
                    "title": "Invocation per status",
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
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "processed",
                                    "formula": "query1"
                                },
                                {
                                    "alias": "interrupred_resource_held",
                                    "formula": "query2"
                                },
                                {
                                    "alias": "interrupred_embargo",
                                    "formula": "query3"
                                },
                                {
                                    "alias": "interrupred_bill_not_found",
                                    "formula": "query4"
                                }
                            ],
                            "response_format": "timeseries",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.processed{env:production,portal:{{ portal_name }}}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query1"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.interrupted{env:production,portal:{{ portal_name }},reason:resource_held}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query2"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.interrupted{env:production,portal:{{ portal_name }},reason:resource_held}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query3"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.interrupted{env:production,portal:{{ portal_name }},reason:bill_not_found}.as_count()",
                                    "data_source": "metrics",
                                    "name": "query4"
                                }
                            ],
                            "style": {
                                "palette": "dog_classic",
                                "line_type": "solid",
                                "line_width": "normal"
                            },
                            "display_type": "bars"
                        }
                    ]
                }
            },
            {
                "id": 1544785668650194,
                "definition": {
                    "title": "Success vs Failures",
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
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "alias": "Success",
                                    "style": {
                                        "palette_index": 2,
                                        "palette": "green"
                                    },
                                    "formula": "query1"
                                },
                                {
                                    "alias": "Failure",
                                    "style": {
                                        "palette_index": 4,
                                        "palette": "warm"
                                    },
                                    "formula": "query2"
                                }
                            ],
                            "response_format": "timeseries",
                            "queries": [
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.success{env:production,execution:automatic,portal:{{ portal_name }}}.as_count().rollup(sum, 600)",
                                    "data_source": "metrics",
                                    "name": "query1"
                                },
                                {
                                    "query": "sum:flex2.billing_service.api.portals.payments.execution.failed_attempt{env:production,portal:{{ portal_name }}}.as_count().rollup(sum, 600)",
                                    "data_source": "metrics",
                                    "name": "query2"
                                }
                            ],
                            "style": {
                                "palette": "dog_classic",
                                "line_type": "solid",
                                "line_width": "normal"
                            },
                            "display_type": "area"
                        }
                    ]
                }
            },
            {
                "id": 5174453771022650,
                "definition": {
                    "title": "Payment queue length",
                    "title_size": "16",
                    "title_align": "left",
                    "time": {},
                    "type": "timeseries",
                    "requests": [
                        {
                            "formulas": [
                                {
                                    "formula": "query1"
                                }
                            ],
                            "queries": [
                                {
                                    "query": "avg:flex2.billing_service.api.portals.tasks.submitted{env:production,service:portal-payment-executor-*,pool_name:{{ portal_name }}}.rollup(avg, 600)",
                                    "data_source": "metrics",
                                    "name": "query1"
                                }
                            ],
                            "response_format": "timeseries",
                            "style": {
                                "palette": "dog_classic",
                                "line_type": "solid",
                                "line_width": "normal"
                            },
                            "display_type": "area"
                        }
                    ]
                }
            }
        ]
    }
}

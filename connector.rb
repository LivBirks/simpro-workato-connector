{
  title: "Simpro",

    connection: {
      fields: [{
          name: "subdomain",
          label: "Subdomain",
          control_type: "subdomain",
          url: ".simprosuite.com",
          optional: false,
          hint: "Enter your sharepoint subdomain as found in your Simpro URL. If your Simpro URL is <b>https://abc..simprosuite.com</b>, then subdomain is <b>abc</b>."
        },
        {
          name: "api_key",
          label: "API Key",
          control_type: 'password',
          optional: false,
          hint: "For more info on API Keys, see "\
          "<a href='https://developer.simprogroup.com/apidoc/?page=5b265889ce433f9710dcef721505c158' "\
          "target='_blank'>here</a>"
        }
      ],

      authorization: {
        type: "custom_auth",

        # Calendly uses header auth(X - Token: < api key > )
        apply: lambda do | connection |
            headers(Authorization: "Bearer #{connection["api_key"]}")

          end
      },

      base_uri: lambda do | connection |
          "https://#{connection["subdomain"]}.simprosuite.com"
      end
    },

  test: lambda do | connection |
      get("/api/v1.0/companies/")
    end,

  object_definitions: {
    output_create_job: {
      fields: lambda do |  _connection, _config_fields | [
        {
          label: "ID",
          type: "integer",
          name: "ID"
        },
        {
          control_type: "text",
          label: "Type",
          type: "string",
          name: "Type"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Company name",
              type: "string",
              name: "CompanyName"
            },
            {
              label: "Given name",
              type: "string",
              name: "GivenName"
            },
            {
              label: "Family name",
              type: "string",
              name: "FamilyName"
            }
          ],
          label: "Customer",
          type: "object",
          name: "Customer"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Start date",
              type: "string",
              name: "StartDate"
            },
            {
              label: "End date",
              type: "string",
              name: "EndDate"
            },
            {
              label: "Contract no",
              type: "string",
              name: "ContractNo"
            }
          ],
          label: "Customer contract",
          type: "object",
          name: "CustomerContract"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Given name",
              type: "string",
              name: "GivenName"
            },
            {
              label: "Family name",
              type: "string",
              name: "FamilyName"
            }
          ],
          label: "Customer contact",
          type: "object",
          name: "CustomerContact"
        },
        {
          name: "AdditionalContacts",
          type: "array",
          of: "object",
          label: "Additional contacts",
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Given name",
              type: "string",
              name: "GivenName"
            },
            {
              label: "Family name",
              type: "string",
              name: "FamilyName"
            }
          ]
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            }
          ],
          label: "Site",
          type: "object",
          name: "Site"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Given name",
              type: "string",
              name: "GivenName"
            },
            {
              label: "Family name",
              type: "string",
              name: "FamilyName"
            }
          ],
          label: "Site contact",
          type: "object",
          name: "SiteContact"
        },
        {
          label: "Order no",
          type: "string",
          name: "OrderNo"
        },
        {
          label: "Request no",
          type: "string",
          name: "RequestNo"
        },
        {
          label: "Name",
          type: "string",
          name: "Name"
        },
        {
          label: "Description",
          type: "string",
          name: "Description"
        },
        {
          label: "Notes",
          type: "string",
          name: "Notes"
        },
        {
          label: "Date issued",
          type: "string",
          name: "DateIssued"
        },
        {
          label: "Due date",
          type: "string",
          name: "DueDate"
        },
        {
          label: "Due time",
          type: "string",
          name: "DueTime"
        },
        {
          name: "Tags",
          type: "array",
          of: "object",
          label: "Tags",
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            }
          ]
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Type",
              type: "string",
              name: "Type"
            },
            {
              label: "Type ID",
              type: "integer",
              name: "TypeId"
            }
          ],
          label: "Salesperson",
          type: "object",
          name: "Salesperson"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Type",
              type: "string",
              name: "Type"
            },
            {
              label: "Type ID",
              type: "integer",
              name: "TypeId"
            }
          ],
          label: "Project manager",
          type: "object",
          name: "ProjectManager"
        },
        {
          name: "Technicians",
          type: "array",
          of: "object",
          label: "Technicians",
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Type",
              type: "string",
              name: "Type"
            },
            {
              label: "Type ID",
              type: "integer",
              name: "TypeId"
            }
          ]
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Type",
              type: "string",
              name: "Type"
            },
            {
              label: "Type ID",
              type: "integer",
              name: "TypeId"
            }
          ],
          label: "Technician",
          type: "object",
          name: "Technician"
        },
        {
          label: "Stage",
          type: "string",
          name: "Stage"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Color",
              type: "string",
              name: "Color"
            }
          ],
          label: "Status",
          type: "object",
          name: "Status"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              label: "Days",
              type: "integer",
              name: "Days"
            },
            {
              label: "Hours",
              type: "integer",
              name: "Hours"
            },
            {
              label: "Minutes",
              type: "integer",
              name: "Minutes"
            }
          ],
          label: "Response time",
          type: "object",
          name: "ResponseTime"
        },
        {
          label: "Is variation",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Is variation",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "IsVariation"
          },
          type: "boolean",
          name: "IsVariation"
        },
        {
          name: "LinkedVariations",
          type: "array",
          of: "object",
          label: "Linked variations",
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Description",
              type: "string",
              name: "Description"
            },
            {
              properties: [
                {
                  label: "Ex tax",
                  type: "integer",
                  name: "ExTax"
                },
                {
                  label: "Tax",
                  type: "integer",
                  name: "Tax"
                },
                {
                  label: "Inc tax",
                  type: "integer",
                  name: "IncTax"
                }
              ],
              label: "Total",
              type: "object",
              name: "Total"
            }
          ]
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              label: "Description",
              type: "string",
              name: "Description"
            },
            {
              properties: [
                {
                  label: "Ex tax",
                  type: "integer",
                  name: "ExTax"
                },
                {
                  label: "Tax",
                  type: "integer",
                  name: "Tax"
                },
                {
                  label: "Inc tax",
                  type: "integer",
                  name: "IncTax"
                }
              ],
              label: "Total",
              type: "object",
              name: "Total"
            }
          ],
          label: "Converted from quote",
          type: "object",
          name: "ConvertedFromQuote"
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Type",
              type: "string",
              name: "Type"
            },
            {
              control_type: "text",
              label: "Date",
              render_input: "date_time_conversion",
              parse_output: "date_time_conversion",
              type: "date_time",
              name: "Date"
            }
          ],
          label: "Converted from",
          type: "object",
          name: "ConvertedFrom"
        },
        {
          control_type: "text",
          label: "Date modified",
          render_input: "date_time_conversion",
          parse_output: "date_time_conversion",
          type: "date_time",
          name: "DateModified"
        },
        {
          control_type: "text",
          label: "Auto adjust status",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Auto adjust status",
            control_type: "text",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "AutoAdjustStatus"
          },
          type: "boolean",
          name: "AutoAdjustStatus"
        },
        {
          control_type: "text",
          label: "Is retention enabled",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Is retention enabled",
            control_type: "text",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "IsRetentionEnabled"
          },
          type: "boolean",
          name: "IsRetentionEnabled"
        },
        {
          properties: [
            {
              label: "Ex tax",
              type: "integer",
              name: "ExTax"
            },
            {
              label: "Tax",
              type: "integer",
              name: "Tax"
            },
            {
              control_type: "number",
              label: "Inc tax",
              parse_output: "float_conversion",
              type: "number",
              name: "IncTax"
            }
          ],
          label: "Total",
          type: "object",
          name: "Total"
        },
        {
          properties: [
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Committed",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Committed"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Materials cost",
              type: "object",
              name: "MaterialsCost"
            },
            {
              properties: [
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Committed",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Committed"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Total",
                  type: "object",
                  name: "Total"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Committed",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Committed"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Labor",
                  type: "object",
                  name: "Labor"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Committed",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Committed"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Labor hours",
                  type: "object",
                  name: "LaborHours"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Committed",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Committed"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Plant and equipment",
                  type: "object",
                  name: "PlantAndEquipment"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Plant and equipment hours",
                  type: "object",
                  name: "PlantAndEquipmentHours"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    }
                  ],
                  label: "Commission",
                  type: "object",
                  name: "Commission"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Committed",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Committed"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Overhead",
                  type: "object",
                  name: "Overhead"
                }
              ],
              label: "Resources cost",
              type: "object",
              name: "ResourcesCost"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Materials markup",
              type: "object",
              name: "MaterialsMarkup"
            },
            {
              properties: [
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Total",
                  type: "object",
                  name: "Total"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Labor",
                  type: "object",
                  name: "Labor"
                },
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "Actual",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Actual"
                    },
                    {
                      control_type: "number",
                      label: "Estimate",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Estimate"
                    },
                    {
                      control_type: "number",
                      label: "Revised",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revised"
                    },
                    {
                      control_type: "number",
                      label: "Revized",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "Revized"
                    }
                  ],
                  label: "Plant and equipment",
                  type: "object",
                  name: "PlantAndEquipment"
                }
              ],
              label: "Resources markup",
              type: "object",
              name: "ResourcesMarkup"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Adjusted",
              type: "object",
              name: "Adjusted"
            },
            {
              control_type: "number",
              label: "Membership discount",
              parse_output: "float_conversion",
              type: "number",
              name: "MembershipDiscount"
            },
            {
              control_type: "number",
              label: "Discount",
              parse_output: "float_conversion",
              type: "number",
              name: "Discount"
            },
            {
              control_type: "number",
              label: "ST cs",
              parse_output: "float_conversion",
              type: "number",
              name: "STCs"
            },
            {
              control_type: "number",
              label: "VEE cs",
              parse_output: "float_conversion",
              type: "number",
              name: "VEECs"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Gross profit loss",
              type: "object",
              name: "GrossProfitLoss"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Gross margin",
              type: "object",
              name: "GrossMargin"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Nett profit loss",
              type: "object",
              name: "NettProfitLoss"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Actual",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Actual"
                },
                {
                  control_type: "number",
                  label: "Estimate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Estimate"
                },
                {
                  control_type: "number",
                  label: "Revised",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revised"
                },
                {
                  control_type: "number",
                  label: "Revized",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Revized"
                }
              ],
              label: "Nett margin",
              type: "object",
              name: "NettMargin"
            },
            {
              control_type: "number",
              label: "Invoiced value",
              parse_output: "float_conversion",
              type: "number",
              name: "InvoicedValue"
            },
            {
              control_type: "number",
              label: "Invoice percentage",
              parse_output: "float_conversion",
              type: "number",
              name: "InvoicePercentage"
            }
          ],
          label: "Totals",
          type: "object",
          name: "Totals"
        },
        {
          name: "CustomFields",
          type: "array",
          of: "object",
          label: "Custom fields",
          properties: [
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                },
                {
                  control_type: "text",
                  label: "Type",
                  type: "string",
                  name: "Type"
                },
                {
                  name: "ListItems",
                  type: "array",
                  of: "string",
                  control_type: "text",
                  label: "List items"
                },
                {
                  control_type: "text",
                  label: "Is mandatory",
                  render_input: {},
                  parse_output: {},
                  toggle_hint: "Select from option list",
                  toggle_field: {
                    label: "Is mandatory",
                    control_type: "text",
                    toggle_hint: "Use custom value",
                    type: "boolean",
                    name: "IsMandatory"
                  },
                  type: "boolean",
                  name: "IsMandatory"
                }
              ],
              label: "Custom field",
              type: "object",
              name: "CustomField"
            },
            {
              control_type: "text",
              label: "Value",
              type: "string",
              name: "Value"
            }
          ]
        },
        {
          properties: [
            {
              control_type: "text",
              label: "ST cs eligible",
              render_input: {},
              parse_output: {},
              toggle_hint: "Select from option list",
              toggle_field: {
                label: "ST cs eligible",
                control_type: "text",
                toggle_hint: "Use custom value",
                type: "boolean",
                name: "STCsEligible"
              },
              type: "boolean",
              name: "STCsEligible"
            },
            {
              control_type: "text",
              label: "VEE cs eligible",
              render_input: {},
              parse_output: {},
              toggle_hint: "Select from option list",
              toggle_field: {
                label: "VEE cs eligible",
                control_type: "text",
                toggle_hint: "Use custom value",
                type: "boolean",
                name: "VEECsEligible"
              },
              type: "boolean",
              name: "VEECsEligible"
            },
            {
              control_type: "number",
              label: "STC value",
              parse_output: "float_conversion",
              type: "number",
              name: "STCValue"
            },
            {
              control_type: "number",
              label: "VEEC value",
              parse_output: "float_conversion",
              type: "number",
              name: "VEECValue"
            }
          ],
          label: "STC",
          type: "object",
          name: "STC"
        },
        {
          control_type: "text",
          label: "Completed date",
          type: "string",
          name: "CompletedDate"
        },
        {
          control_type: "number",
          label: "Io T job ID",
          parse_output: "float_conversion",
          type: "number",
          name: "IoTJobID"
        }
      ]
      end
      },
    input_update_job: {
      fields: lambda do | _connection, _config_fields |
        [
          {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "companies",
            convert_input: "integer_conversion",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id", # cahnge me to company_id
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              convert_input: "integer_conversion",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "job_id",
            label: "Job ID",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "job_list",
            convert_input: "integer_conversion",
            pick_list_params: { company_id: 'company_id' },
            toggle_hint: "Select Job ID",
            toggle_field: {
              name: "job_id",
              label: "Job ID",
              convert_input: "integer_conversion",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Type Job ID",
              hint: "Use 'List all Jobs' action to get Job ID"
            }
          },
          {
            name: "customer_id",
            label: "Customer ID",
            type: "integer",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "customer_contract_id",
            label: "Customer Contract ID",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "customer_contact_id",
            label: "Customer Contact ID",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "additional_contacts",
            label: "Additional Contacts",
            type: "array"
          },
          {
            name: "site_id",
            label: "Site ID",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "site_contact_id",
            label: "Site Contact ID",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "order_number",
            label: "Order Number",
            type: "string"
          },
          {
            name: "request_number",
            label: "Request Number",
            type: "string"
          },
          {
            name: "name",
            label: "Name",
            type: "string"
          },
          {
            name: "description",
            label: "Description",
            type: "string"
          },
          {
            name: "notes",
            label: "Notes",
            type: "string"
          },
          {
            name: "date_issued",
            label: "Date Issued",
            type: "string"
          },
          {
            name: "due_date",
            label: "Due Date",
            type: "string"
          },
          {
            name: "due_time",
            label: "Due Time",
            type: "string"
          },
          {
            name: "tags",
            label: "Tags",
            type: "string",
            hint: "Array of integers"
          },
          {
            name: "salesperson_id",
            label: "Salesperson ID",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "project_manager_id",
            label: "Project Manager ID",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "technician_id",
            label: "Technician ID",
            control_type: "integer",
            type: "int",
            convert_input: "integer_conversion"
          },
          {
            name: "stage",
            label: "Stage",
            type: "string"
          },
          {
            name: "status_id",
            label: "Status",
            type: "int",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "resonse_time_id",
            label: "Response Time ID",
            type: "string"
          },
          {
            name: "completed_date",
            label: "Completed Date",
            type: "string"
          }
        ]
      end
      },
    input_create_job: {
      fields: lambda do | _connection, _config_fields |
        [
          {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "companies",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id",
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "type",
            label: "Type",
            type: "string",
            control_type: "select",
            optional: false,
            pick_list: "job_type",
            toggle_hint: "Select Job Type",
            toggle_field: {
              name: "type",
              label: "Type",
              type: "string",
              control_type: "string",
              optional: false,
              toggle_hint: "Type Job Type",
              hint: "Valid values: 'Project', 'Service', 'Prepaid'"
            }
          },
          {
            name: "customer_id",
            label: "Customer",
            optional: false,
            type: "integer",
            convert_input: "integer_conversion",
            control_type: "select",
            pick_list: "customers",
            pick_list_params: { company_id: 'company_id' },
            toggle_hint: "Select Customer Name",
            toggle_field:{
              name: "customer_id",
              label: "Customer ID",
              toggle_hint:"Use Customer ID",
              type: "integer",
              hint: "Use 'List all Customers' action to get Customer ID",
              control_type: "integer",
              convert_input: "integer_conversion"
            }
          },
          {
            name: "customer_contract_id",
            label: "Customer Contract ID",
            type: "integer",
            hint: "ID of a customer contract",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "customer_contact_id",
            label: "Customer Contact ID",
            type: "integer",
            hint: "ID of a contact",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "additional_contacts",
            label: "Additional Contacts",
            hint: "ID of a customer contact",
            type: "array",
            of: "string"
          },
          {
            name: "site_id",
            label: "Site",
            type: "integer",
            convert_input: "integer_conversion",
            control_type: "select",
            optional: false,
            pick_list: "sites",
            toggle_hint: "Use Site Name",
            pick_list_params: { company_id: 'company_id' },
            toggle_field: {
              name: "site_id", # cahnge me to company_id
              label: "Site ID",
              type: "integer",
              control_type: "integer",
              convert_input: "integer_conversion",
              optional: false,
              toggle_hint: "Select Site ID",
              hint: "Use 'List all Sites' action to get Site ID"
            }
          },
          {
            name: "site_contact_id",
            label: "Site Contact ID",
            type: "integer",
            hint: "ID of a contact",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "order_number",
            label: "Order Number",
            type: "string"
          },
          {
            name: "request_number",
            label: "Request Number",
            hint: "This column refers to job name and it is deprecated.",
            type: "string"
          },
          {
            name: "name",
            label: "Name",
            type: "string"
          },
          {
            name: "description",
            label: "Description",
            type: "string"
          },
          {
            name: "notes",
            label: "Notes",
            type: "string"
          },
          {
            name: "date_issued",
            label: "Date Issued",
            hint: "Date in YYYY-MM-DD format eg. 2021-04-22. Null dates can be filtered by Field=null or Field=ne(null)",
            type: "string"
          },
          {
            name: "due_date",
            label: "Due Date",
            hint: "This field becomes mandatory when Mandatory Due Date setting for jobs is turned on in system setup defaults.",
            optional: false,
            type: "date",
            control_type: "date"
          },
          {
            name: "due_time",
            label: "Due Time",
            hint: "Time in HH:MM format eg. 23:59",
            type: "string"
          },
          {
            name: "tags",
            label: "Tags",
            type: "array",
            of: "integer",
            hint: "ID of a project tag"
          },
          {
            name: "salesperson_id",
            label: "Salesperson ID",
            type: "integer",
            hint: "ID of a staff",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "project_manager_id",
            label: "Project Manager ID",
            type: "integer",
            hint: "ID of a staff",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "technician_id",
            label: "Technician ID",
            control_type: "integer",
            hint: "ID of a staff",
            type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "stage",
            label: "Stage",
            hint: "Jobs progress through stages: from pending, to in progress, to complete, to invoiced. Once a completed job has been fully invoiced, its status will be set to invoiced",
            type: "string"
          },
          {
            name: "status_id",
            label: "Status",
            type: "integer",
            hint: "ID of a project status code",
            control_type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "resonse_time_id",
            label: "Response Time ID",
            hint: "ID of a customer response time",
            control_type: "integer",
            type: "integer",
            convert_input: "integer_conversion"
          },
          {
            name: "completed_date",
            label: "Completed Date",
            hint: "Date in YYYY-MM-DD format eg. 2021-04-22. Null dates can be filtered by Field=null or Field=ne(null)",
            type: "string"
          }
        ]
      end
      },
    input_update_job_status: {
      fields: lambda do | _connection, _config_fields |
        [
          {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "companies",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id", # change me to company_id
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "job_id",
            label: "Job ID",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "job_list",
            pick_list_params: { company_id: 'company_id' },
            toggle_hint: "Select Job ID",
            toggle_field: {
              name: "job_id", # change me to company_id
              label: "Job ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Type Job ID",
              hint: "Use 'List all Jobs' action to get Job ID"
            }
          },
          {
            name: "status_id",
            label: "Status",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "statuses2",
            pick_list_params: { company_id: 'company_id' },
            toggle_hint: "Select Status Label",
            toggle_field: {
              name: "status_id",
              label: "Status ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Status ID",
              hint: "Use 'List all Statuses' action to get Status ID"
            }
          }
        ]
      end
      },
    output_update_job_status: {
      fields: lambda do | _connection, _config_fields |
        [
          {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "companies",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id", # change me to company_id
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "job_id",
            label: "Job ID",
            type: "integer",
            optional: false
          },
          {
            name: "status_id",
            label: "Status ID",
            type: "integer",
            optional: false
          }
        ]
      end
      },
    input_job_status_event: {
      fields: lambda do | _connection, _config_fields |
      [
        {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "companies",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id", # change me to company_id
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
        {
          name: "Description",
          type: "string"
        }
      ]
      end
      },

    output_job_status_event: {
      fields: lambda do | _connection, _config_fields |
      [
        {
          name: "ID",
          type: "integer"
        },
        {
          name: "build",
          type: "string"
        },
        {
          name: "description",
          type: "string"
        },
        {
          name: "name",
          type: "string"
        },
        {
          name: "action",
          type: "string"
        },
        {
          name: "reference",
          type: "object",
          properties: [
            {
              name: "companyID",
              type: "integer"
            },
            {
              name: "jobID",
              type: "integer"
            },
            {
              name: "statusID",
              type: "integer"
            }
          ]
        },
        {
          name: "date_triggered",
          type: "date_time"
        }
      ]
      end
      },
    output_job_created_event: {
      fields: lambda do | _connection, _config_fields |
      [
        {
          name: "ID",
          type: "integer"
        },
        {
          name: "build",
          type: "string"
        },
        {
          name: "description",
          type: "string"
        },
        {
          name: "name",
          type: "string"
        },
        {
          name: "action",
          type: "string"
        },
        {
          name: "reference",
          type: "object",
          properties: [
            {
              name: "companyID",
              type: "integer"
            },
            {
              name: "jobID",
              type: "integer"
            }
          ]
        },
        {
          name: "date_triggered",
          type: "date_time"
        }
      ]
      end
      },
    input_list_all_companies: {
      fields: lambda do | _connection, _config_fields |
          [
            {
              name: "search",
              type: "string"
            },
            {
              name: "columns",
              type: "string"
            },
            {
              name: "pageSize",
              type: "integer",
            },
            {
              name: "page",
              type: "integer",
            },
            {
              name: "orderby",
              type: "string",
            },
            {
              name: "limit",
              type: "integer",
            },
          ]
        end
      },

    input_get_job: {
      fields: lambda do | _connection, _config_fields | [
          {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            hint: "A build with Multi-company setup may have companyID >= 0, other builds use 0 by default.",
            optional: false,
            pick_list: "companies",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id",
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "job_id",
            label: "Job ID",
            type: "integer",
            control_type: "integer",
            optional: false,
            toggle_hint: "Type Job ID",
            pick_list: nil,
            pick_list_params: nil,
            hint: "Use 'List all Jobs' action to get Job ID",
            toggle_field: {
              name: "job_id",
              label: "Job ID",
              hint: "A valid job id",
              type: "integer",
              control_type: "select",
              optional: false,
              pick_list: "job_list",
              pick_list_params: { company_id: 'company_id' },
              toggle_hint: "Select Job ID"
            }
          },
          {
            name: "columns",
            type: "string",
            hint: "When listing or searching a resource, specify which columns to be displayed. Example: 'columns=ID,Name'",
            optional: true
          }
        ]
        end
      },

    output_list_all_companies: {
      fields: lambda do | _connection, _config_fields | [
        {
          "name": "Companies",
          "type": "array",
          "of": "object",
          "label": "Companies",
          "properties": [
            {
              "control_type": "integer",
              "label": "ID",
              "type": "integer",
              "name": "ID",
              "details": {
                "real_name": "ID"
              }
            },
            {
              "control_type": "text",
              "label": "Name",
              "type": "string",
              "name": "Name",
              "details": {
                "real_name": "Name"
              }
            }
          ],
          "details": {
            "fake_array": true,
            "real_name": "array"
          }
        }
      ]
        end
      },
    output_get_job: {
      fields: lambda do | _connection, _config_fields | [{
            label: "ID",
            type: "integer",
            name: "ID",
            details: {
              real_name: "ID"
            }
          },
          {
            control_type: "text",
            label: "Type",
            type: "string",
            name: "Type",
            details: {
              real_name: "Type"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "number",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Company name",
                type: "string",
                name: "CompanyName",
                details: {
                  real_name: "CompanyName"
                }
              },
              {
                label: "Given name",
                type: "string",
                name: "GivenName",
                details: {
                  real_name: "GivenName"
                }
              },
              {
                label: "Family name",
                type: "string",
                name: "FamilyName",
                details: {
                  "real_name": "FamilyName"
                }
              }
            ],
            label: "Customer",
            type: "object",
            name: "Customer",
            details: {
              "real_name": "Customer"
            }
          },
          {
            properties: [{
                label: "ID",
                parse_output: "float_conversion",
                type: "integer",
                name: "ID",
                details: {
                  "real_name": "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Start date",
                type: "string",
                name: "StartDate",
                details: {
                  real_name: "StartDate"
                }
              },
              {
                label: "End date",
                type: "string",
                name: "EndDate",
                details: {
                  real_name: "EndDate"
                }
              },
              {
                label: "Contract no",
                type: "string",
                name: "ContractNo",
                details: {
                  real_name: "ContractNo"
                }
              }
            ],
            label: "Customer contract",
            type: "object",
            name: "CustomerContract",
            details: {
              real_name: "CustomerContract"
            }
          },
          {
            "properties": [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Given name",
                type: "string",
                name: "GivenName",
                details: {
                  real_name: "GivenName"
                }
              },
              {
                label: "Family name",
                type: "string",
                name: "FamilyName",
                details: {
                  real_name: "FamilyName"
                }
              }
            ],
            label: "Customer contact",
            type: "object",
            name: "CustomerContact",
            details: {
              real_name: "CustomerContact"
            }
          },
          {
            name: "AdditionalContacts",
            type: "array",
            of: "object",
            label: "Additional contacts",
            properties: [{
                label: "ID",
                parse_output: "float_conversion",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Given name",
                type: "string",
                name: "GivenName",
                details: {
                  real_name: "GivenName"
                }
              },
              {
                label: "Family name",
                type: "string",
                name: "FamilyName",
                details: {
                  real_name: "FamilyName"
                }
              }
            ],
            details: {
              real_name: "AdditionalContacts"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              }
            ],
            label: "Site",
            type: "object",
            name: "Site",
            details: {
              real_name: "Site"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Given name",
                type: "string",
                name: "GivenName",
                details: {
                  real_name: "GivenName"
                }
              },
              {
                label: "Family name",
                type: "string",
                name: "FamilyName",
                details: {
                  real_name: "FamilyName"
                }
              }
            ],
            label: "Site contact",
            type: "object",
            name: "SiteContact",
            details: {
              real_name: "SiteContact"
            }
          },
          {
            label: "Order no",
            type: "string",
            name: "OrderNo",
            details: {
              real_name: "OrderNo"
            }
          },
          {
            label: "Request no",
            type: "string",
            name: "RequestNo",
            details: {
              real_name: "RequestNo"
            }
          },
          {
            label: "Name",
            type: "string",
            name: "Name",
            details: {
              real_name: "Name"
            }
          },
          {
            label: "Description",
            type: "string",
            name: "Description",
            details: {
              real_name: "Description"
            }
          },
          {
            label: "Notes",
            type: "string",
            name: "Notes",
            details: {
              "real_name": "Notes"
            }
          },
          {
            label: "Date issued",
            type: "string",
            name: "DateIssued",
            details: {
              real_name: "DateIssued"
            }
          },
          {
            label: "Due date",
            type: "string",
            name: "DueDate",
            details: {
              "real_name": "DueDate"
            }
          },
          {
            label: "Due time",
            type: "string",
            name: "DueTime",
            details: {
              real_name: "DueTime"
            }
          },
          {
            name: "Tags",
            type: "array",
            of: "object",
            label: "Tags",
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  "real_name": "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              }
            ],
            details: {
              real_name: "Tags"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Type",
                type: "string",
                name: "Type",
                details: {
                  real_name: "Type"
                }
              },
              {
                label: "Type ID",
                type: "integer",
                name: "TypeId",
                details: {
                  real_name: "TypeId"
                }
              }
            ],
            label: "Salesperson",
            type: "object",
            name: "Salesperson",
            details: {
              real_name: "Salesperson"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  "real_name": "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Type",
                type: "string",
                name: "Type",
                details: {
                  real_name: "Type"
                }
              },
              {
                label: "Type ID",
                type: "integer",
                name: "TypeId",
                details: {
                  real_name: "TypeId"
                }
              }
            ],
            label: "Project manager",
            type: "object",
            name: "ProjectManager",
            details: {
              real_name: "ProjectManager"
            }
          },
          {
            name: "Technicians",
            type: "array",
            of: "object",
            label: "Technicians",
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Type",
                type: "string",
                name: "Type",
                details: {
                  real_name: "Type"
                }
              },
              {
                label: "Type ID",
                type: "integer",
                name: "TypeId",
                details: {
                  real_name: "TypeId"
                }
              }
            ],
            details: {
              real_name: "Technicians"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Type",
                type: "string",
                name: "Type",
                details: {
                  real_name: "Type"
                }
              },
              {
                label: "Type ID",
                type: "number",
                name: "TypeId",
                details: {
                  "real_name": "TypeId"
                }
              }
            ],
            label: "Technician",
            type: "object",
            name: "Technician",
            details: {
              real_name: "Technician"
            }
          },
          {
            label: "Stage",
            type: "string",
            name: "Stage",
            details: {
              real_name: "Stage"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Color",
                type: "string",
                name: "Color",
                details: {
                  real_name: "Color"
                }
              }
            ],
            label: "Status",
            type: "object",
            name: "Status",
            details: {
              real_name: "Status"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Name",
                type: "string",
                name: "Name",
                details: {
                  real_name: "Name"
                }
              },
              {
                label: "Days",
                type: "integer",
                name: "Days",
                details: {
                  real_name: "Days"
                }
              },
              {
                label: "Hours",
                type: "number",
                name: "Hours",
                details: {
                  real_name: "Hours"
                }
              },
              {
                label: "Minutes",
                type: "integer",
                name: "Minutes",
                details: {
                  real_name: "Minutes"
                }
              }
            ],
            label: "Response time",
            type: "object",
            name: "ResponseTime",
            details: {
              real_name: "ResponseTime"
            }
          },
          {
            control_type: "text",
            label: "Is variation",
            render_input: {},
            parse_output: {},
            toggle_hint: "Select from option list",
            toggle_field: {
              label: "Is variation",
              control_type: "text",
              toggle_hint: "Use custom value",
              type: "boolean",
              name: "IsVariation"
            },
            type: "boolean",
            name: "IsVariation",
            details: {
              real_name: "IsVariation"
            }
          },
          {
            name: "LinkedVariations",
            type: "array",
            of: "object",
            label: "Linked variations",
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                label: "Description",
                type: "string",
                name: "Description",
                details: {
                  real_name: "Description"
                }
              },
              {
                properties: [{
                    label: "Ex tax",
                    parse_output: "float_conversion",
                    type: "integer",
                    name: "ExTax",
                    details: {
                      real_name: "ExTax"
                    }
                  },
                  {
                    label: "Tax",
                    type: "integer",
                    name: "Tax",
                    details: {
                      real_name: "Tax"
                    }
                  },
                  {
                    label: "Inc tax",
                    type: "integer",
                    name: "IncTax",
                    details: {
                      real_name: "IncTax"
                    }
                  }
                ],
                label: "Total",
                type: "object",
                name: "Total",
                details: {
                  real_name: "Total"
                }
              }
            ],
            details: {
              real_name: "LinkedVariations"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "number",
                name: "ID",
                details: {
                  real_name: "ID"
                }
              },
              {
                control_type: "text",
                label: "Description",
                type: "string",
                name: "Description",
                details: {
                  real_name: "Description"
                }
              },
              {
                properties: [{
                    label: "Ex tax",
                    type: "integer",
                    name: "ExTax",
                    details: {
                      real_name: "ExTax"
                    }
                  },
                  {
                    label: "Tax",
                    type: "integer",
                    name: "Tax",
                    details: {
                      real_name: "Tax"
                    }
                  },
                  {
                    label: "Inc tax",
                    type: "number",
                    name: "IncTax",
                    details: {
                      real_name: "IncTax"
                    }
                  }
                ],
                label: "Total",
                type: "object",
                name: "Total",
                details: {
                  real_name: "Total"
                }
              }
            ],
            label: "Converted from quote",
            type: "object",
            name: "ConvertedFromQuote",
            details: {
              real_name: "ConvertedFromQuote"
            }
          },
          {
            properties: [{
                label: "ID",
                type: "integer",
                name: "ID",
                details: {
                  "real_name": "ID"
                }
              },
              {
                label: "Type",
                type: "string",
                name: "Type",
                details: {
                  real_name: "Type"
                }
              },
              {
                label: "Date",
                render_input: "date_time_conversion",
                parse_output: "date_time_conversion",
                type: "date_time",
                name: "Date",
                details: {
                  real_name: "Date"
                }
              }
            ],
            label: "Converted from",
            type: "object",
            name: "ConvertedFrom",
            details: {
              real_name: "ConvertedFrom"
            }
          },
          {
            label: "Date modified",
            render_input: "date_time_conversion",
            parse_output: "date_time_conversion",
            type: "date_time",
            name: "DateModified",
            details: {
              real_name: "DateModified"
            }
          },
          {
            label: "Auto adjust status",
            render_input: {},
            parse_output: {},
            toggle_hint: "Select from option list",
            toggle_field: {
              label: "Auto adjust status",
              toggle_hint: "Use custom value",
              type: "boolean",
              name: "AutoAdjustStatus"
            },
            type: "boolean",
            name: "AutoAdjustStatus",
            details: {
              real_name: "AutoAdjustStatus"
            }
          },
          {
            label: "Is retention enabled",
            render_input: {},
            parse_output: {},
            toggle_hint: "Select from option list",
            toggle_field: {
              label: "Is retention enabled",
              control_type: "text",
              toggle_hint: "Use custom value",
              type: "boolean",
              name: "IsRetentionEnabled"
            },
            type: "boolean",
            name: "IsRetentionEnabled",
            details: {
              real_name: "IsRetentionEnabled"
            }
          },
          {
            properties: [{
                label: "Ex tax",
                type: "integer",
                name: "ExTax",
                details: {
                  real_name: "ExTax"
                }
              },
              {
                label: "Tax",
                type: "integer",
                name: "Tax",
                details: {
                  real_name: "Tax"
                }
              },
              {
                label: "Inc tax",
                type: "number",
                name: "IncTax",
                details: {
                  real_name: "IncTax"
                }
              }
            ],
            label: "Total",
            type: "object",
            name: "Total",
            details: {
              real_name: "Total"
            }
          },
          {
            properties: [{
                properties: [{
                    label: "Actual",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    label: "Committed",
                    type: "number",
                    name: "Committed",
                    details: {
                      real_name: "Committed"
                    }
                  },
                  {
                    label: "Estimate",
                    type: "number",
                    nam: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Materials cost",
                type: "object",
                name: "MaterialsCost",
                details: {
                  real_name: "MaterialsCost"
                }
              },
              {
                properties: [{
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Committed",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Committed",
                        details: {
                          real_name: "Committed"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          "real_name": "Revized"
                        }
                      }
                    ],
                    label: "Total",
                    type: "object",
                    name: "Total",
                    details: {
                      real_name: "Total"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Committed",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Committed",
                        details: {
                          real_name: "Committed"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Labor",
                    type: "object",
                    name: "Labor",
                    details: {
                      real_name: "Labor"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Committed",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Committed",
                        details: {
                          real_name: "Committed"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Labor hours",
                    type: "object",
                    name: "LaborHours",
                    details: {
                      real_name: "LaborHours"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Committed",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Committed",
                        details: {
                          real_name: "Committed"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Plant and equipment",
                    type: "object",
                    name: "PlantAndEquipment",
                    details: {
                      real_name: "PlantAndEquipment"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Plant and equipment hours",
                    type: "object",
                    name: "PlantAndEquipmentHours",
                    details: {
                      real_name: "PlantAndEquipmentHours"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      }
                    ],
                    label: "Commission",
                    type: "object",
                    name: "Commission",
                    details: {
                      real_name: "Commission"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Committed",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Committed",
                        details: {
                          real_name: "Committed"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Overhead",
                    type: "object",
                    name: "Overhead",
                    details: {
                      real_name: "Overhead"
                    }
                  }
                ],
                label: "Resources cost",
                type: "object",
                name: "ResourcesCost",
                details: {
                  real_name: "ResourcesCost"
                }
              },
              {
                properties: [{
                    control_type: "number",
                    label: "Actual",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Estimate",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Materials markup",
                type: "object",
                name: "MaterialsMarkup",
                details: {
                  real_name: "MaterialsMarkup"
                }
              },
              {
                properties: [{
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          "real_name": "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Total",
                    type: "object",
                    name: "Total",
                    details: {
                      real_name: "Total"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Labor",
                    type: "object",
                    name: "Labor",
                    details: {
                      real_name: "Labor"
                    }
                  },
                  {
                    properties: [{
                        control_type: "number",
                        label: "Actual",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Actual",
                        details: {
                          real_name: "Actual"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Estimate",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Estimate",
                        details: {
                          real_name: "Estimate"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revised",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revised",
                        details: {
                          real_name: "Revised"
                        }
                      },
                      {
                        control_type: "number",
                        label: "Revized",
                        parse_output: "float_conversion",
                        type: "number",
                        name: "Revized",
                        details: {
                          real_name: "Revized"
                        }
                      }
                    ],
                    label: "Plant and equipment",
                    type: "object",
                    name: "PlantAndEquipment",
                    details: {
                      real_name: "PlantAndEquipment"
                    }
                  }
                ],
                label: "Resources markup",
                type: "object",
                name: "ResourcesMarkup",
                details: {
                  real_name: "ResourcesMarkup"
                }
              },
              {
                properties: [{
                    control_type: "number",
                    label: "Actual",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Estimate",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Adjusted",
                type: "object",
                name: "Adjusted",
                details: {
                  real_name: "Adjusted"
                }
              },
              {
                control_type: "number",
                label: "Membership discount",
                parse_output: "float_conversion",
                type: "number",
                name: "MembershipDiscount",
                details: {
                  real_name: "MembershipDiscount"
                }
              },
              {
                control_type: "number",
                label: "Discount",
                parse_output: "float_conversion",
                type: "number",
                name: "Discount",
                details: {
                  real_name: "Discount"
                }
              },
              {
                control_type: "number",
                label: "ST cs",
                parse_output: "float_conversion",
                type: "number",
                name: "STCs",
                details: {
                  real_name: "STCs"
                }
              },
              {
                control_type: "number",
                label: "VEE cs",
                parse_output: "float_conversion",
                type: "number",
                name: "VEECs",
                details: {
                  real_name: "VEECs"
                }
              },
              {
                properties: [{
                    control_type: "number",
                    label: "Actual",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Estimate",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Gross profit loss",
                type: "object",
                name: "GrossProfitLoss",
                details: {
                  real_name: "GrossProfitLoss"
                }
              },
              {
                properties: [{
                    control_type: "number",
                    label: "Actual",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Estimate",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Gross margin",
                type: "object",
                name: "GrossMargin",
                details: {
                  real_name: "GrossMargin"
                }
              },
              {
                properties: [{
                    control_type: "number",
                    label: "Actual",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Estimate",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Nett profit loss",
                type: "object",
                name: "NettProfitLoss",
                details: {
                  real_name: "NettProfitLoss"
                }
              },
              {
                properties: [{
                    control_type: "number",
                    label: "Actual",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Actual",
                    details: {
                      real_name: "Actual"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Estimate",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Estimate",
                    details: {
                      real_name: "Estimate"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revised",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revised",
                    details: {
                      real_name: "Revised"
                    }
                  },
                  {
                    control_type: "number",
                    label: "Revized",
                    parse_output: "float_conversion",
                    type: "number",
                    name: "Revized",
                    details: {
                      real_name: "Revized"
                    }
                  }
                ],
                label: "Nett margin",
                type: "object",
                name: "NettMargin",
                details: {
                  real_name: "NettMargin"
                }
              },
              {
                control_type: "number",
                label: "Invoiced value",
                parse_output: "float_conversion",
                type: "number",
                name: "InvoicedValue",
                details: {
                  real_name: "InvoicedValue"
                }
              },
              {
                control_type: "number",
                label: "Invoice percentage",
                parse_output: "float_conversion",
                type: "number",
                name: "InvoicePercentage",
                details: {
                  real_name: "InvoicePercentage"
                }
              }
            ],
            label: "Totals",
            type: "object",
            name: "Totals",
            details: {
              real_name: "Totals"
            }
          },
          {
            name: "CustomFields",
            type: "array",
            of: "object",
            label: "Custom fields",
            properties: [{
                properties: [{
                    label: "ID",
                    type: "integer",
                    name: "ID",
                    details: {
                      real_name: "ID"
                    }
                  },
                  {
                    label: "Name",
                    type: "string",
                    name: "Name",
                    details: {
                      real_name: "Name"
                    }
                  },
                  {
                    label: "Type",
                    type: "string",
                    name: "Type",
                    details: {
                      real_name: "Type"
                    }
                  },
                  {
                    name: "ListItems",
                    type: "array",
                    of: "string",
                    label: "List items",
                    details: {
                      real_name: "ListItems"
                    }
                  },
                  {
                    label: "Is mandatory",
                    render_input: {},
                    parse_output: {},
                    toggle_hint: "Select from option list",
                    toggle_field: {
                      label: "Is mandatory",
                      toggle_hint: "Use custom value",
                      type: "boolean",
                      name: "IsMandatory"
                    },
                    type: "boolean",
                    name: "IsMandatory",
                    details: {
                      real_name: "IsMandatory"
                    }
                  }
                ],
                label: "Custom field",
                type: "object",
                name: "CustomField",
                details: {
                  real_name: "CustomField"
                }
              },
              {
                label: "Value",
                type: "string",
                name: "Value",
                details: {
                  real_name: "Value"
                }
              }
            ],
            details: {
              real_name: "CustomFields"
            }
          },
          {
            properties: [{
                control_type: "text",
                label: "ST cs eligible",
                render_input: {},
                parse_output: {},
                toggle_hint: "Select from option list",
                toggle_field: {
                  label: "ST cs eligible",
                  control_type: "text",
                  toggle_hint: "Use custom value",
                  type: "boolean",
                  name: "STCsEligible"
                },
                type: "boolean",
                name: "STCsEligible",
                details: {
                  real_name: "STCsEligible"
                }
              },
              {
                control_type: "text",
                label: "VEE cs eligible",
                render_input: {},
                parse_output: {},
                toggle_hint: "Select from option list",
                toggle_field: {
                  label: "VEE cs eligible",
                  control_type: "text",
                  toggle_hint: "Use custom value",
                  type: "boolean",
                  name: "VEECsEligible"
                },
                type: "boolean",
                name: "VEECsEligible",
                details: {
                  real_name: "VEECsEligible"
                }
              },
              {
                control_type: "number",
                label: "STC value",
                parse_output: "float_conversion",
                type: "number",
                name: "STCValue",
                details: {
                  real_name: "STCValue"
                }
              },
              {
                control_type: "number",
                label: "VEEC value",
                parse_output: "float_conversion",
                type: "number",
                name: "VEECValue",
                details: {
                  real_name: "VEECValue"
                }
              }
            ],
            label: "STC",
            type: "object",
            name: "STC",
            details: {
              real_name: "STC"
            }
          },
          {
            control_type: "text",
            label: "Completed date",
            type: "string",
            name: "CompletedDate",
            details: {
              real_name: "CompletedDate"
            }
          },
          {
            control_type: "number",
            label: "Io T job ID",
            parse_output: "float_conversion",
            type: "number",
            name: "IoTJobID",
            details: {
              real_name: "IoTJobID"
            }
          }
        ]
        end
      },

    input_list_all_jobs: {
      fields: lambda do | _connection, _config_fields | [
        {
          name: "company_id",
          label: "Company",
          type: "number",
          control_type: "select",
          optional: false,
          pick_list: "companies",
          toggle_hint: "Use Company Name",
          toggle_field: {
            name: "company_id", # cahnge me to company_id
            label: "Company ID",
            type: "number",
            control_type: "number",
            optional: false,
            toggle_hint: "Use Company ID",
            hint: "Use 'List all Companies' action to get Company ID"
          }
        }
      ]
      end
      },
    input_list_job_statuses: {
      fields: lambda do | _connection, _config_fields | [
        {
          name: "company_id",
          label: "Company",
          type: "number",
          control_type: "select",
          optional: false,
          pick_list: "companies",
          toggle_hint: "Use Company Name",
          toggle_field: {
            name: "company_id",
            label: "Company ID",
            type: "number",
            control_type: "number",
            optional: false,
            toggle_hint: "Use Company ID",
            hint: "Use 'List all Companies' action to get Company ID"
          }
        }
      ]
      end
      },
    output_list_sites: {
      fields: lambda do | _connection, _config_fields | [
        {
        name: "Sites",
        type: "array",
        of: "object",
        label: "Sites",
        properties:
        [
          {
            control_type: "number",
            label: "ID",
            parse_output: "float_conversion",
            type: "number",
            name: "ID"
          },
          {
            control_type: "text",
            label: "Name",
            type: "string",
            name: "Name"
          }
        ]
        }
      ]
      end
      },
    output_list_job_statuses: {
      fields: lambda do | _connection, _config_fields | [
        {
        name: "Statuses",
        type: "array",
        of: "object",
        label: "Statuses",
        properties:
        [
          {
            control_type: "number",
            label: "ID",
            parse_output: "float_conversion",
            type: "number",
            convert_output: "integer_conversion",
            name: "ID"
          },
          {
            control_type: "text",
            label: "Name",
            type: "string",
            name: "Name"
          }
        ]
        }
      ]
      end
      },
    output_list_customers: {
      fields: lambda do | _connection, _config_fields | [
        {
          name: "Customers",
          type: "array",
          of: "object",
          label: "Array",
          properties: [
            {
              control_type: "number",
              label: "ID",
              parse_output: "float_conversion",
              type: "number",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Href",
              type: "string",
              name: "_href"
            },
            {
              control_type: "text",
              label: "Company name",
              type: "string",
              name: "CompanyName"
            },
            {
              control_type: "text",
              label: "Given name",
              type: "string",
              name: "GivenName"
            },
            {
              control_type: "text",
              label: "Family name",
              type: "string",
              name: "FamilyName"
            }
          ]
        }
      ]
      end
      },
    input_get_site: {
      fields: lambda do | _connection, _config_fields | [
        {
          name: "company_id",
          label: "Company",
          type: "number",
          control_type: "select",
          optional: false,
          pick_list: "companies",
          toggle_hint: "Use Company Name",
          toggle_field: {
            name: "company_id",
            label: "Company ID",
            type: "integer",
            control_type: "integer",
            optional: false,
            toggle_hint: "Use Company ID",
            hint: "Use 'List all Companies' action to get Company ID"
          }
        },
        {
          name: "site_id",
          label: "Site",
          type: "integer",
          control_type: "select",
          optional: false,
          pick_list: "sites",
          pick_list_params: { company_id: 'company_id' },
          toggle_hint: "Use Site Name",
          toggle_field: {
            name: "site_id",
            label: "Site ID",
            type: "integer",
            control_type: "integer",
            optional: false,
            toggle_hint: "Use Site ID",
            hint: "Use 'List Sites' action to get Site ID"
          }
        }
      ]
      end
      },
    input_create_job_attachment: {
      fields: lambda do | _connection, _config_fields | [
        {
            name: "company_id",
            label: "Company",
            type: "integer",
            control_type: "select",
            optional: false,
            pick_list: "companies",
            hint: "A build with Multi-company setup may have companyID >= 0, other builds use 0 by default.",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id", # cahnge me to company_id
              label: "Company ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "job_id",
            label: "Job ID",
            type: "integer",
            hint: "A valid Job ID",
            control_type: "select",
            optional: false,
            pick_list: "job_list",
            pick_list_params: { company_id: 'company_id' },
            toggle_hint: "Select Job ID",
            toggle_field: {
              name: "job_id", # change me to company_id
              label: "Job ID",
              type: "integer",
              control_type: "integer",
              optional: false,
              toggle_hint: "Type Job ID",
              hint: "Use 'List all Jobs' action to get Job ID"
            }
          },
          {
            name: "columns",
            type: "string",
            optional: true
          },
          {
            control_type: "text",
            label: "Filename",
            hint: "Name of file, don't forget to include the file extension eg. PDF or CSV. Example: 'filename.pdf'",
            type: "string",
            name: "Filename",
            optional: false,
            details: {
            name: "Filename"
            }
          },
          {
            control_type: "integer",
            label: "Folder",
            hint: "ID of a job attachment folder",
            parse_output: "float_conversion",
            type: "integer",
            name: "Folder",
            details: {
              real_name: "Folder"
            }
          },
          {
            label: "Public",
            hint: "When Public is set to true, the attachment will be available in the Customer Portal.",
            render_input: {},
            parse_output: {},
            control_type: "select",
            optional: true,
            type: "boolean",
            pick_list: "boolean",
            convert_input: "boolean_conversion",
            toggle_hint: "Select True or False",
            toggle_field: {
              label: "Public",
              hint: "When Public is set to true, the attachment will be available in the Customer Portal.",
              optional: true,
              control_type: "text",
              convert_input: "boolean_conversion",
              toggle_hint: "Use custom value",
              type: "boolean",
              name: "Public"
            },
            name: "Public",
            details: {
              real_name: "Public"
            }
          },
          {
            control_type: "select",
            label: "Email",
            hint: "When Email is set to true, the attachment will be available in the forms tab on simPRO web UI.",
            render_input: {},
            optional: true,
            parse_output: {},
            convert_input: "boolean_conversion",
            pick_list: "boolean",
            toggle_hint: "Select from option list",
            toggle_field: {
              hint: "When Email is set to true, the attachment will be available in the forms tab on simPRO web UI.",
              label: "Email",
              optional: true,
              control_type: "text",
              convert_input: "boolean_conversion",
              toggle_hint: "Use custom value",
              type: "boolean",
              name: "Email"
            },
            type: "boolean",
            name: "Email",
            details: {
              real_name: "Email"
            }
          },
          {
            control_type: "text",
            label: "Base 64 data",
            hint: "Base 64 encoded file content. Use parameter ?display=Base64 in the URL inorder to get Base64 data as part of the response of GET Request.",
            optional: false,
            type: "string",
            name: "Base64Data",
            details: {
              real_name: "Base64Data"
            }
          }
      ]
      end
      },
    output_create_job_attachment: {
      fields: lambda do | _connection, _config_fields | [
        {
          label: "ID",
          type: "string",
          name: "ID",
          details: {
            real_name: "ID"
          }
        },
        {
          label: "Filename",
          type: "string",
          name: "Filename",
          details: {
            real_name: "Filename"
          }
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID",
              details: {
                real_name: "ID"
              }
            },
            {
              control_type: "text",
              label: "Name",
              type: "string",
              name: "Name",
              details: {
                real_name: "Name"
              }
            }
          ],
          label: "Folder",
          type: "object",
          name: "Folder",
          details: {
            real_name: "Folder"
          }
        },
        {
          label: "Public",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Public",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "Public"
          },
          type: "boolean",
          name: "Public",
          details: {
           real_name: "Public"
        }
        },
        {
          label: "Email",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Email",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "Email"
          },
          type: "boolean",
          name: "Email",
          details: {
            real_name: "Email"
          }
        },
        {
          label: "Mime type",
          type: "string",
          name: "MimeType",
          details: {
            real_name: "MimeType"
          }
        },
        {
          label: "File size bytes",
          type: "integer",
          name: "FileSizeBytes",
          details: {
            real_name: "FileSizeBytes"
          }
        },
        {
          control_type: "text",
          label: "Date added",
          render_input: "date_time_conversion",
          parse_output: "date_time_conversion",
          type: "date_time",
          name: "DateAdded",
          details: {
            real_name: "DateAdded"
          }
        }
      ]
      end
      },
    output_get_site: {
      fields: lambda do | _connection, _config_fields | [
        {
          label: "ID",
          type: "integer",
          name: "ID",
          details: {
            real_name: "ID"
          }
        },
        {
          label: "Name",
          type: "string",
          name: "Name",
          details: {
            real_name: "Name"
          }
        },
        {
          properties: [
            {
              label: "Address",
              type: "string",
              name: "Address",
              details: {
                real_name: "Address"
              }
            },
            {
              label: "City",
              type: "string",
              name: "City",
              details: {
                real_name: "City"
              }
            },
            {
              label: "State",
              type: "string",
              name: "State",
              details: {
                real_name: "State"
              }
            },
            {
              label: "Postal code",
              type: "string",
              name: "PostalCode",
              details: {
                real_name: "PostalCode"
              }
            },
            {
              label: "Country",
              type: "string",
              name: "Country",
              details: {
                real_name: "Country"
              }
            }
          ],
          label: "Address",
          type: "object",
          name: "Address",
          details: {
            real_name: "Address"
          }
        },
        {
          properties: [
            {
              control_type: "text",
              label: "Address",
              type: "string",
              name: "Address",
              details: {
                real_name: "Address"
              }
            },
            {
              control_type: "text",
              label: "City",
              type: "string",
              name: "City",
              details: {
                real_name: "City"
              }
            },
            {
              control_type: "text",
              label: "State",
              type: "string",
              name: "State",
              details: {
                real_name: "State"
              }
            },
            {
              control_type: "text",
              label: "Postal code",
              type: "string",
              name: "PostalCode",
              details: {
                real_name: "PostalCode"
              }
            }
          ],
          label: "Billing address",
          type: "object",
          name: "BillingAddress",
          details: {
            real_name: "BillingAddress"
          }
        },
        {
          label: "Billing contact",
          type: "string",
          name: "BillingContact",
          details: {
            real_name: "BillingContact"
          }
        },
        {
          properties: [
            {
              properties: [
                {
                  label: "ID",
                  type: "integer",
                  name: "ID",
                  details: {
                    real_name: "ID"
                  }
                },
                {
                  label: "Given name",
                  type: "string",
                  name: "GivenName",
                  details: {
                    real_name: "GivenName"
                  }
                },
                {
                  label: "Family name",
                  type: "string",
                  name: "FamilyName",
                  details: {
                    real_name: "FamilyName"
                  }
                },
                {
                  label: "Email",
                  type: "string",
                  name: "Email",
                  details: {
                    real_name: "Email"
                  }
                }
              ],
              label: "Contact",
              type: "object",
              name: "Contact",
              details: {
                real_name: "Contact"
              }
            },
            {
              label: "Title",
              type: "string",
              name: "Title",
              details: {
                real_name: "Title"
              }
            },
            {
              label: "Given name",
              type: "string",
              name: "GivenName",
              details: {
                real_name: "GivenName"
              }
            },
            {
              label: "Family name",
              type: "string",
              name: "FamilyName",
              details: {
                real_name: "FamilyName"
              }
            },
            {
              label: "Email",
              type: "string",
              name: "Email",
              details: {
                real_name: "Email"
              }
            },
            {
              label: "Work phone",
              type: "string",
              name: "WorkPhone",
              details: {
                real_name: "WorkPhone"
              }
            },
            {
              label: "Cell phone",
              type: "string",
              name: "CellPhone",
              details: {
                real_name: "CellPhone"
              }
            },
            {
              label: "Fax",
              type: "string",
              name: "Fax",
              details: {
                real_name: "Fax"
              }
            },
            {
              label: "Position",
              type: "string",
              name: "Position",
              details: {
                real_name: "Position"
              }
            },
            {
              label: "Preferred notification method",
              type: "string",
              name: "PreferredNotificationMethod",
              details: {
                real_name: "PreferredNotificationMethod"
              }
            }
          ],
          label: "Primary contact",
          type: "object",
          name: "PrimaryContact",
          details: {
            real_name: "PrimaryContact"
          }
        },
        {
          label: "Public notes",
          type: "string",
          name: "PublicNotes",
          details: {
            real_name: "PublicNotes"
          }
        },
        {
          label: "Private notes",
          type: "string",
          name: "PrivateNotes",
          details: {
            real_name: "PrivateNotes"
          }
        },
        {
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID",
              details: {
                real_name: "ID"
              }
            },
            {
              label: "Name",
              type: "string",
              name: "Name",
              details: {
                real_name: "Name"
              }
            }
          ],
          label: "Zone",
          type: "object",
          name: "Zone",
          details: {
            real_name: "Zone"
          }
        },
        {
          name: "PreferredTechs",
          type: "array",
          of: "object",
          label: "Preferred techs",
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID",
              details: {
                real_name: "ID"
              }
            },
            {
              label: "Name",
              type: "string",
              name: "Name",
              details: {
                real_name: "Name"
              }
            },
            {
              label: "Type",
              type: "string",
              name: "Type",
              details: {
                real_name: "Type"
              }
            },
            {
              label: "Type ID",
              parse_output: "float_conversion",
              type: "integer",
              name: "TypeId",
              details: {
                real_name: "TypeId"
              }
            }
          ],
          details: {
            real_name: "PreferredTechs"
          }
        },
        {
          name: "PreferredTechnicians",
          type: "array",
          of: "object",
          label: "Preferred technicians",
          properties: [
            {
              properties: [
                {
                  label: "ID",
                  type: "integer",
                  name: "ID",
                  details: {
                    real_name: "ID"
                  }
                },
                {
                  label: "Name",
                  type: "string",
                  name: "Name",
                  details: {
                    real_name: "Name"
                  }
                },
                {
                  label: "Type",
                  type: "string",
                  name: "Type",
                  details: {
                    real_name: "Type"
                  }
                },
                {
                  label: "Type ID",
                  type: "integer",
                  name: "TypeId",
                  details: {
                    real_name: "TypeId"
                  }
                }
              ],
              label: "Staff",
              type: "object",
              name: "Staff",
              details: {
                real_name: "Staff"
              }
            },
            {
              properties: [
                {
                  label: "ID",
                  type: "integer",
                  name: "ID",
                  details: {
                    real_name: "ID"
                  }
                },
                {
                  label: "Name",
                  type: "string",
                  name: "Name",
                  details: {
                    real_name: "Name"
                  }
                }
              ],
              label: "Asset type",
              type: "object",
              name: "AssetType",
              details: {
                real_name: "AssetType"
              }
            },
            {
              properties: [
                {
                  label: "ID",
                  type: "integer",
                  name: "ID",
                  details: {
                    real_name: "ID"
                  }
                },
                {
                  label: "Name",
                  type: "string",
                  name: "Name",
                  details: {
                    real_name: "Name"
                  }
                }
              ],
              label: "Service level",
              type: "object",
              name: "ServiceLevel",
              details: {
                real_name: "ServiceLevel"
              }
            }
          ],
          details: {
            real_name: "PreferredTechnicians"
          }
        },
        {
          label: "Date modified",
          render_input: "date_time_conversion",
          parse_output: "date_time_conversion",
          type: "date_time",
          name: "DateModified",
          details: {
            real_name: "DateModified"
          }
        },
        {
          name: "Customers",
          type: "array",
          of: "object",
          label: "Customers",
          properties: [
            {
              label: "ID",
              type: "integer",
              name: "ID",
              details: {
                real_name: "ID"
              }
            },
            {
              label: "Company name",
              type: "string",
              name: "CompanyName",
              details: {
                real_name: "CompanyName"
              }
            },
            {
              label: "Given name",
              type: "string",
              name: "GivenName",
              details: {
                real_name: "GivenName"
              }
            },
            {
              label: "Family name",
              type: "string",
              name: "FamilyName",
              details: {
                real_name: "FamilyName"
              }
            }
          ],
          details: {
            real_name: "Customers"
          }
        },
        {
          label: "Archived",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Archived",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "Archived"
          },
          type: "boolean",
          name: "Archived",
          details: {
            real_name: "Archived"
          }
        },
        {
          label: "STC zone",
          type: "integer",
          name: "STCZone",
          details: {
            real_name: "STCZone"
          }
        },
        {
          label: "VEEC zone",
          type: "string",
          name: "VEECZone",
          details: {
            real_name: "VEECZone"
          }
        },
        {
          name: "CustomFields",
          type: "array",
          of: "object",
          label: "Custom fields",
          properties: [
            {
              properties: [
                {
                  label: "ID",
                  type: "integer",
                  name: "ID",
                  details: {
                    real_name: "ID"
                  }
                },
                {
                  label: "Name",
                  type: "string",
                  name: "Name",
                  details: {
                    real_name: "Name"
                  }
                },
                {
                  label: "Type",
                  type: "string",
                  name: "Type",
                  details: {
                    real_name: "Type"
                  }
                },
                {
                  name: "ListItems",
                  type: "array",
                  of: "string",
                  label: "List items",
                  details: {
                    real_name: "ListItems"
                  }
                },
                {
                  label: "Is mandatory",
                  render_input: {},
                  parse_output: {},
                  toggle_hint: "Select from option list",
                  toggle_field: {
                    label: "Is mandatory",
                    toggle_hint: "Use custom value",
                    type: "boolean",
                    name: "IsMandatory"
                  },
                  type: "boolean",
                  name: "IsMandatory",
                  details: {
                    real_name: "IsMandatory"
                  }
                }
              ],
              label: "Custom field",
              type: "object",
              name: "CustomField",
              details: {
                real_name: "CustomField"
              }
            },
            {
              label: "Value",
              type: "string",
              name: "Value",
              details: {
                real_name: "Value"
              }
            }
          ],
          details: {
            real_name: "CustomFields"
          }
        }
      ]
      end
      },
    input_get_customer: {
      fields: lambda do | _connection, _config_fields | [
          {
            name: "company_id",
            label: "Company",
            type: "number",
            control_type: "select",
            hint: "A build with Multi-company setup may have companyID >= 0, other builds use 0 by default.",
            optional: false,
            pick_list: "companies",
            toggle_hint: "Use Company Name",
            toggle_field: {
              name: "company_id",
              label: "Company ID",
              type: "number",
              control_type: "number",
              optional: false,
              toggle_hint: "Use Company ID",
              hint: "Use 'List all Companies' action to get Company ID"
            }
          },
          {
            name: "customer_id",
            label: "Customer ID",
            hint: "A valid customer id",
            type: "number",
            control_type: "select",
            optional: false,
            pick_list: "customers",
            pick_list_params: { company_id: 'company_id' },
            toggle_hint: "Select Customer ID",
            toggle_field: {
              name: "customer_id", # change me to company_id
              label: "Customer ID",
              type: "number",
              control_type: "number",
              optional: false,
              toggle_hint: "Type Customer ID",
              hint: "Use 'List all Customers' custom action to get Job ID"
            }
          },
          {
            name: "columns",
            type: "string",
            hint: "When listing or searching a resource, specify which columns to be displayed. Example: 'columns=ID,Name'",
            optional: true
          }
        ]
        end
      },
    output_list_all_jobs: {
      fields: lambda do | _connection, _config_fields | [
        {
          "name": "Jobs",
          "type": "array",
          "of": "object",
          "label": "Jobs",
          "properties": [
            {
              "control_type": "number",
              "label": "ID",
              "parse_output": "float_conversion",
              "type": "number",
              "name": "ID",
              "details": {
                "real_name": "ID"
              }
            },
            {
              "control_type": "text",
              "label": "Description",
              "type": "string",
              "name": "Description",
              "details": {
                "real_name": "Description"
              }
            },
            {
              "properties": [
                {
                  "control_type": "number",
                  "label": "Ex tax",
                  "parse_output": "float_conversion",
                  "type": "number",
                  "name": "ExTax",
                  "details": {
                    "real_name": "ExTax"
                  }
                },
                {
                  "control_type": "number",
                  "label": "Tax",
                  "parse_output": "float_conversion",
                  "type": "number",
                  "name": "Tax",
                  "details": {
                    "real_name": "Tax"
                  }
                },
                {
                  "control_type": "number",
                  "label": "Inc tax",
                  "parse_output": "float_conversion",
                  "type": "number",
                  "name": "IncTax",
                  "details": {
                    "real_name": "IncTax"
                  }
                }
              ],
              "label": "Total",
              "type": "object",
              "name": "Total",
              "details": {
                "real_name": "Total"
              }
            }
          ],
          "details": {
            "fake_array": true,
            "real_name": "array"
          }
        }
      ]
      end
      },
    output_get_customer: {
      fields: lambda do | _connection, _config_fields | [
        {
          control_type: "number",
          label: "ID",
          parse_output: "float_conversion",
          type: "number",
          name: "ID"
        },
        {
          control_type: "text",
          label: "Company name",
          type: "string",
          name: "CompanyName"
        },
        {
          name: "PreferredTechs",
          type: "array",
          of: "object",
          label: "Preferred techs",
          properties: [
            {
              control_type: "number",
              label: "ID",
              parse_output: "float_conversion",
              type: "number",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              control_type: "text",
              label: "Type",
              type: "string",
              name: "Type"
            },
            {
              control_type: "number",
              label: "Type ID",
              parse_output: "float_conversion",
              type: "number",
              name: "TypeId"
            }
          ]
        },
        {
          control_type: "text",
          label: "Phone",
          type: "string",
          name: "Phone"
        },
        {
          control_type: "text",
          label: "Do not call",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Do not call",
            control_type: "text",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "DoNotCall"
          },
          type: "boolean",
          name: "DoNotCall"
        },
        {
          control_type: "text",
          label: "Alt phone",
          type: "string",
          name: "AltPhone"
        },
        {
          properties: [
            {
              control_type: "text",
              label: "Address",
              type: "string",
              name: "Address"
            },
            {
              control_type: "text",
              label: "City",
              type: "string",
              name: "City"
            },
            {
              control_type: "text",
              label: "State",
              type: "string",
              name: "State"
            },
            {
              control_type: "text",
              label: "Postal code",
              type: "string",
              name: "PostalCode"
            },
            {
              control_type: "text",
              label: "Country",
              type: "string",
              name: "Country"
            }
          ],
          label: "Address",
          type: "object",
          name: "Address"
        },
        {
          properties: [
            {
              control_type: "text",
              label: "Address",
              type: "string",
              name: "Address"
            },
            {
              control_type: "text",
              label: "City",
              type: "string",
              name: "City"
            },
            {
              control_type: "text",
              label: "State",
              type: "string",
              name: "State"
            },
            {
              control_type: "text",
              label: "Postal code",
              type: "string",
              name: "PostalCode"
            },
            {
              control_type: "text",
              label: "Country",
              type: "string",
              name: "Country"
            }
          ],
          label: "Billing address",
          type: "object",
          name: "BillingAddress"
        },
        {
          control_type: "text",
          label: "Customer type",
          type: "string",
          name: "CustomerType"
        },
        {
          name: "Tags",
          type: "array",
          of: "string",
          control_type: "text",
          label: "Tags"
        },
        {
          control_type: "number",
          label: "Amount owing",
          parse_output: "float_conversion",
          type: "number",
          name: "AmountOwing"
        },
        {
          properties: [
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Code",
                  type: "string",
                  name: "Code"
                },
                {
                  control_type: "text",
                  label: "Type",
                  type: "string",
                  name: "Type"
                },
                {
                  control_type: "number",
                  label: "Rate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Rate"
                },
                {
                  control_type: "text",
                  label: "Reverse tax enabled",
                  render_input: {},
                  parse_output: {},
                  toggle_hint: "Select from option list",
                  toggle_field: {
                    label: "Reverse tax enabled",
                    control_type: "text",
                    toggle_hint: "Use custom value",
                    type: "boolean",
                    name: "ReverseTaxEnabled"
                  },
                  type: "boolean",
                  name: "ReverseTaxEnabled"
                }
              ],
              label: "Part tax code",
              type: "object",
              name: "PartTaxCode"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Code",
                  type: "string",
                  name: "Code"
                },
                {
                  control_type: "text",
                  label: "Type",
                  type: "string",
                  name: "Type"
                },
                {
                  control_type: "number",
                  label: "Rate",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Rate"
                },
                {
                  control_type: "text",
                  label: "Reverse tax enabled",
                  render_input: {},
                  parse_output: {},
                  toggle_hint: "Select from option list",
                  toggle_field: {
                    label: "Reverse tax enabled",
                    control_type: "text",
                    toggle_hint: "Use custom value",
                    type: "boolean",
                    name: "ReverseTaxEnabled"
                  },
                  type: "boolean",
                  name: "ReverseTaxEnabled"
                }
              ],
              label: "Labour tax code",
              type: "object",
              name: "LabourTaxCode"
            },
            {
              control_type: "text",
              label: "Discount fee",
              type: "string",
              name: "DiscountFee"
            },
            {
              control_type: "text",
              label: "Always deduct CIS",
              render_input: {},
              parse_output: {},
              toggle_hint: "Select from option list",
              toggle_field: {
                label: "Always deduct CIS",
                control_type: "text",
                toggle_hint: "Use custom value",
                type: "boolean",
                name: "AlwaysDeductCIS"
              },
              type: "boolean",
              name: "AlwaysDeductCIS"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                }
              ],
              label: "Service fee",
              type: "object",
              name: "ServiceFee"
            },
            {
              properties: [
                {
                  properties: [
                    {
                      control_type: "number",
                      label: "ID",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "ID"
                    },
                    {
                      control_type: "text",
                      label: "Name",
                      type: "string",
                      name: "Name"
                    },
                    {
                      control_type: "number",
                      label: "Default markup",
                      parse_output: "float_conversion",
                      type: "number",
                      name: "DefaultMarkup"
                    }
                  ],
                  label: "Pricing tier",
                  type: "object",
                  name: "PricingTier"
                },
                {
                  control_type: "number",
                  label: "Markup",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Markup"
                }
              ],
              label: "Material",
              type: "object",
              name: "Material"
            }
          ],
          label: "Rates",
          type: "object",
          name: "Rates"
        },
        {
          properties: [
            {
              control_type: "text",
              label: "Notes",
              type: "string",
              name: "Notes"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                }
              ],
              label: "Customer profile",
              type: "object",
              name: "CustomerProfile"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                }
              ],
              label: "Customer group",
              type: "object",
              name: "CustomerGroup"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                }
              ],
              label: "Account manager",
              type: "object",
              name: "AccountManager"
            },
            {
              control_type: "text",
              label: "Currency",
              type: "string",
              name: "Currency"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                }
              ],
              label: "Service job cost center",
              type: "object",
              name: "ServiceJobCostCenter"
            }
          ],
          label: "Profile",
          type: "object",
          name: "Profile"
        },
        {
          properties: [
            {
              control_type: "text",
              label: "Account name",
              type: "string",
              name: "AccountName"
            },
            {
              control_type: "text",
              label: "Routing no",
              type: "string",
              name: "RoutingNo"
            },
            {
              control_type: "text",
              label: "Account no",
              type: "string",
              name: "AccountNo"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                }
              ],
              label: "Payment method",
              type: "object",
              name: "PaymentMethod"
            },
            {
              control_type: "number",
              label: "Payment term ID",
              parse_output: "float_conversion",
              type: "number",
              name: "PaymentTermID"
            },
            {
              properties: [
                {
                  control_type: "number",
                  label: "Days",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "Days"
                },
                {
                  control_type: "text",
                  label: "Type",
                  type: "string",
                  name: "Type"
                }
              ],
              label: "Payment terms",
              type: "object",
              name: "PaymentTerms"
            },
            {
              control_type: "number",
              label: "Credit limit",
              parse_output: "float_conversion",
              type: "number",
              name: "CreditLimit"
            },
            {
              control_type: "text",
              label: "On stop",
              render_input: {},
              parse_output: {},
              toggle_hint: "Select from option list",
              toggle_field: {
                label: "On stop",
                control_type: "text",
                toggle_hint: "Use custom value",
                type: "boolean",
                name: "OnStop"
              },
              type: "boolean",
              name: "OnStop"
            },
            {
              control_type: "text",
              label: "Retention",
              type: "string",
              name: "Retention"
            },
            {
              control_type: "text",
              label: "Vendor order no required",
              render_input: {},
              parse_output: {},
              toggle_hint: "Select from option list",
              toggle_field: {
                label: "Vendor order no required",
                control_type: "text",
                toggle_hint: "Use custom value",
                type: "boolean",
                name: "VendorOrderNoRequired"
              },
              type: "boolean",
              name: "VendorOrderNoRequired"
            }
          ],
          label: "Banking",
          type: "object",
          name: "Banking"
        },
        {
          control_type: "text",
          label: "Archived",
          render_input: {},
          parse_output: {},
          toggle_hint: "Select from option list",
          toggle_field: {
            label: "Archived",
            control_type: "text",
            toggle_hint: "Use custom value",
            type: "boolean",
            name: "Archived"
          },
          type: "boolean",
          name: "Archived"
        },
        {
          name: "Sites",
          type: "array",
          of: "object",
          label: "Sites",
          properties: [
            {
              control_type: "number",
              label: "ID",
              parse_output: "float_conversion",
              type: "number",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Name",
              type: "string",
              name: "Name"
            }
          ]
        },
        {
          name: "Contracts",
          type: "array",
          of: "object",
          label: "Contracts",
          properties: [
            {
              control_type: "number",
              label: "ID",
              parse_output: "float_conversion",
              type: "number",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Name",
              type: "string",
              name: "Name"
            },
            {
              control_type: "text",
              label: "Start date",
              type: "string",
              name: "StartDate"
            },
            {
              control_type: "text",
              label: "End date",
              type: "string",
              name: "EndDate"
            },
            {
              control_type: "text",
              label: "Expired",
              render_input: {},
              parse_output: {},
              toggle_hint: "Select from option list",
              toggle_field: {
                label: "Expired",
                control_type: "text",
                toggle_hint: "Use custom value",
                type: "boolean",
                name: "Expired"
              },
              type: "boolean",
              name: "Expired"
            }
          ]
        },
        {
          name: "Contacts",
          type: "array",
          of: "object",
          label: "Contacts",
          properties: [
            {
              control_type: "number",
              label: "ID",
              parse_output: "float_conversion",
              type: "number",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Given name",
              type: "string",
              name: "GivenName"
            },
            {
              control_type: "text",
              label: "Family name",
              type: "string",
              name: "FamilyName"
            }
          ]
        },
        {
          name: "ResponseTimes",
          type: "array",
          of: "object",
          label: "Response times",
          properties: [
            {
              control_type: "number",
              label: "ID",
              parse_output: "float_conversion",
              type: "number",
              name: "ID"
            },
            {
              control_type: "text",
              label: "Name",
              type: "string",
              name: "Name"
            }
          ]
        },
        {
          name: "CustomFields",
          type: "array",
          of: "object",
          label: "Custom fields",
          properties: [
            {
              properties: [
                {
                  control_type: "number",
                  label: "ID",
                  parse_output: "float_conversion",
                  type: "number",
                  name: "ID"
                },
                {
                  control_type: "text",
                  label: "Name",
                  type: "string",
                  name: "Name"
                },
                {
                  control_type: "text",
                  label: "Type",
                  type: "string",
                  name: "Type"
                },
                {
                  name: "ListItems",
                  type: "array",
                  of: "string",
                  control_type: "text",
                  label: "List items"
                },
                {
                  control_type: "text",
                  label: "Is mandatory",
                  render_input: {},
                  parse_output: {},
                  toggle_hint: "Select from option list",
                  toggle_field: {
                    label: "Is mandatory",
                    control_type: "text",
                    toggle_hint: "Use custom value",
                    type: "boolean",
                    name: "IsMandatory"
                  },
                  type: "boolean",
                  name: "IsMandatory"
                }
              ],
              label: "Custom field",
              type: "object",
              name: "CustomField"
            },
            {
              control_type: "text",
              label: "Value",
              type: "string",
              name: "Value"
            }
          ]
        },
        {
          control_type: "text",
          label: "Email",
          type: "string",
          name: "Email"
        },
        {
          control_type: "text",
          label: "Date modified",
          render_input: "date_time_conversion",
          parse_output: "date_time_conversion",
          type: "date_time",
          name: "DateModified"
        },
        {
          control_type: "text",
          label: "Date created",
          render_input: "date_time_conversion",
          parse_output: "date_time_conversion",
          type: "date_time",
          name: "DateCreated"
        },
        {
          control_type: "text",
          label: "EIN",
          type: "string",
          name: "EIN"
        },
        {
          control_type: "text",
          label: "Website",
          type: "string",
          name: "Website"
        },
        {
          control_type: "text",
          label: "Fax",
          type: "string",
          name: "Fax"
        },
        {
          control_type: "text",
          label: "Company number",
          type: "string",
          name: "CompanyNumber"
        }
      ]
      end
    }
  },

  custom_action: true,

  custom_action_help: {
    learn_more_url: "https://developer.simprogroup.com/apidoc/",
    learn_more_text: "Simpro documentation",
    body: "<p>Build your own Simpro action with a HTTP request. The request will be authorized with your Simpro connection.</p>"
  },

  actions: {

    list_all_companies: {
      title: "List Companies",
      subtitle: "List all companies for this Simpro instance",
      description: "List all <span class='provider'>companies</span> for this <span class='provider'>Simpro</span> instance",
      help: "Company operations provide the ability to modify limited company information equivalent",

        input_fields: lambda do | object_definitions |
          object_definitions["input_list_all_companies"]
        end,

        execute: lambda do | _connection, _input, _input_schema, _output_schema |
          get("/api/v1.0/companies/").after_response do | code, body, headers | {
            Companies: body
          }
          end
        end,

        output_fields: lambda do | object_definitions |
          object_definitions["output_list_all_companies"]
        end,

        sample_output: lambda do | _connection, _input |
          get("/api/v1.0/companies/")
          .params(per_page: 1) || []
        end

      },

    list_all_jobs: {

      title: "List Jobs",
      subtitle: "List all jobs for this Simpro instance",
      description: "<span class='provider'>List all jobs</span> in <span class='provider'>Simpro</span> instance",
      help: "In a job, keep track of all the details of the work being carried out, including scheduling employees, assigning stock, creating vendor orders, raising contractor work orders, adding customer assets to be tested, sending job forms to the customer, and more.",

        input_fields: lambda do | object_definitions |
          object_definitions["input_list_all_jobs"]
        end,

        execute: lambda do | _connection, _input, _input_schema, _output_schema |
          get("/api/v1.0/companies/#{_input['company_id']}/jobs/").after_response do | code, body, headers | {
            Jobs: body
          }
          end
        end,

        output_fields: lambda do | object_definitions |
          object_definitions["output_list_all_jobs"]
        end,

        sample_output: lambda do | _connection, _input |
          get("/api/v1.0/companies/")
          .params(per_page: 1) || []
        end
      },

    get_job: {

      title: "Get Job",
      subtitle: "Retrieve details for a specific job in Simpro",
      description: lambda do | input, picklist_label |
        "<span class='provider'>Retrieve details for a specific job</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In a job, keep track of all the details of the work being carried out, including scheduling employees, assigning stock, creating vendor orders, raising contractor work orders, adding customer assets to be tested, sending job forms to the customer, and more.",

        input_fields: lambda do | object_definitions |
          object_definitions["input_get_job"]
        end,

        execute: lambda do | _connection, input, _input_schema, _output_schema |
          get("/api/v1.0/companies/#{input["company_id"]}/jobs/#{input["job_id"]}")
        end,

        output_fields: lambda do | object_definitions |
          object_definitions["output_get_job"]
        end,

        sample_output: lambda do | _connection, _input |
          get("/api/v1.0/companies/")
          .params(per_page: 1) || []
        end
      },

    update_job_status: {
      title: "Update Job Status",
      subtitle: "Updates the status of a job in Simpro",
      description: lambda do | input, picklist_label |
        "Update <span class='provider'>Job Status</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "Leads , quotes, jobs, invoices, and vendor orders have status codes according to their position in your workflow. The system has predefined trigger points, and as you perform certain actions - such as emailing a quote - you pass one of these trigger points, triggering a change in the quote's status code and color.",
      input_fields: lambda do | object_definitions |
        object_definitions["input_update_job_status"]
      end,
      execute: lambda do |connection, input|
        job_id = input['job_id']
        company_id = input['company_id']

        # Build the URL with path parameters
        url = "/api/v1.0/companies/#{company_id}/jobs/#{job_id}"

        # Prepare the request body
        request_body = {
          "Status": input['status_id'].to_i # Assuming 'status_id' should be used for the Status in the request body
        }

        # Call the patch method with the updated URL and request body
        patch(url, request_body)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      # output_fields: lambda do | object_definitions |
      #   object_definitions[]
      # end,
      sample_output: lambda do | connection, input |
        {}
      end
      },
    update_job: {
      title: "Update Job",
      subtitle: "Update a job in Simpro",
      description: lambda do | input, picklist_label |
        "Update <span class='provider'>Job</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In a job, keep track of all the details of the work being carried out, including scheduling employees, assigning stock, creating vendor orders, raising contractor work orders, adding customer assets to be tested, sending job forms to the customer, and more.",
      input_fields: lambda do | object_definitions |
        object_definitions["input_update_job"]
      end,
      execute: lambda do |connection, input|
        # Build the URL with path parameters
        url = "/api/v1.0/companies/#{input['company_id']}/jobs/#{input['job_id']}"

        request_body = {
          "Customer" => input["customer_id"],
          "CustomerContract" => input["customer_contract_id"],
          "CustomerContact" => input["customer_contact_id"],
          "AdditionalContacts" => input["additional_contacts"],
          "Site" => input["site_id"],
          "SiteContact" => input["site_contact_id"],
          "OrderNo" => input["order_number"],
          "RequestNo" => input["request_number"],
          "Name" => input["name"],
          "Description" => input["description"],
          "Notes" => input["notes"],
          "DateIssued" => input["date_issued"],
          "DueDate" => input["due_date"],
          "DueTime" => input["due_time"],
          "Tags" => input["tags"],
          "Salesperson" => input["salesperson_id"],
          "ProjectManager" => input["project_manager_id"],
          "Technician" => input["technician_id"],
          "Stage" => input["stage"],
          "Status" => input["status_id"],
          "ResponseTime" => input["resonse_time_id"],
          "CompletedDate" => input["completed_date"]
        }.compact.reject { |_, v| v.nil? }

        # Call the patch method with the updated URL and request body
        patch(url, request_body)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      # output_fields: lambda do | object_definitions |
      #   object_definitions[]
      # end,
      sample_output: lambda do | connection, input |
        {}
      end
      },

    list_job_statuses: {
      title: "List Statuses",
      subtitle: "List all job statuses in Simpro",
      description: lambda do | input, picklist_label |
        "Lists all <span class='provider'>job statuses</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In Simpro, a customer is an entity, such as a company or individual, that receives your invoice for the work performed.",
      input_fields: lambda do | object_definitions |
        object_definitions["input_list_all_jobs"]
      end,
      execute: lambda do | _connection, _input, _input_schema, _output_schema |
        get("/api/v1.0/companies/#{_input['company_id']}/setup/statusCodes/projects/").after_response do | code, body, headers | {
          Statuses: body
        }
        end
      end,
      output_fields: lambda do | object_definitions |
        object_definitions["output_list_job_statuses"]
      end,
      sample_output: lambda do | connection, input |
        {}
      end
      },
    get_site: {
      title: "Get Site",
      subtitle: "Retrieve details for a specific site in Simpro",
      description: lambda do | input, picklist_label |
        "<span class='provider'>Retrieve  Site data</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In Simpro, sites are physical locations where you perform work for a customer.",
      input_fields: lambda do | object_definitions |
        object_definitions["input_get_site"]
      end,
      execute: lambda do | _connection, _input, _input_schema, _output_schema |
        get("/api/v1.0/companies/#{_input['company_id']}/sites/#{_input['site_id']}")
      end,
      output_fields: lambda do | object_definitions |
        object_definitions["output_get_site"]
      end,
      sample_output: lambda do | connection, input |
        {}
      end
      },
    delete_job: {
      title: "Delete Job",
      subtitle: "Delete a job in Simpro",
      description: lambda do | input, picklist_label |
        "<span class='provider'>Delete Job</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "Delete Job in Simpro",
      input_fields: lambda do | object_definitions |
        object_definitions["input_get_job"]
      end,
      execute: lambda do | _connection, _input, _input_schema, _output_schema |
        delete("/api/v1.0/companies/#{_input['company_id']}/jobs/#{_input['job_id']}")
      end
      },
    create_job_attachment: {
      title: "Create Job Attachment",
      subtitle: "Attach a file to a Simpro job",
      description: lambda do | input, picklist_label |
        "<span class='provider'>Create attachment</span> for a job in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "Attach a file to a Simpro Job",
      input_fields: lambda do | object_definitions |
        object_definitions["input_create_job_attachment"]
      end,
      execute: lambda do |connection, input|
        params = {
          "Filename" => input["Filename"],
          "Base64Data" => input["Base64Data"],
          "Folder" => input["Folder"],
          "Public" => input["Public"],
          "Email" => input["Email"]
        }.compact.reject { |_, v| v.nil? }

        post("/api/v1.0/companies/#{input["company_id"]}/jobs/#{input["job_id"]}/attachments/files/")
          .payload(params)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      output_fields: lambda do | object_definitions |
        object_definitions["output_create_job_attachment"]
      end,
      sample_output: lambda do | connection, input |
        {}
      end
      },
    create_job: {
      title: "Create Job",
      subtitle: "Create a new job in Simpro",
      description: lambda do | input, picklist_label |
        "<span class='provider'>Create job</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In a job, keep track of all the details of the work being carried out, including scheduling employees, assigning stock, creating vendor orders, raising contractor work orders, adding customer assets to be tested, sending job forms to the customer, and more.",
      input_fields: lambda do | object_definitions |
        object_definitions["input_create_job"]
      end,
      execute: lambda do |connection, input|
        url = "/api/v1.0/companies/#{input['company_id']}/jobs/#{input['job_id']}"
        request_body = {
          "Type" => input["type"],
          "Customer" => input["customer_id"],
          "CustomerContract" => input["customer_contract_id"],
          "CustomerContact" => input["customer_contact_id"],
          "AdditionalContacts" => input["additional_contacts"],
          "Site" => input["site_id"],
          "SiteContact" => input["site_contact_id"],
          "OrderNo" => input["order_number"],
          "RequestNo" => input["request_number"],
          "Name" => input["name"],
          "Description" => input["description"],
          "Notes" => input["notes"],
          "DateIssued" => input["date_issued"],
          "DueDate" => input["due_date"].strftime("%Y-%m-%d"),
          "DueTime" => input["due_time"],
          "Tags" => input["tags"],
          "Salesperson" => input["salesperson_id"],
          "ProjectManager" => input["project_manager_id"],
          "Technician" => input["technician_id"],
          "Stage" => input["stage"],
          "Status" => input["status_id"],
          "ResponseTime" => input["resonse_time_id"],
          "CompletedDate" => input["completed_date"]
        }.compact.reject { |_, v| v.nil? }

        post(url, request_body)
          .after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      output_fields: lambda do | object_definitions |
        object_definitions["output_create_job"]
      end,
      sample_output: lambda do | connection, input |
        {}
      end
      },
    list_sites: {
      title: "List Sites",
      subtitle: "List all sites in Simpro",
      description: lambda do | input, picklist_label |
        "Retrieve a list of <span class='provider'>Sites</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In Simpro, sites are physical locations where you perform work for a customer.",
      input_fields: lambda do | object_definitions |
        object_definitions["input_list_job_statuses"]
      end,
      execute: lambda do | _connection, _input, _input_schema, _output_schema |
        get("/api/v1.0/companies/#{_input['company_id']}/sites/").after_response do | code, body, headers | {
          Sites: body
        }
        end
      end,
      output_fields: lambda do | object_definitions |
        object_definitions["output_list_sites"]
      end,
      sample_output: lambda do | connection, input |
        {}
      end
      },
    get_customer: {

      title: "Get Company Customer",
      subtitle: "Retrieve details for a specific company customer in Simpro",
      description: lambda do | input, picklist_label |
        "<span class='provider'>Retrieve details for a specific company customer</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In Simpro, a customer is an entity, such as a company or individual, that receives your invoice for the work performed.",

      input_fields: lambda do | object_definitions |
        object_definitions["input_get_customer"]
      end,

      execute: lambda do | _connection, input, _input_schema, _output_schema |
        get("/api/v1.0/companies/#{input["company_id"]}/customers/companies/#{input["customer_id"]}")
      end,

      output_fields: lambda do | object_definitions |
        object_definitions["output_get_customer"]
      end,

      sample_output: lambda do | _connection, _input |
        get("/api/v1.0/companies/")
        .params(per_page: 1) || []
      end
      },
    list_customers: {

      title: "List Company Customers",
      subtitle: "List all company customers in Simpro",
      description: lambda do | input, picklist_label |
        "<span class='provider'>List all company customers</span> in " \
        "<span class='provider'>Simpro</span>"
      end,
      help: "In Simpro, a customer is an entity, such as a company or individual, that receives your invoice for the work performed.",

      input_fields: lambda do | object_definitions |
        object_definitions["input_list_all_jobs"]
      end,

      execute: lambda do | _connection, _input, _input_schema, _output_schema |
        get("/api/v1.0/companies/#{_input['company_id']}/customers/").after_response do | code, body, headers | {
          Customers: body
        }
        end
      end,

      output_fields: lambda do | object_definitions |
        object_definitions["output_list_customers"]
      end,

      sample_output: lambda do | _connection, _input |
        get("/api/v1.0/companies/")
        .params(per_page: 1) || []
      end
      }
  },

  pick_lists: {

    companies: lambda do | connection |
      data = get("/api/v1.0/companies/")
      output = data.map {
        | item | [item["Name"], item["ID"]]
      }
      output
    end,

    job_webhook_events: lambda do | connection |
      [
        ["Job Asset Assigned", "job.asset.assigned"],
        ["Job Asset Removed", "job.asset.removed"],
        ["Job Asset Tested", "job.asset.tested"],
        ["Job Attachment Created", "job.attachment.created"],
        ["Job Attachment Updated", "job.attachment.updated"],
        ["Job Attachment Deleted", "job.attachment.deleted"],
        ["Job Created", "job.created"],
        ["Job Status", "job.status"],
        ["Job Updated", "job.updated"],
        ["Job Deleted", "job.deleted"],
        ["Job Stage Pending", "job.stage.pending"],
        ["Job Stage Progress", "job.stage.progress"],
        ["Job Stage Complete", "job.stage.complete"],
        ["Job Stage Invoiced", "job.stage.invoiced"],
        ["Job Stage Archived", "job.stage.archived"],
        ["Job Schedule Created", "job.schedule.created"],
        ["Job Schedule Updated", "job.schedule.updated"],
        ["Job Schedule Deleted", "job.schedule.deleted"]
      ]
    end,

    job_stages: lambda do | connection |
      [
        ["Pending", "Pending"],
        ["Progress", "Progress"],
        ["Complete", "Complete"],
        ["Archived", "Archived"]
      ]
    end,

    statuses2: lambda do | _connection, company_id: |
      get("/api/v1.0/companies/#{company_id}/setup/statusCodes/projects/")
      .map { |item| [item['Name'], item['ID']] }
    end,

    job_list: lambda do | _connection, company_id: |
      get("/api/v1.0/companies/#{company_id}/jobs/")
      .map { |item| [item['ID'], item['ID']]}
    end,

    sites: lambda do | _connection, company_id: |
      get("/api/v1.0/companies/#{company_id}/sites/")
      .map { |item| [item['Name'], item['ID']]}
    end,

    job_type: lambda do | connection |
      [
        ["Project", "Project"],
        ["Service", "Service"],
        ["Prepaid", "Prepaid"]
      ]
    end,

    customers: lambda do | _connection, company_id: |
      get("/api/v1.0/companies/#{company_id}/customers/")
      .map { |item| [item["CompanyName"], item["ID"]]}
    end,

    boolean: lambda do | connection |
      [
        ["True", true],
        ["False", false]
      ]
    end
  },

  triggers: {
    job_status_updated_event: {
      title: 'Job Status Updated',

      subtitle: "Trigger when the status of a job in Simpro is updated",

      description: lambda do |input, picklist_label|
        "New <span class='provider'>Job event</span> in " \
        "<span class='provider'>Simpro</span>"
      end,

      help: "Leads , quotes, jobs, invoices, and vendor orders have status codes according to their position in your workflow. The system has predefined trigger points, and as you perform certain actions - such as emailing a quote - you pass one of these trigger points, triggering a change in the quote's status code and color.",

      input_fields: lambda do |object_definitions|
        object_definitions["input_job_status_event"]
      end,

      webhook_subscribe: lambda do |webhook_url, connection, input, recipe_id|
        response = post("/api/v1.0/companies/#{input['company_id']}/setup/webhooks/",
          {
            Name: "Workato recipe #{recipe_id}",
            CallbackURL: webhook_url,
            Events: ["job.status"],
            Status: "Enabled"
          }
        )

        response['company_id'] = input['company_id']

        response
      end,

      webhook_notification: lambda do |input, payload, extended_input_schema, extended_output_schema, headers, params|
        payload
      end,

      webhook_unsubscribe: lambda do |webhook_subscribe_output, connection|
        # error("/api/v1.0/companies/#{webhook_subscribe_output['company_id']}/setup/webhooks/#{webhook_subscribe_output['response']['ID']}")
        delete("/api/v1.0/companies/#{webhook_subscribe_output['company_id']}/setup/webhooks/#{webhook_subscribe_output['ID']}")
      end,

      dedup: lambda do |message|
        "#{message['ID']}#{message['reference']['jobID']}#{message["date_triggered"]}"
      end,

      output_fields: lambda do |object_definitions|
        object_definitions["output_job_status_event"]
      end
    },
    job_updated_event: {
      title: 'Job Updated',

      subtitle: "Trigger when a job in Simpro is updated",

      description: lambda do |input, picklist_label|
        "New <span class='provider'>Job event</span> in " \
        "<span class='provider'>Simpro</span>"
      end,

      help: "Leads , quotes, jobs, invoices, and vendor orders have status codes according to their position in your workflow. The system has predefined trigger points, and as you perform certain actions - such as emailing a quote - you pass one of these trigger points, triggering a change in the quote's status code and color.",

      input_fields: lambda do |object_definitions|
        object_definitions["input_job_status_event"]
      end,

      webhook_subscribe: lambda do |webhook_url, connection, input, recipe_id|
        response = post("/api/v1.0/companies/#{input['company_id']}/setup/webhooks/",
          {
            Name: "Workato recipe #{recipe_id}",
            CallbackURL: webhook_url,
            Events: ["job.updated"],
            Status: "Enabled"
          }
        )

        response['company_id'] = input['company_id']

        response
      end,

      webhook_notification: lambda do |input, payload, extended_input_schema, extended_output_schema, headers, params|
        payload
      end,

      webhook_unsubscribe: lambda do |webhook_subscribe_output, connection|
        # error("/api/v1.0/companies/#{webhook_subscribe_output['company_id']}/setup/webhooks/#{webhook_subscribe_output['response']['ID']}")
        delete("/api/v1.0/companies/#{webhook_subscribe_output['company_id']}/setup/webhooks/#{webhook_subscribe_output['ID']}")
      end,

      dedup: lambda do |message|
        "#{message['ID']}#{message['reference']['jobID']}#{message["date_triggered"]}"
      end,

      output_fields: lambda do |object_definitions|
        object_definitions["output_job_created_event"]
      end
    },
    job_created_event: {
      title: 'Job Created',

      subtitle: "Trigger when a new job is created in Simpro",

      description: lambda do |input, picklist_label|
        "New <span class='provider'>Job event</span> in " \
        "<span class='provider'>Simpro</span>"
      end,

      help: "Leads , quotes, jobs, invoices, and vendor orders have status codes according to their position in your workflow. The system has predefined trigger points, and as you perform certain actions - such as emailing a quote - you pass one of these trigger points, triggering a change in the quote's status code and color.",

      input_fields: lambda do |object_definitions|
        object_definitions["input_job_status_event"]
      end,

      webhook_subscribe: lambda do |webhook_url, connection, input, recipe_id|
        response = post("/api/v1.0/companies/#{input['company_id']}/setup/webhooks/",
          {
            Name: "Workato recipe #{recipe_id}",
            CallbackURL: webhook_url,
            Events: ["job.created"],
            Status: "Enabled"
          }
        )

        response['company_id'] = input['company_id']

        response
      end,

      webhook_notification: lambda do |input, payload, extended_input_schema, extended_output_schema, headers, params|
        payload
      end,

      webhook_unsubscribe: lambda do |webhook_subscribe_output, connection|
        # error("/api/v1.0/companies/#{webhook_subscribe_output['company_id']}/setup/webhooks/#{webhook_subscribe_output['response']['ID']}")
        delete("/api/v1.0/companies/#{webhook_subscribe_output['company_id']}/setup/webhooks/#{webhook_subscribe_output['ID']}")
      end,

      dedup: lambda do |message|
        "#{message['ID']}#{message['reference']['jobID']}#{message["date_triggered"]}"
      end,

      output_fields: lambda do |object_definitions|
        object_definitions["output_job_created_event"]
      end
    }
  },

    methods: {}
}

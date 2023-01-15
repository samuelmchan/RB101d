order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},

]

customer_orders = {}

order_data.each do |row|
  if customer_orders.key?(row[:customer_id]) # if there exsits a value assigned to the key "customer_id"
    customer_orders[12][:orders] << [
      hash[:order_fulfilled],
      hash[:order_value]
    ]
  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        [
          row[:order_fulfilled],
          row[:order_value]
        ]
      ]
    }
  end
end

customer_orders = customer_orders.values

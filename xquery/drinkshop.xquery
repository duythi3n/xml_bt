let $drink_shop := doc("../xml/drinkshop.xml")


(: Câu 1: Lấy ra tất cả các đồ uống có giá tiền lớn hơn hoặc bằng 35000 đồng :)
(:
for $drink in $drink_shop/drink_shop/drinks/drink[price >= 35000]
return $drink
:)

(: Câu 2: Lấy ra tên của khách hàng có id là "C001" :)

(:for $customer in $drink_shop/drink_shop/customers/customer[id = "C001"]
return $customer/name:)

(: Câu 3: Lấy ra tất cả các đơn hàng đã thanh toán :)

(:for $order in $drink_shop/drink_shop/orders/order[status = "Đã thanh toán"]
return $order:)

(: Câu 4: Lấy ra thông tin của tất cả các khách hàng và đơn hàng mà họ đã đặt :)
(:
for $customer in $drink_shop/drink_shop/customers/customer
let $orders := $drink_shop/drink_shop/orders/order[customer_id = $customer/id]
return
  <customer>
    {$customer/id}
    {$customer/name}
    {$customer/phone}
    {$customer/email}
    <orders>
      {$orders}
    </orders>
  </customer>:)

(: Câu 5: Lấy ra thông tin của tất cả các đơn hàng cùng với tên khách hàng và tên đồ uống :)
(:
for $order in $drink_shop//order
let $customer := $drink_shop//customer[id = $order/customer_id]
let $drink := $drink_shop//drink[id = $order/drink_id]
return
  <order>
    {$order/id}
    <customer>{$customer/name}</customer>
    <drink>{$drink/name}</drink>
    {$order/quantity}
    {$order/date}
    {$order/status}
  </order>:)


(: Câu 6: Liệt kê tên và giá của tất cả các sản phẩm trong cửa hàng đồ uống :)

(:for $drink in $drink_shop/drink_shop/drinks/drink
return concat($drink/name/text(), " - ", $drink/price/text(), " VND"):)

(: Câu 7: Liệt kê thông tin đầy đủ về tất cả các đơn hàng đã được thanh toán :)

(:for $order in $drink_shop/drink_shop/orders/order[status='Đã thanh toán']
let $customer := $drink_shop/drink_shop/customers/customer[id=$order/customer_id]/name/text()
let $product := $drink_shop/drink_shop/drinks/drink[id=$order/drink_id]/name/text()
return concat('Mã đơn hàng: ', $order/id/text(), ', Khách hàng: ', $customer, ', Sản phẩm: ', $product, ', Số lượng: ', $order/quantity/text(), ', Ngày đặt: ', $order/date/text()):)


(: Câu 8: Tính tổng số tiền khách hàng Nguyễn Văn A đã chi tiêu trong cửa hàng :)

(:
let $customer := $drink_shop/drink_shop/customers/customer[name='Nguyễn Văn A']
let $orders := $drink_shop/drink_shop/orders/order[customer_id=$customer/id]
return sum($orders/quantity * $drink_shop/drink_shop/drinks/drink[id=$orders/drink_id]/price)
:)

(: Câu 9: Lấy tên của các loại đồ uống trong cửa hàng :)
(:
for $drink in $drink_shop/drink_shop/drinks/drink
return $drink/name
:)

(: Câu 10: Lấy tên khách hàng và tên đồ uống trong đơn hàng có id là O001 :)

(:let $order := $drink_shop/drink_shop/orders/order[id = 'O001']
let $customer := $drink_shop/drink_shop/customers/customer[id = $order/customer_id]
let $drink := $drink_shop/drink_shop/drinks/drink[id = $order/product_id]
return concat("Khách hàng: ", $customer/name, "; Đồ uống: ", $drink/name)
:)

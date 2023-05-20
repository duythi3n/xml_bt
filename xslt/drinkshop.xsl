<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
        <xsl:output method="html" indent="yes"/>
        <!-- Hiển thị bảng đồ uống -->
        <xsl:template match="/">
            <h2>Đồ uống</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                </tr>
                <xsl:for-each select="/drink_shop/drinks/drink">
                    <tr>
                        <td><xsl:value-of select="id"/></td>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="price"/>đ</td>
                        <td><xsl:value-of select="description"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <br/>

        
        <!-- Hiển thị bảng khách hàng -->
            <h2>Khách hàng</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Điện thoại</th>
                    <th>Email</th>
                </tr>
                <xsl:for-each select="/drink_shop/customers/customer">
                    <tr>
                        <td><xsl:value-of select="id"/></td>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="phone"/></td>
                        <td><xsl:value-of select="email"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <br/>
        
        <!-- Hiển thị bảng hóa đơn  -->
            <h2>Đơn hàng</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Khách hàng ID</th>
                    <th>Sản phẩm ID</th>
                    <th>Số lượng</th>
                    <th>Ngày đặt hàng</th>
                    <th>Trạng thái</th>
                </tr>
                <xsl:for-each select="/drink_shop/orders/order">
                    <tr>
                        <td><xsl:value-of select="id"/></td>
                        <td><xsl:value-of select="customer_id"/></td>
                        <td><xsl:value-of select="drink_id"/></td>
                        <td><xsl:value-of select="quantity"/></td>
                        <td><xsl:value-of select="date"/></td>
                        <td><xsl:value-of select="status"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <br/>
        </xsl:template>               
</xsl:stylesheet>
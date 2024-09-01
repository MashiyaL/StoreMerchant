// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Merchant {

    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 quantity;
    }

    mapping (uint256 => Product) products;
    uint256 productsCount = 0;

    function createProduct(string calldata _name, uint256 _price, uint256 _quantity) external  {
        products[productsCount] = Product({
            id: productsCount,
            name: _name,
            price: _price,
            quantity: _quantity
        });

        productsCount++;
    }

    function getProducts() external view  returns (Product[] memory) {
        Product[] memory _products = new Product[](productsCount);
        
        for (uint256 _i = 0; _i < productsCount; _i++) {
            _products[_i] = products[_i];
        }

        return _products;
    }

    function getProduct(uint256 _id) external view returns  (Product memory) {
        return products[_id];
    } 

}
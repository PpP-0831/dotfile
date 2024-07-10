// ==UserScript==
// @name         Delete PBRT Search Bar
// @namespace    cleanup
// @version      0.1
// @description  Remove the ugly search bar on the PBRT online version website
// @author       Peyton
// @match        https://pbr-book.org/4ed/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=tampermonkey.net
// @grant        none
// ==/UserScript==

// Get the element by its class name
const element = document.querySelector('.fixed-top-lg-navbar');

// Check if the element with the specified class exists
if (element) {
  // Remove the 'fixed-top-lg-navbar' class
  element.classList.remove('fixed-top-lg-navbar');
}

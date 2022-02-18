// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

function changeColor(element, backgroundColor, textColor){
    element.style.backgroundColor = backgroundColor
    if(textColor){
        element.style.color = textColor
    }
}


document.addEventListener('turbolinks:load',()=> {

    const links = document.querySelectorAll('a[data-background-color]')
    links.forEach((element)=> {
        element.addEventListener("click", (event)=>{
            event.preventDefault()
            console.log(element)
            
            const {backgroundColor,textColor} = element.dataset

            changeColor(element,backgroundColor,textColor)


        })
    })

    
})

// console.log('test')

// require('packs/test')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

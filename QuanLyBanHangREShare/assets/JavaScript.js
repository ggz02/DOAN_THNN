window.addEventListener("load", function () {
    const prev = document.querySelector('.slider-prev');
    const next = document.querySelector('.slider-next');

    const slider = document.querySelector(".slider");
    const sliderMain = document.querySelector(".slider-main");
    const sliderItems = document.querySelectorAll(".slider-item");
    const sliderItemWidth = sliderItems[0].offsetWidth;
    const slidersLength = sliderItems.length;
    let postionX = 0;
    let index = 0;

    next.addEventListener("click", function () {
        handleChangeSlide(1);
    });

    prev.addEventListener("click", function () {
        handleChangeSlide(-1);
    });

    function handleChangeSlide(direction) {
        if (direction === 1) {
            if (index >= slidersLength - 1) {
                index = slidersLength - 1;
                return;
            }
            postionX = postionX - sliderItemWidth;
            sliderMain.style = `transform: translateX(${postionX}px)`;
            index++;
        }
        else if (direction === -1) {
            if (index <= 0) {
                index = 0;
                return;
            };
            postionX = postionX + sliderItemWidth;
            sliderMain.style = `transform: translateX(${postionX}px)`;
            index--;
        }
    }

});

//Phần show and hidden button cart
const btn_header = document.querySelector('.
--header')
const btn_nav = document.querySelector('.btn_dathang--nav')
const hadleScroll = () => {
    if (window.scrollY >= 20) {
        Object.assign(btn_header.style, {
            opacity: 1,
            PointerEvent: 'auto',
        })
        Object.assign(btn_nav.style, {
            opacity: 0,
            PointerEvent: 'none',
        })
    }
    else {
        Object.assign(btn_header.style, {
            opacity: 0,
            PointerEvent: 'none',
        })
        Object.assign(btn_nav.style, {
            opacity: 1,
            PointerEvent: 'auto',
        })
    }
}
window.addEventListener('scroll', hadleScroll)
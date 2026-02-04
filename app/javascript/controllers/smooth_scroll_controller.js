import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="smooth-scroll"
export default class extends Controller {
  connect() {
    this.element.addEventListener("click", this.handleClick.bind(this))
    window.addEventListener("scroll", this.handleScroll.bind(this))
    this.handleScroll() // 초기 상태 확인
  }

  disconnect() {
    this.element.removeEventListener("click", this.handleClick.bind(this))
    window.removeEventListener("scroll", this.handleScroll.bind(this))
  }

  // 스크롤 위치에 따라 네비게이션 활성 상태 업데이트 (ScrollSpy)
  handleScroll() {
    const navLinks = document.querySelectorAll(".navbar13_link")
    const scrollPosition = window.pageYOffset + 150 // 여백 고려

    navLinks.forEach(link => {
      const hash = link.hash
      if (!hash || hash === "#") return
      
      const section = document.querySelector(hash)
      if (!section) return

      const sectionTop = section.offsetTop
      const sectionHeight = section.offsetHeight

      if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
        link.classList.add("active")
      } else {
        link.classList.remove("active")
      }
    })
  }

  handleClick(event) {
    const link = event.target.closest("a")
    if (!link) return

    const url = new URL(link.href, window.location.origin)
    if (url.pathname !== window.location.pathname) return
    if (!url.hash || url.hash === "#") return

    const targetElement = document.querySelector(url.hash)
    if (!targetElement) return

    event.preventDefault()

    const targetPosition = targetElement.getBoundingClientRect().top + window.pageYOffset
    const startPosition = window.pageYOffset
    const distance = targetPosition - startPosition - 100 // Padding 보정
    const duration = 1200 // 속도를 여유롭게
    let startTime = null

    const easeInOutCubic = (t, b, c, d) => {
      t /= d / 2
      if (t < 1) return (c / 2) * t * t * t + b
      t -= 2
      return (c / 2) * (t * t * t + 2) + b
    }

    const animation = (currentTime) => {
      if (startTime === null) startTime = currentTime
      const timeElapsed = currentTime - startTime
      const run = easeInOutCubic(timeElapsed, startPosition, distance, duration)
      window.scrollTo(0, run)
      if (timeElapsed < duration) {
        requestAnimationFrame(animation)
      } else {
        window.history.pushState(null, null, url.hash)
        this.handleScroll() // 이동 후 활성 상태 즉시 갱신
      }
    }

    requestAnimationFrame(animation)
  }
}

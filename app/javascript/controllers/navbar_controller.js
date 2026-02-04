import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    this.isOpen = false
    this.ensureBackdrop()
  }

  ensureBackdrop() {
    if (!document.querySelector(".nav-backdrop")) {
      const backdrop = document.createElement("div")
      backdrop.className = "nav-backdrop"
      backdrop.setAttribute("data-action", "click->navbar#toggle")
      document.body.appendChild(backdrop)
    }
  }

  toggle() {
    this.isOpen = !this.isOpen
    if (this.isOpen) {
      this.openMenu()
    } else {
      this.closeMenu()
    }
  }

  openMenu() {
    this.menuTarget.classList.add("w--open")
    this.buttonTarget.classList.add("w--open")
    document.body.classList.add("menu-open") // 배경 어둡게 처리용 클래스
    document.body.style.overflow = "hidden"
    
    // 메뉴 내 링크 클릭 시 닫기
    const links = this.menuTarget.querySelectorAll("a")
    links.forEach(link => {
      link.addEventListener("click", () => this.closeMenu(), { once: true })
    })
  }

  closeMenu() {
    this.menuTarget.classList.remove("w--open")
    this.buttonTarget.classList.remove("w--open")
    document.body.classList.remove("menu-open")
    document.body.style.overflow = ""
    this.isOpen = false
  }

  // 메뉴 외부 클릭 시 닫기 (필요시)
  clickAway(event) {
    if (this.isOpen && !this.element.contains(event.target)) {
      this.closeMenu()
      this.isOpen = false
    }
  }
}

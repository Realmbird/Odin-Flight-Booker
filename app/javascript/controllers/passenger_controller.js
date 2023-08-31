import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "list"]
  static values = { passengerCount: Number }
  connect() {
    passengerCountValueChanged()
  }
  addPassenger(){
    this.passengerCountValue++
    const template = document.getElementById("templatepassenger");
    const firstClone = template.content.cloneNode(true);
    const placeholder = firstClone.getElementById("placeholderId")
    placeholder.id = this.passengerCountValue
    this.listTarget.appendChild(firstClone);
  }
  deletePassenger(){
    const passenger = document.getElementById(this.passengerCountValue)
    if(this.passengerCountValue > 1){
      passenger.remove()
      this.passengerCountValue--
    }else{
      this.passengerCountValue = 1
    }
  }
  passengerCountValueChanged(){
    console.log(this.passengerCountValue)
    this.displayTarget.textContent = "Passenger Count: " + this.passengerCountValue
  }
}

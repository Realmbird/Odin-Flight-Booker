import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]
  static values = { passengerCount: Number }
  connect() {
    passengerCountValueChanged()
  }
  addPassenger(){
    this.passengerCountValue++
  }
  deletePassenger(){
    if(this.passengerCountValue > 1){
      this.passengerCountValue--
    }else{
      this.passengerCountValue = 1
    }
  }
  passengerCountValueChanged(){
    this.displayTarget.textContent = "Passenger Count: " + this.passengerCountValue
  }
}

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Chartkick from "chartkick"
import { Chart, registerables } from "chart.js"
Chart.register(...registerables)
Chartkick.addAdapter(Chart)

// Entry point for the build script in your package.json
import { Turbo } "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
Turbo.session.drive = false

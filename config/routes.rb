Rails.application.routes.draw do
  root "staticpages#home"
  get  "/section",    to: 'staticpages#section'
  get  "/detail",    to: 'staticpages#detail'
  get  "/history",    to: 'staticpages#history'
end

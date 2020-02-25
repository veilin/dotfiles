# Lovingly crafted by Rohan Likhite [rohanlikhite.com]
command: "finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ // '"

#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000

#Body Style
style: """

  color: #fff
  font-family: Helvetica Neue, Arial

  .container
   margin-top:10%
   height:300px
   width:100vw
   font-weight: lighter
   font-smoothing: antialiased
   text-align:center
   margin-left:0

  .line1
   font-size: 10em
   color: rgba(24,24,24,0.9);
   font-weight:700
   text-align:center

  .other-time-zones
   margin-top: -30px
   font-size: 1.3em
   font-weight:700
   color: rgba(24,24,24,0.8);

  .time
   color: rgba(24,24,24,1);

  .twee-kolle
   color: rgba(24,24,24,0.5);
   margin-left: 10px
   margin-right: 10px
   font-size: 1.3em

"""

#Render function
render: -> """
  <div class="container">
    <div class="line1">
      <span class="hour"></span><span class="twee-kolle">:</span><span class="min"></span>
    </div>
    <div class="other-time-zones"></div>
  </div>

"""

#Update function
update: (output, domEl) ->

  #Your location
  date = new Date()
  hour = date.getHours()
  minutes = date.getMinutes()
  hour = "0"+ hour if hour < 10
  minutes = "0"+ minutes if minutes < 10
  $(domEl).find('.hour').text("#{hour}")
  $(domEl).find('.min').text("#{minutes}")

  #Other timezones
  timeZones = [
    {
      description: "Atlanta", 
      locale: "America/New_York"
    },
    {
      description: "London",
      locale: "Europe/London"
    },
    {
      description: "South Africa",
      locale: "Africa/Johannesburg"
    },
    {
      description: "Sydney",
      locale: "Australia/Sydney"
    }
  ]

  #DOM Manipulation
  $(domEl).find('.other-time-zones').empty()
  for i in [0...timeZones.length]
    timeZones[i].date = new Date(new Date().toLocaleString("en-US", {timeZone: timeZones[i].locale}))
    timeZones[i].hours = timeZones[i].date.getHours()
    timeZones[i].minutes = timeZones[i].date.getMinutes()
    timeZones[i].hours = "0"+ timeZones[i].hours if timeZones[i].hours < 10
    timeZones[i].minutes = "0"+ timeZones[i].minutes if timeZones[i].minutes < 10
    $(domEl).find('.other-time-zones').append('<div class="line"><span class="description">'+timeZones[i].description+'</span> <span class="time">'+timeZones[i].hours+':'+timeZones[i].minutes+'</span></div>')
import { Controller } from "@hotwired/stimulus"
import Calendar from "tui-calendar";


export default class extends Controller {
    static targets = ["monthName"]
    months = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    getcalendarData() {
        let url = "/bookings.json"
        fetch(url)
        .then(response => response.json())
        .then((data) => { data.forEach((booking) => {
            this.calendar.createSchedules([
                {
                    id: booking.id,
                    calendarId: '1',
                    title: booking.title,
                    location: booking.room,
                    category: 'time',
                    dueDateClass: '',
                    start: booking.start_at,
                    end: booking.end_at,
                    attendees: [booking.customer],
                }
            ])
        })
    })
    }

    next() {
        this.calendar.next();
        this.monthNameTarget.textContent = this.months[this.calendar.getDateRangeStart()._date.getMonth() + 1]
    }

    previous() {
        this.calendar.prev();
        this.monthNameTarget.textContent = this.months[this.calendar.getDateRangeStart()._date.getMonth() + 1]
    }

    today() {
        this.calendar.today();
        this.monthNameTarget.textContent = this.months[this.calendar.getDateRangeStart()._date.getMonth() + 1]
    }
    week() {
        this.calendar.changeView('week', true);
        this.monthNameTarget.textContent = this.months[this.calendar.getDateRangeStart()._date.getMonth() + 1]
    }

    month() {
        this.calendar.changeView('month', true);
        this.monthNameTarget.textContent = this.months[this.calendar.getDateRangeStart()._date.getMonth() + 1]
    }
  connect() {
      this.calendar = new Calendar(document.getElementById('calendar'), {
          id: '1',
          name: 'My Calendar',
          defaultView: 'week',
          color: '#00a9ff',
          bgColor: '#00a9ff',
          borderColor: 'red',
          milestone: true,
          scheduleView: true,
          useCreationPopup: false,
          useDetailPopup: true,
          taskView: false,
          milestoneView: false,
          isReadOnly: true
      })
      this.getcalendarData()
      this.monthNameTarget.textContent = this.months[this.calendar.getDateRangeStart()._date.getMonth() + 1]
  }
}

require 'active_support/core_ext'
require 'rubygems'
require 'dogapi'

API_KEY = ""
APPLICATION_KEY = ""
APPLICATIONS = [
  {
    app: "bsa-notifications",
    metrics: [
      {
        name: "Amenity",
        id: "avg:synced.bsa_notifications.production.amenity.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Booking",
        id: "avg:synced.bsa_notifications.production.booking.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Bookings Fee",
        id: "avg:synced.bsa_notifications.production.bookings_fee.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Bookings Tag",
        id: "avg:synced.bsa_notifications.production.bookings_tag.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Booking Comment",
        id: "avg:synced.bsa_notifications.production.booking_comment.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Photo",
        id: "avg:synced.bsa_notifications.production.photo.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Client",
        id: "avg:synced.bsa_notifications.production.client.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rental",
        id: "avg:synced.bsa_notifications.production.rental.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Review",
        id: "avg:synced.bsa_notifications.production.review.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Source",
        id: "avg:synced.bsa_notifications.production.source.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Bathroom",
        id: "avg:synced.bsa_notifications.production.bathroom.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rentals Tag",
        id: "avg:synced.bsa_notifications.production.rentals_tag.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rentals Amenity",
        id: "avg:synced.bsa_notifications.production.rentals_amenity.maximum_sync_latency_in_minutes{*}"
      }
    ]
  },
  {
    app: "bsa-owners",
    metrics: [
      {
        name: "Photo",
        id: "avg:synced.bsa_owners.production.photo.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Client",
        id: "avg:synced.bsa_owners.production.client.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rental",
        id: "avg:synced.bsa_owners.production.rental.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Account",
        id: "avg:synced.bsa_owners.production.account.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Booking",
        id: "avg:synced.bsa_owners.production.booking.maximum_sync_latency_in_minutes{*}"
      }
    ]
  },
  {
    app: "bsa-apidae",
    metrics: [
      {
        name: "Photo",
        id: "avg:synced.bsa_apidae.production.photo.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rental",
        id: "avg:synced.bsa_apidae.production.rental.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Account",
        id: "avg:synced.bsa_apidae.production.account.maximum_sync_latency_in_minutes{*}"
      }
    ]
  },
  {
    app: "bsa-invoices",
    metrics: [
      {
        name: "Booking",
        id: "avg:synced.bsa_invoices.production.booking.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Client",
        id: "avg:synced.bsa_invoices.production.client.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rental",
        id: "avg:synced.bsa_invoices.production.rental.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Account",
        id: "avg:synced.bsa_invoices.production.account.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Booking Fee",
        id: "avg:synced.bsa_invoices.production.bookings_fee.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Booking Tax",
        id: "avg:synced.bsa_invoices.production.bookings_tax.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Tax",
        id: "avg:synced.bsa_invoices.production.tax.maximum_sync_latency_in_minutes{*}"
      }
    ]
  },
  {
    app: "bsa-website",
    metrics: [
      {
        name: "Photo",
        id: "avg:synced.bsa_website.production.photo.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "LosRecord",
        id: "avg:synced.bsa_website.production.los_record.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rental",
        id: "avg:synced.bsa_website.production.rental.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Account",
        id: "avg:synced.bsa_website.production.account.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rate",
        id: "avg:synced.bsa_website.production.rate.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Video",
        id: "avg:synced.bsa_website.production.video.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Bathroom",
        id: "avg:synced.bsa_website.production.bathroom.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Bedroom",
        id: "avg:synced.bsa_website.production.bedroom.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "LivingRoom",
        id: "avg:synced.bsa_website.production.living_room.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Review",
        id: "avg:synced.bsa_website.production.review.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Amenity",
        id: "avg:synced.bsa_website.production.amenity.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Contact",
        id: "avg:synced.bsa_website.production.contact.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rentals Tags",
        id: "avg:synced.bsa_website.production.rentals_tag.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rental Cancelation Policy",
        id: "avg:synced.bsa_website.production.rental_cancelation_policy.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Rentals Amenities",
        id: "avg:synced.bsa_website.production.rentals_amenity.maximum_sync_latency_in_minutes{*}"
      },
      {
        name: "Special Offer",
        id: "avg:synced.bsa_website.production.special_offer.maximum_sync_latency_in_minutes{*}"
      },
    ]
  }
]

def fetch_metrics(year, month)
  dog = Dogapi::Client.new(API_KEY, APPLICATION_KEY)

  from = DateTime.new(year.to_i, month.to_i, 1, 0, 0, 0)
  to = from.end_of_month

  APPLICATIONS.each do |app|
    app_name = app.fetch(:app)
    puts app_name
    puts "*"*app_name.length

    app.fetch(:metrics).each do |metric|
      name = metric.fetch(:name)
      query = metric.fetch(:id)

      points = dog.get_points(query, from, to)[1]["series"].first["pointlist"].map { |x| x[1].to_f }
      avg = (points.sum.to_f / points.size.to_f).round(2)

      puts "  #{name}\t#{avg}"
    end

    puts ""
  end
end

if ARGV.length != 2
  puts "use: ruby dog.rb <year> <month>"
  exit
end

fetch_metrics(*ARGV)

import csv
import os
from django.http import HttpResponse
from django.shortcuts import render
from myapp.models import Membership, ParkingArea

def update_csv(request):
    # Get the data from the database
    memberships = Membership.objects.all()
    parking_areas = ParkingArea.objects.all()

    # Define the CSV file path
    csv_file_path = '../shareddir/logs.csv'

    # Write the membership and parking area data to the CSV file
    with open(csv_file_path, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Membership ID', 'Remaining Days'])
        for membership in memberships:
            writer.writerow([membership.id, membership.remaining_days])
        writer.writerow(['Parking Area', 'Occupancy'])
        for parking_area in parking_areas:
            writer.writerow([parking_area.name, parking_area.occupancy])

    return HttpResponse('CSV file updated successfully.')

def update_database(request):
    # Define the CSV file path
    csv_file_path = '/path/to/shared/directory/membership_parking.csv'

    # Read the CSV file and update the database
    with open(csv_file_path, 'r') as csvfile:
        reader = csv.reader(csvfile)
        rows = list(reader)

        # Update membership table
        for row in rows[1:]:  # Skip the header row
            membership_id, remaining_days = row
            membership = Membership.objects.get(id=membership_id)
            membership.remaining_days = int(remaining_days)
            membership.save()

        # Update parking areas table
        parking_areas_rows = rows[3 + len(rows[1:]):]  # Skip the membership rows and header rows
        for row in parking_areas_rows:
            parking_area_name, occupancy = row
            parking_area = ParkingArea.objects.get(name=parking_area_name)
            parking_area.occupancy = int(occupancy)
            parking_area.save()

    return HttpResponse('Database updated successfully.')

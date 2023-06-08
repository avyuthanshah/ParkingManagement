import datetime
import csv

entry_limit = 15 # limit to data entry
file_path = "../shareddir/logs.csv" # file where the data log is saved

def entry_data(vehicle_id): # vehicle_id is the id to be entried
    entry_time = datetime.datetime.now()
    data = [str(vehicle_id),entry_time,"Null", "Null"] # data to be saveda

    

    with open(file_path, 'r') as rfile:
        reader = csv.reader(rfile)
        line_count = sum(1 for row in reader)
        if line_count >entry_limit+1:
            return False
        with open(file_path, "a", newline='') as csvfile:
            writer = csv.writer(csvfile)
            
            writer.writerow(data)
        return True

def update_data(vehicle_id, vehicle_owner, remaining):
    

    rows = []
    with open(file_path, 'r') as rfile:
        reader = csv.reader(rfile)
        for row in reader:
            if row[0] == vehicle_id.__str__():
                row[2] = vehicle_owner
                row[3] = remaining
            rows.append(row)
    with open(file_path, "w", newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rows)


def delete_data(vehicle_id):
    

    rows = []
    with open(file_path, 'r') as rfile:
        reader = csv.reader(rfile)
        for row in reader:
            if row[0] != vehicle_id.__str__():
                rows.append(row)
    with open(file_path, "w", newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rows)

def get_data(vehicle_id):
    info=[]
    with open(file_path,'r') as gD:
        reader=csv.reader(gD)
        for row in reader:
            if row[0]==vehicle_id.__str__():
                info=[row[1],row[2],row[3]]
                break
        return info
    
# entry_data('BAA 5223')
# update_data('BAA 5223','Ram',0)

# info=get_data("BAA 5223")
# print(type(info[0]))

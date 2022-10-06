import json
import argparse
from os import listdir, environ

parser = argparse.ArgumentParser()
email_path = environ["PWD"] + "/emails"
config_path = environ["PWD"] + "/config.json"

parser.add_argument("-v", "--verbose", action="store_true")
parser.add_argument("-e", "--email", help="select the json file (email).")
parser.add_argument("-g", "--get", help="get one value with a key.")
parser.add_argument("--list", help="list all the emails", action="store_true")
parser.add_argument("-l", "--label", nargs=2, metavar=("action", "label"), help="add/rm a label")

# Get a dict from a json file
def json_to_dict(file_path):
  with open(file_path, 'r', encoding='utf8') as json_file:
    data = json.load(json_file)
  return data

# Write to a json file
def dict_to_json(data, file_path):
  with open(file_path, 'w', encoding='utf8') as json_file:
    json.dump(data, json_file, indent=4, ensure_ascii=False)


args = parser.parse_args()

if args.email:
  if args.email in [i.split(".")[0] for i in listdir(email_path)]:
    selected_email = f"{email_path}/{args.email}.json"
    data = json_to_dict(selected_email)
    config_data = json_to_dict(config_path)

    if args.get:
      if args.verbose: 
        print(f"{args.get}: {data[args.get]}")
      else:
        print(data[args.get])

    elif args.label:
      action, s_label = args.label
      if action == "add":
        data["labels"].append(s_label)
        dict_to_json(data, selected_email)

        if s_label in config_data["labels"]:
          config_data["labels"][s_label].append(args.email)
        else:
          config_data["labels"][s_label] = [args.email]

      elif action == "rm":
        data["labels"].remove(s_label)
        dict_to_json(data, selected_email)
        if s_label in config_data["labels"]:
          if len(config_data["labels"]) == 1:
            config_data["labels"].remove(s_label)
          else:
            config_data["labels"][s_label].remove(args.rl)


  else:
    print("Email not found.")


if args.list:
  for i in listdir(email_path):
    print(i)
# print([i for i in listdir(email_path)])
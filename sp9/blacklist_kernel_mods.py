import os
import sys

def ensure_root_privileges():
    """Ensure the script is run with root privileges."""
    if os.geteuid() != 0:
        sys.exit("This script requires root privileges. Please run with sudo.")

def ensure_file_exists(filepath):
    """Ensure the file exists. If not, create it."""
    if not os.path.exists(filepath):
        with open(filepath, 'w') as file:
            pass  # Just create an empty file
        print(f"Created {filepath}")

def append_blacklist_entries(filepath, modules):
    """Append blacklist entries for the specified modules if they are not already present."""
    with open(filepath, 'r+') as file:
        existing_content = file.read()
        
        for module in modules:
            blacklist_entry = f"blacklist {module}"
            if blacklist_entry not in existing_content:
                file.write(f"{blacklist_entry}\n")
                print(f"Added '{blacklist_entry}' to {filepath}.")
            else:
                print(f"'{blacklist_entry}' is already present in {filepath}.")

def main():
    ensure_root_privileges()

    blacklist_path = "/etc/modprobe.d/blacklist.conf"
    modules_to_blacklist = ["intel-ipu6", "intel-ipu6-isys"]

    ensure_file_exists(blacklist_path)
    append_blacklist_entries(blacklist_path, modules_to_blacklist)

if __name__ == "__main__":
    main()


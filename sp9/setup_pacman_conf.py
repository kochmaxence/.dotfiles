import os

def check_and_append_config(main_config_path, extras_config_path):
    # Check if the files exist
    if not os.path.exists(main_config_path):
        print(f"Error: {main_config_path} does not exist.")
        return
    
    if not os.path.exists(extras_config_path):
        print(f"Error: {extras_config_path} does not exist.")
        return
    
    # Read the content of both files
    with open(main_config_path, 'r') as main_file:
        main_content = main_file.read()
    
    with open(extras_config_path, 'r') as extras_file:
        extras_content = extras_file.read()

    # Check if the extras content is already in the main content
    if extras_content in main_content:
        print("The content of pacman.extras.conf is already present in pacman.conf.")
    else:
        # If not, append the extras content to the main config file
        with open(main_config_path, 'a') as main_file:
            main_file.write("\n" + extras_content)
        print("The content of pacman.extras.conf has been appended to pacman.conf.")

if __name__ == "__main__":
    # Determine the absolute path of the script directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Set the path for the main config and extras config files
    main_config_path = "/etc/pacman.conf"
    extras_config_path = os.path.join(script_dir, "pacman.extras.conf")
    
    check_and_append_config(main_config_path, extras_config_path)


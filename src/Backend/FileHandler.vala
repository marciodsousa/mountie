namespace mountie.Backend {

    public class FileHandler {
        public static void start(File file) {
            var type = "";
            try {
                type = file.query_info("*", FileQueryInfoFlags.NONE).get_content_type();
                stderr.printf ("%s\n", type);
            } catch(Error e) {
                stderr.printf ("%s\n", e.message);
            }
            
            string filepath = file.get_path();       
            switch(type) {
                case "application/x-cd-image": //iso
                    new Notify.Notification ("Mounting image...", filepath, "ubiquity").show();
                    
                    break; 
                case "application/x-shellscript":
                    //launch_interpreter(Interpreter.SHELL, filepath);   
                    break;     
                case "text/x-python":
                    //launch_interpreter(Interpreter.PYTHON, filepath);  
                    break;                                
                default:
                    new Notify.Notification ("Unsupported file-type.", null, "ubiquity").show();

                    break;            
            }

            if (!file.query_exists ()) {
                stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
            }else {
                stderr.printf ("File '%s' exists.\n", file.get_path ());                    
            }

            //is directory
        }


/*
        public void extract_theme(string file, string extract_dir) {
            var extract_dir_file = File.new_for_path(file);
            if(!extract_dir_file.query_exists()) {
                show_notification(@"The $extract_dir directory does not exist. The files could not be extracted.", true);
                return;
            }
                    
            var read = new Archive.Read();
            read.support_format_all();
            read.support_compression_all();

            Posix.chdir(extract_dir);
            var stream = FileStream.open(file, "r");
            var res = read.open_FILE(stream);
            if(res == Archive.Result.OK) {
                unowned Archive.Entry entry;
                while(read.next_header(out entry) == Archive.Result.OK)
                    read.extract(entry);
            } else {
                show_notification("Could not open file for reading. The files could not be extracted.", true);
                return;
            }
            
            show_notification(@"Successfully extracted contents of file: $file to $extract_dir!");
            Posix.chdir(HOME_DIR);
        }

        public void execute_drag(string file, bool gtk_theme, bool icon_theme, bool plank_theme) {
            if (window == null) {
                window = new MainWindow.for_quiet ();
                window.header_set_working(true);
                window.@unref ();
            }

            string sys_data_dir = Environment.get_system_data_dirs()[1];
            string extract_dir = "default";
            if(gtk_theme)
                extract_dir = sys_data_dir + "themes/";
            else if(icon_theme)    
                extract_dir = sys_data_dir + "icons/";
            else if(plank_theme)  
                extract_dir = sys_data_dir + "plank/themes/";  
                
            var dragged = File.new_for_path(file);
            file_handler.start(dragged, extract_dir);
            
            window.header_set_working(false);
        }      
               
        private void debian_notify_success(string filename) {
            show_notification(@"Successfully installed debian file: $filename!");
        }
        
        private void install_debian(string file, string filename) {
            handler.execute_shell({ "dpkg", "-i", file }, true);
            if(handler.shell_exit == 0) {
                debian_notify_success(filename);
                return;
            } else {
                handler.execute_shell({ "apt-get", "install", "-y", "-f" }, true);
                handler.execute_shell({ "dpkg", "-i", file }, true);
                if(handler.shell_exit == 0)
                    debian_notify_success(filename);
                else
                    show_notification("Something went wrong. Check out: /tmp/pi-log.txt for more information.", true);
            } 
        }
        
        private void launch_interpreter(Interpreter interpreter, string file) {
            string str_inter = "";
            if(interpreter == 0)
                str_inter = "bash";
            else if(interpreter == 1)
                str_inter = "python";
            
            string arg = str_inter + " " + file;
            handler.body_success = @"Successfully executed $str_inter file: $file";
            handler.body_error = "Something went wrong. The file could not exist.";    
            handler.execute_shell({ "x-terminal-emulator", "-e", arg }); 
        }*/
    }
}  
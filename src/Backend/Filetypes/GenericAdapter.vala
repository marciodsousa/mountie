namespace mountie.Backend.Filetypes {

	public class GenericAdapter{

	private string name;
	private string path;
	private string fileName;
	private string mountPath;
	private bool mounted;
	private Date lastMountDate;
		public GenericAdapter (string name, string path, string fileName, string mountPath, bool mounted) {
			this.name = name;
			this.path = path;
			this.fileName = fileName;
			this.mountPath = mountPath;
			this.mounted = mounted;
		}
		
        /*public void mount(Interpreter interpreter, string file) {
        	//execute script for folder creation
        	//execute script for image loading	
        	//send notifications

        }

        public void unmount(Interpreter interpreter, string file) {
        	//execute script for folder deletion
        	//execute script for image umounting
        	//send notifications        	
        }*/

        public string getName(){
        	return this.name;
        }

        public string getPath(){
        	return this.path;
        }

        public string getFileName(){
        	return this.path;
        }

        public string getMountPath(){
        	return this.mountPath;
        }

        public bool isMounted(){
        	return this.mounted;
        }

        public Date getLastMountDate(){
        	return this.lastMountDate;
        }

	}
}
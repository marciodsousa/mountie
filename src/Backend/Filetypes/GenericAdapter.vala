namespace mountie.Backend.Filetypes {

	public class GenericAdapter : GLib.Object {

		public string name { get; private set; }
		public string path { get; set; }
		public string fileName { get; private set; }
		public string mountPath { get; set; }
		public bool mounted { get; set; }
		public DateTime lastMountDate { get; set; }
		
		public GenericAdapter (string name, string path, string fileName, string mountPath, bool mounted) {
			this.name = name;
			this.path = path;
			this.fileName = fileName;
			this.mountPath = mountPath;
			this.mounted = mounted;
			this.lastMountDate = new DateTime.now_local();
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
	}
}
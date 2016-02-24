using mountie.Backend.Filetypes;

namespace mountie.Backend {
	
	public class ImageCollection {
		private static ImageCollection instance = new ImageCollection();
		private List<GenericAdapter> images;
		private ImageCollection() {
			images = new List <GenericAdapter> ();
			images.append(new mountie.Backend.Filetypes.GenericAdapter("PSX Games", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive1", true));
			images.append(new mountie.Backend.Filetypes.GenericAdapter("Need For Speed 3", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive2", false));
			images.append(new mountie.Backend.Filetypes.GenericAdapter("Dummy Disc", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive3", false));
			images.append(new mountie.Backend.Filetypes.GenericAdapter("Dummy Disc 2", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive4", true));
			images.append(new mountie.Backend.Filetypes.GenericAdapter("CD Backup", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive5", false));
			images.append(new mountie.Backend.Filetypes.GenericAdapter("Emulators", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive6", true));
			images.append(new mountie.Backend.Filetypes.GenericAdapter("Example", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive7", true));
		}

		public static ImageCollection getInstance() {
			return instance;
		}
		public List<GenericAdapter> getImages() {
			return images.copy();
		}
	}
}
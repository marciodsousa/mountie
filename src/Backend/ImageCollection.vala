using mountie.Backend.Filetypes;
using GLib;

namespace mountie.Backend {
	
	public class ImageCollection : Object {
		private static GLib.Once<ImageCollection> instance;
		private List<GenericAdapter> images;
		public static unowned ImageCollection getInstance() {
			return instance.once (() => {
				ImageCollection imgCol = new ImageCollection ();
				List <GenericAdapter> listImgs =  new List <GenericAdapter> ();
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("PSX Games", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive1", true));
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("Need For Speed 3", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive2", false));
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("Dummy Disc", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive3", false));
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("Dummy Disc 2", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive4", true));
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("CD Backup", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive5", false));
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("Emulators", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive6", true));
				listImgs.append(new mountie.Backend.Filetypes.GenericAdapter("Example", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive7", true));
				imgCol.setImages(listImgs);

				return imgCol; 
				});
		}

		public List<GenericAdapter> getImages() {
			return images.copy();
		}

		public void setImages(List<GenericAdapter> list) {
			images = list.copy();
		}

		public void addImage(GenericAdapter adapter) {
			images.append(adapter);
		}
	}
}
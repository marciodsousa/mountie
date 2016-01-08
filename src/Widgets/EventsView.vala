/* Copyright 2015 Marcus Wichelmann
*
* This file is part of mountie.
*
* mountie is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* mountie is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without mountie the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with mountie. If not, see http://www.gnu.org/licenses/.
*/

namespace mountie.Widgets {
	public class EventsView : Gtk.Box {
		private Gtk.Stack stack;

		private InfoScreen info_screen;

		private Gtk.ScrolledWindow scrolled;
		private KeyList key_list;

		public EventsView () {
			stack = new Gtk.Stack ();

			/*info_screen = new InfoScreen (_("Haven't mounted anything yet!"),
					_("Here, you will see a list of the mounted images, and the previous ones that are still available!") + "\n\n" +
					_("To mount a new image, simply drag and drop it into this window, or use the corresponding option in the right-click menu of the image."),
					"media-eject");


			stack.add_named (info_screen, "info-screen");*/

			scrolled = new Gtk.ScrolledWindow (null, null);
			scrolled.hscrollbar_policy = Gtk.PolicyType.NEVER;

			key_list = new KeyList ();
			key_list.valign = Gtk.Align.START;
			key_list.margin_start = 12;
			key_list.margin_end = 12;

			scrolled.add (key_list);

			stack.add_named (scrolled, "key-list");

			this.pack_start (stack, true, true);

			stack.set_visible_child_name ("key-list");
			var mountTest = new mountie.Backend.Filetypes.GenericAdapter("PSX Games", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive1", true);
			key_list.add_item (mountTest, true, false, true);
			mountTest = new mountie.Backend.Filetypes.GenericAdapter("Need For Speed 3", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive2", false);
			key_list.add_item (mountTest, true, false, true);
			mountTest = new mountie.Backend.Filetypes.GenericAdapter("Dummy Disc", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive3", false);
			key_list.add_item (mountTest, true, false, true);
			mountTest = new mountie.Backend.Filetypes.GenericAdapter("Dummy Disc 2", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive4", true);
			key_list.add_item (mountTest, true, false, true);
			mountTest = new mountie.Backend.Filetypes.GenericAdapter("CD Backup", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive5", false);
			key_list.add_item (mountTest, true, false, true);
			mountTest = new mountie.Backend.Filetypes.GenericAdapter("Emulators", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive6", true);
			key_list.add_item (mountTest, true, false, true);
			mountTest = new mountie.Backend.Filetypes.GenericAdapter("Example", "/home/marcio/Downloads/isos/", "psx_games.iso", "/mnt/mountieDrive7", true);
			key_list.add_item (mountTest, true, false, true);

			key_list.show_all ();
		}
	}
}

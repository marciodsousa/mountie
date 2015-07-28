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
	public class TitleBar : Gtk.HeaderBar {
		public TitleBar (MainWindow parent) {
			this.get_style_context ().add_class ("primary-toolbar");
			this.show_close_button = true;
			this.set_title (_("Mountie"));
		}
	}
}

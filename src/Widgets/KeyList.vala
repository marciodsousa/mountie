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
	public class KeyList : Gtk.Box {
		public KeyList () {
			this.orientation = Gtk.Orientation.VERTICAL;
		}

		public void show_keys_for_schema (Settings schema) {
			clear_list ();

			var keys = schema.list_keys ();

			for (int i = 0; i < keys.length; i++) {
				add_item ("schema");
			}

			this.show_all ();
		}

		public void add_item (string key, bool to_end = false, bool live = true, bool show_schema = false) {
			var item = new Key (key, live, show_schema);

			if (to_end)
				this.pack_end (item, false, false);
			else
				this.pack_start (item, false, false);
		}

		public void clear_list () {
			var childs = this.get_children ();

			for (int i = 0; i < childs.length (); i++) {
				this.remove (childs.nth_data (i));
			}

			this.show_all ();
		}
	}
}

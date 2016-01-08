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
	public class KeyInfo : Gtk.Grid {
		private Gtk.Label location_label;
		private Gtk.Label location_field;

		private Gtk.Label mount_location_label;
		private Gtk.Label mount_location_field;

		private Gtk.Label mount_date_label;
		private Gtk.Label mount_date_field;

		private Gtk.Label command_label;
		private Gtk.Label command_field;

		private Gtk.Label description_label;
		private Gtk.Label description_field;

		private Gtk.Button remove_button;

		public KeyInfo (mountie.Backend.Filetypes.GenericAdapter mount) {
			this.column_spacing = 12;
			this.row_spacing = 12;
			this.margin_top = 18;

			location_label = new Gtk.Label (_("<b>Location</b>"));
			location_label.use_markup = true;
			location_label.halign = Gtk.Align.END;
			this.attach (location_label, 0, 0, 1, 1);

			location_field = new Gtk.Label (mount.getPath() + mount.getFileName());
			location_field.use_markup = true;
			location_field.selectable = true;
			location_field.wrap = true;
			location_field.halign = Gtk.Align.START;
			location_field.hexpand = true;
			this.attach (location_field, 1, 0, 1, 1);

			mount_location_label = new Gtk.Label (_("<b>Mounted in</b>"));
			mount_location_label.use_markup = true;
			mount_location_label.halign = Gtk.Align.END;
			this.attach (mount_location_label, 0, 1, 1, 1);

			mount_location_field = new Gtk.Label (mount.getMountPath());
			mount_location_field.use_markup = true;
			mount_location_field.selectable = true;
			mount_location_field.wrap = true;
			mount_location_field.halign = Gtk.Align.START;
			mount_location_field.hexpand = true;
			this.attach (mount_location_field, 1, 1, 1, 1);

			mount_date_label = new Gtk.Label (_("<b>Last Mount Date</b>"));
			mount_date_label.use_markup = true;
			mount_date_label.halign = Gtk.Align.END;
			this.attach (mount_date_label, 0, 2, 1, 1);

			mount_date_field = new Gtk.Label (mount.getLastMountDate().format ("%x %X"));
			mount_date_field.use_markup = true;
			mount_date_field.selectable = true;
			mount_date_field.wrap = true;
			mount_date_field.halign = Gtk.Align.START;
			mount_date_field.hexpand = true;
			this.attach (mount_date_field, 1, 2, 1, 1);


			remove_button = new Gtk.Button.with_label (_("Remove"));
			remove_button.get_style_context ().add_class ("destructive-action");
			remove_button.halign = Gtk.Align.END;
			//remove_button.clicked.connect (() => settings.reset (name));
			this.attach (remove_button, 0, 5, 2, 1);
		}

		public void set_reset_enabled (bool enabled) {
			remove_button.sensitive = enabled;
		}
	}
}

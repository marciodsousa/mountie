/* Copyright 2015 Márcio de Sousa
*
* This file is part of Mountie.
*
* Mountie is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Mountie is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Mountie If not, see http://www.gnu.org/licenses/.
*/
using mountie.Backend.Filetypes;

namespace mountie {
	public class MainWindow : Gtk.Window {
		public mountieApp app;

		private Gtk.Box box;
		private Gtk.Stack stack;

		private Widgets.TitleBar title_bar;

		private Widgets.EventsView events_view;
		private const Gtk.TargetEntry[] targets = {
	        {"text/uri-list",0,0}
	    };

		public MainWindow (mountieApp app) {
			this.app = app;
			this.set_application (app);

			this.set_size_request (650, 650);
			this.set_has_resize_grip (false);
			this.window_position = Gtk.WindowPosition.CENTER;

			setup_ui ();

			this.show_all ();

			//connect drag drop handlers
	        Gtk.drag_dest_set (this,Gtk.DestDefaults.ALL, targets, Gdk.DragAction.COPY);
    	    this.drag_data_received.connect(this.on_drag_data_received);


            Notify.init ("mountie");
		}	

		private void setup_ui () {

			box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

			title_bar = new Widgets.TitleBar (this);

			this.set_titlebar (title_bar);

			stack = new Gtk.Stack ();

			events_view = new Widgets.EventsView ();

			stack.add_titled (events_view, "events", _("Events"));

			box.pack_start (stack, true, true);

			this.add (box);

		}

		private void on_drag_data_received (Gdk.DragContext drag_context, int x, int y, Gtk.SelectionData data, uint info, uint time) 
		{
			//loop through list of URIs
			foreach(string uri in data.get_uris ()){
				string fileName = uri.replace("file://","").replace("file:/","");
				fileName = Uri.unescape_string (fileName);

				mountie.Backend.FileHandler.start(File.new_for_path (fileName));
			}

			Gtk.drag_finish (drag_context, true, false, time);
		}

		public static void addMount (GenericAdapter mount){
			//events_view.key_list.add_item (mount, true, false, true);
		}
	}
}

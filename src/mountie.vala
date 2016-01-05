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

namespace mountie {
	public class mountieApp : Granite.Application {
		public MainWindow window;

		construct {
			// App-Properties
			program_name = "Mountie";
			exec_name = "mountie";

			build_data_dir = Constants.DATADIR;
			build_pkg_data_dir = Constants.PKGDATADIR;
			build_release_name = Constants.RELEASE_NAME;
			build_version = Constants.VERSION;
			build_version_info = Constants.VERSION_INFO;

			app_years = "2015";
			app_icon = "ubiquity";
			app_launcher = "mountie.desktop";
			application_id = "net.launchpad.mountie";
			main_url = "https://github.com/marciodsousa/mountie";
			bug_url = "https://github.com/marciodsousa/mountie/issues";
			help_url = "https://github.com/marciodsousa/mountie";
			translate_url = "https://github.com/marciodsousa/mountie";
			about_authors = {"Márcio de Sousa <marciodesousa16@gmail.com>"};
			about_documenters = {"Márcio de Sousa <marciodesousa16@gmail.com>"};
			about_artists = {"Vera Sans <veraifos@gmail.com>"};
			about_comments = _("A tool to mount your drive images easily.");
			about_translators = "Launchpad Translators";
		}

		public mountieApp () {
			// Translations
			Intl.setlocale (LocaleCategory.ALL, "");
			string langpack_dir = Path.build_filename (Constants.INSTALL_PREFIX, "share", "locale");
			Intl.bindtextdomain (Constants.GETTEXT_PACKAGE, langpack_dir);
			Intl.bind_textdomain_codeset (Constants.GETTEXT_PACKAGE, "UTF-8");
			Intl.textdomain (Constants.GETTEXT_PACKAGE);

			// Debug service
			Granite.Services.Logger.initialize ("mountie");
			Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.DEBUG;
		}

		public override void activate () {
			if (get_windows () == null) {
				window = new MainWindow (this);
				window.show_all ();
			} else {
				window.present ();
			}
		}

		public override void open (File[] files, string hint) {
			// Do nothing
		}

		public static void main (string[] args) {
			Gtk.init (ref args);

			var app = new mountie.mountieApp ();
			app.run (args);
		}
	}
}
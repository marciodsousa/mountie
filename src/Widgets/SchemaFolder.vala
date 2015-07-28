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
	public class SchemaFolder : Granite.Widgets.SourceList.ExpandableItem {
		private Settings settings;

		public SchemaFolder (string schema, string name) {
			this.settings = new Settings (schema);
			this.name = name;

			//settings.changed.connect ((key) => Services.EventManager.get_default ().key_changed (settings, key));
		}

		public Settings get_schema () {
			return settings;
		}
	}
}

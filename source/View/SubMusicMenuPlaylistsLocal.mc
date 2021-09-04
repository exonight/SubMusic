using Toybox.WatchUi;
using Toybox.Application;

module SubMusic {
    module Menu {

        class PlaylistsLocal extends MenuBase {

            // menu items will be loaded in here 
            hidden var d_items = [];

            function initialize(title) {
                // initialize base as loaded
                MenuBase.initialize(title, true);

                // load the items
                load();
            }

            // reload the ids on request
			function load() {
                var playlists = [];
                var ids = PlaylistStore.getIds();

                // remove the non local playlist ids
                var todelete = [];
                for (var idx = 0; idx != ids.size(); ++idx) {
                    var id = ids[idx];
                    var iplaylist = new IPlaylist(id);
                    if (iplaylist.local()) {
                        playlists.add(iplaylist);
                    }
                }

                // create the menu items
                for (var idx = 0; idx != playlists.size(); ++idx) {
                    d_items.add(new Menu.PlaylistSettings(playlists[idx]));
                }
			}
        }
    }
}
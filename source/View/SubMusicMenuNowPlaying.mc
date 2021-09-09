using Toybox.WatchUi;
using SubMusic.Menu;
using SubMusic;

module SubMusic {
	module Menu {
		class NowPlaying extends AudiosLocal {

			function initialize() {
				var iplayable = new SubMusic.IPlayable();
				AudiosLocal.initialize(
					WatchUi.loadResource(Rez.Strings.confPlayback_NowPlaying_title), 
					iplayable.audios(),
					method(:onAudioSelect)
				);
			}

			function onAudioSelect(audio) {
				// start playback with new songid
				var iplayable = new SubMusic.IPlayable();
				iplayable.setAudio(audio);
				Media.startPlayback(null);
			}

			// function delegate() {
			// 	return new NowPlayingDelegate();
			// }
		}

		// class NowPlayingView extends MenuView {
		// 	function initialize() {
		// 		MenuView.initialize(new NowPlaying());
		// 	}
		// }

        // class NowPlayingDelegate extends SongsLocalDelegate {
		// 	function initialize() {
		// 		SongsLocalDelegate.initialize();
		// 	}

		// 	// @Override
		// 	function onSongSelect(item) {
		// 		var songid = item.getId();

		// 		// start playback with new songid
		// 		var iplayable = new SubMusic.IPlayable();
		// 		iplayable.setSongId(songid);
		// 		Media.startPlayback(null);
		// 	}
		// }
	}
}
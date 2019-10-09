
// NACH 4 SEKUNDEN MIT LOAD_ANIMATION AUFHÖREN
  setTimeout(function() {

                $('body').addClass('loaded');

            }, 4000);

// VIMEO EMBEDDING + VIDEO STARTEn + AM ANFRANG AUF MUTE STELLEN

var iframe = document.querySelector('iframe');
var player = new Vimeo.Player(iframe);

player.setVolume(0);

player.on('play', function () {
    console.log('played the video!');
});

player.play().then(function () {
    // the video was played
}).catch(function (error) {
    switch (error.name) {
        case 'PasswordError':
            // the video is password-protected and the viewer needs to enter the
            // password first
            break;

        case 'PrivacyError':
            // the video is private
            break;

        default:
            // some other error occurred
            break;
    }
});

// AM ANFANG ANIMATION "SOUND-AUS" ABSPIELEN
$(".bar").addClass("bar-animation2");



// WENN AUF SOUNDBALKEN GEKLICKT WURDE, WIRD SOUND EIN/AUS_GESCHALTET UND ANIMATION ÄNDERT SICH


function soundCommand() {

    player.getVolume().then(function (volume) {
        var vol = volume;

        if (vol === 0) {

            player.setVolume(0.5).then(function (volume) {
                // volume was set
            }).catch(function (error) {
                switch (error.name) {
                    case 'RangeError':
                        // the volume was less than 0 or greater than 1
                        break;

                    default:
                        // some other error occurred
                        break;
                }
            });

            //Animation
            $(".bar").removeClass("bar-animation2").addClass("bar-animation");
            document.getElementById("soundOnOff").innerHTML = "";
        } else {

            $(".bar").removeClass("bar-animation").addClass("bar-animation2");
            document.getElementById("soundOnOff").innerHTML = "";
            player.setVolume(0.0).then(function (volume) {
                // volume was set
            }).catch(function (error) {
                switch (error.name) {
                    case 'RangeError':
                        // the volume was less than 0 or greater than 1
                        break;

                    default:
                        // some other error occurred
                        break;
                }
            });
        }
        // volume = the volume level of the player
    }).catch(function (error) {
        // an error occurred
    });

}

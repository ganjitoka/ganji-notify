const { ref } = Vue;
const app = Vue.createApp({
  setup() {
    const maxWidth = ref(null);

    function applyMaxWidthStyle() {
      if (maxWidth.value) {
        let styleTag = document.getElementById("notification-max-width");
        if (!styleTag) {
          styleTag = document.createElement("style");
          styleTag.id = "notification-max-width";
          document.head.appendChild(styleTag);
        }
        styleTag.innerHTML = `.q-notification { max-width: ${maxWidth.value} !important; }`;
      }
    }

    function notify(
      text,
      icon,
      image,
      spinner,
      caption,
      color,
      textColor,
      timeout,
      position
    ) {
      let notifyParams = {
        message: text,
        color: color,
      };

      if (icon) {
        notifyParams.icon = icon;
      } else if (image) {
        notifyParams.avatar = image;
      } else if (spinner) {
        console.log("spinner", spinner)
        switch (spinner) {
          case "QSpinnerAudio":
            notifyParams.spinner = Quasar.QSpinnerAudio;
            break;
          case "QSpinnerBall":
            notifyParams.spinner = Quasar.QSpinnerBall;
            break;
          case "QSpinnerBars": 
            notifyParams.spinner = Quasar.QSpinnerBars;
            break;
          case "QSpinnerBox":
            notifyParams.spinner = Quasar.QSpinnerBox;
            break;
          case "QSpinnerClock":
            notifyParams.spinner = Quasar.QSpinnerClock;
            break;
          case "QSpinnerComment":
            notifyParams.spinner = Quasar.QSpinnerComment;
            break;
          case "QSpinnerCube":
            notifyParams.spinner = Quasar.QSpinnerCube;
            break;
          case "QSpinnerDots":
            notifyParams.spinner = Quasar.QSpinnerDots;
            break;
          case "QSpinnerFacebook":
            notifyParams.spinner = Quasar.QSpinnerFacebook;
            break;
          case "QSpinnerGears":
            notifyParams.spinner = Quasar.QSpinnerGears;
            break;
          case "QSpinnerGrid":
            notifyParams.spinner = Quasar.QSpinnerGrid;
            break;
          case "QSpinnerHearts":
            notifyParams.spinner = Quasar.QSpinnerHearts;
            break;          
          case "QSpinnerHourglass":
            notifyParams.spinner = Quasar.QSpinnerHourglass;
            break;
          case "QSpinnerInfinity":
            notifyParams.spinner = Quasar.QSpinnerInfinity;
            break;
          case "QSpinnerIos":
            notifyParams.spinner = Quasar.QSpinnerIos;
            break;
          case "QSpinnerOrbit":
            notifyParams.spinner = Quasar.QSpinnerOrbit;
            break;
          case "QSpinnerOval":
            notifyParams.spinner = Quasar.QSpinnerOval;
            break;
          case "QSpinnerPie":
            notifyParams.spinner = Quasar.QSpinnerPie;
            break;
          case "QSpinnerPuff":
            notifyParams.spinner = Quasar.QSpinnerPuff;
            break;
          case "QSpinnerRadio":
            notifyParams.spinner = Quasar.QSpinnerRadio;
            break;
          case "QSpinnerRings":
            notifyParams.spinner = Quasar.QSpinnerRings;
            break;
        }
      }

      if (caption) {
        notifyParams.caption = caption;
      }

      if (timeout) {
        notifyParams.timeout = timeout;
      }

      if (position) {
        notifyParams.position = position;
      }

      if (textColor) {
        notifyParams.textColor = textColor;
      }
      console.log("notifyParams.spinner", notifyParams.spinner)
      Quasar.Notify.create(notifyParams);
    }
    return {
      notify,
      maxWidth,
      applyMaxWidthStyle,
    };
  },

  mounted() {
    const url = `https://${GetParentResourceName()}/nuiready`;
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
    }).catch((error) => {
      console.error("Error sending message:", error);
    });
  },
});

app.use(Quasar, {
  config: {
    notify: {},
  },
});

const vm = app.mount("#q-app");

window.addEventListener("message", (event) => {
  if (event.data.action === "init") {
    vm.maxWidth = event.data.maxWidth;
    vm.applyMaxWidthStyle();
    Quasar.Notify.setDefaults({
      progress: true,
      multiLine: true,
      html: true,
      group: false,
      position: event.data.position,
      timeout: event.data.timeout,
      textColor: "white",
    });
  } else if (event.data.action === "notification") {
    const sound = event.data.sound || null;

    if (sound !== null) {
      const soundfile = new Audio("sounds/" + sound + ".mp3");
      if (soundfile) {
        soundfile.play();
      }
    }

    vm.notify(
      event.data.text,
      event.data.icon,
      event.data.image,
      event.data.spinner,
      event.data.caption,
      event.data.color,
      event.data.textColor,
      event.data.timeout,
      event.data.position
    );
  }
});

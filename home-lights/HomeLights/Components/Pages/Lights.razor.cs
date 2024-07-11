using HueApi;
using HueApi.Models;

namespace HomeLights.Components.Pages {
    public partial class Lights {
        public const string URL = "./Lights";

        private LocalHueApi bridge;

        private List<Light> roomLights = new List<Light>();

        private Light debugLight = new Light();
        private Room debugRoom = new Room();

        protected override void OnInitialized()
        {

            XyPosition colorXy = new XyPosition();
            colorXy.X = 0.0;
            colorXy.Y = 0.0;

            Gamut gamut = new Gamut();
            gamut.Blue = colorXy;
            gamut.Green = colorXy;
            gamut.Red = colorXy;

            Color col = new Color();
            col.Gamut = gamut;
            col.GamutType = "C";
            col.Xy = colorXy;

            On on = new On();
            on.IsOn = false;

            Dimming lightDim = new Dimming();
            lightDim.Brightness = 100;
            lightDim.MinDimLevel = 10;

            this.debugLight.Color = col;
            this.debugLight.On = on;
            this.debugLight.Dimming = lightDim;

            this.roomLights.Add(this.debugLight);

            this.debugRoom.Id = Guid.NewGuid();
            

            ResourceIdentifier lightId = new ResourceIdentifier();
            lightId.Rid = this.debugLight.Id;
            lightId.Rtype = this.debugLight.Type;

            this.debugRoom.Children.Add(lightId);
        }



        // DRAW ENV VARIABLES FROM CONFIG OR SOMETHING TO INJECT INTO API
        // API CALL TO GET ROOMS
        // API CALL WHEN ROOM SELECTED TO PULL LIGHT RESOURCES FROM ROOM
        // API CALL TO POPULATE LIGHTS AND CURRENT SETTINGS


    }
}
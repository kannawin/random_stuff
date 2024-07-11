

using HueApi.Models;
using Microsoft.AspNetCore.Components;

namespace HomeLights.Components.Items
{
    public partial class LightSettings
    {
        [Parameter]
        public bool Visible {get; set;} = false;

        [Parameter]
        public Light SelectedLight {get; set;} = new Light();

        private double DimDummy = 25;
        private double RgbDummy = 75;

        protected override void OnAfterRender(bool firstRender)
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

            if (this.SelectedLight.Color == null) this.SelectedLight.Color = col;
            if (this.SelectedLight.On == null) this.SelectedLight.On = on;
            if (this.SelectedLight.Dimming == null) this.SelectedLight.Dimming = lightDim;

            base.OnAfterRender(firstRender);
        }

        private void OnDimChange(double args) {
            this.DimDummy = args;
        }

        private void OnRgbChange(double args) {
            this.RgbDummy = args;
        }

    }
}
<script>
export default {
  name: "PreloaderProgress",
  computed: {
    ratio() {
      const { preloadProgress, preloadMax } = this.$store.state;
      return preloadProgress / preloadMax;
    },
    stylesRightRect() {
      return {
        opacity: this.ratio >= 0.5 ? 1 : 0,
      };
    },
    stylesLeftRect() {
      return {
        opacity: this.ratio >= 0.5 ? 0 : 1,
      };
    },
    stylesRotateRect() {
      return {
        transform: `rotate(${this.ratio * 354}deg)`,
      };
    },
  },
};
</script>

<template lang="pug">
  .preloader-progress
    .preloader-progress__inner.
    <svg xmlns="http://www.w3.org/2000/svg" width="252" height="252" viewBox="0 0 252 252">
      <g mask="url(#mask-text)">
          <mask id="mask-rotate">
            <g class="mask-rotate-group">
              <path class="mask-rotate-rect" :style="stylesRotateRect" fill="#ffffff" d="M0 0h126v252H0z"/>
              <path :style="stylesLeftRect" d="M0 0h126v252H0z"/>
              <path :style="stylesRightRect" fill="#ffffff" d="M126 0h126v252H126z"/>
            </g>
          </mask>
          <path fill="#564e45" d="M0 0h252v252H0z"/>
          <path fill="#dcc5a2" mask="url(#mask-rotate)" d="M0 0h252v252H0z"/>
      </g>
        <mask id="mask-text">
          <g d="M0 0h252v252H0z">
            <text transform="rotate(-36.4434 64.8576 56.582)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_1" y="66.19391" x="56.31367" stroke-width="0" stroke="#000" fill="#dcc5a2">A</text>
            <text transform="rotate(-29.1967 93.3053 38.9602)" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_2" y="48.57209" x="83.5474" stroke-width="0" fill="#dcc5a2">N</text>
            <text transform="rotate(-56.598 42.7642 90.2166) matrix(1.05788 0 0 1.05041 -2.42505 -3.98348)" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_3" y="99.30368" x="35.83849" stroke-width="0" fill="#dcc5a2">T</text>
            <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_4" y="42.16415" x="119.59204" stroke-width="0" stroke="#000" fill="#dcc5a2">G</text>
            <text transform="rotate(50.734 46.2262 174.328)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_7" y="183.93973" x="42.6968" stroke-width="0" stroke="#000" fill="#dcc5a2">I</text>
            <text transform="matrix(4.04981 0 0 3.99092 -418.476 -682.362)" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_8" y="225.32373" x="139.19172" stroke-width="0" fill="#dcc5a2">.</text>
            <text transform="rotate(133.117 183.404 191.95)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_9" y="201.56156" x="176.46247" stroke-width="0" stroke="#000" fill="#dcc5a2">T</text>
            <text transform="rotate(107.613 213.02 157.507)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_10" y="167.11891" x="201.29323" stroke-width="0" stroke="#000" fill="#dcc5a2">M</text>
            <text transform="rotate(70.5646 214.643 114.253)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_11" y="123.86534" x="206.09917" stroke-width="0" stroke="#000" fill="#dcc5a2">A</text>
            <text transform="rotate(40.1732 201.31 73.4028)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_12" y="83.01474" x="193.2833" stroke-width="0" stroke="#000" fill="#dcc5a2">C</text>
            <text transform="rotate(-156.695 110.247 219.183)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_16" y="228.79529" x="97.96526" stroke-width="0" stroke="#000" fill="#dcc5a2">W</text>
            <text transform="rotate(-140.274 71.7244 202.363)" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_17" y="211.97445" x="65.12459" stroke-width="0" stroke="#000" fill="#dcc5a2">E</text>
            <text transform="matrix(4.04981 0 0 3.99092 -418.476 -682.362)" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_18" y="183.77809" x="141.96071" stroke-width="0" fill="#dcc5a2">.</text>
            <text transform="matrix(4.04981 0 0 3.99092 -418.476 -682.362)" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Noto Sans JP" font-size="24" id="svg_19" y="206.6583" x="109.12838" stroke-width="0" fill="#dcc5a2">.</text>
          </g>
        </mask>
    </svg>
</template>

<style lang="scss">
.preloader-progress {
  position: absolute;
  animation-name: rotate;
  animation-duration: 20s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  @include l-more-than-mobile {
    width: 252px;
    height: 252px;
    top: calc(50% - 126px);
    left: calc(50% - 126px);
  }
  @include l-mobile {
    width: 150px;
    height: 150px;
    top: calc(50% - 75px);
    left: calc(50% - 75px);
  }
  &__inner {
    //
    // transition
    // ==========
    .preloader-enter & {
      opacity: 0;
      transform: scale(0.6);
    }
    .preloader-enter-to & {
      transform: scale(1);
      transition-duration: 1.4s;
      transition-timing-function: $easeOutCirc;
      transition-property: opacity, transform;
    }
    .preloader-leave-to & {
      opacity: 0;
      transform: scale(1.8);
      transition-duration: 1.4s;
      transition-delay: 0.8s;
      transition-timing-function: $easeInExpo;
      transition-property: opacity, transform;
    }
  }
  svg {
    display: block;
    backface-visibility: hidden;
    transform: translate3d(0, 0, 0);

    @include l-more-than-mobile {
      width: 252px;
      height: 252px;
    }
    @include l-mobile {
      width: 150px;
      height: 150px;
    }
  }
  .mask-rotate-group {
    transform: rotate(40deg);
    transform-origin: center center;
  }
  .mask-rotate-rect {
    transform-origin: center center;
  }
}
</style>

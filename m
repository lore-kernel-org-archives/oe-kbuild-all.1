Content-Type: multipart/mixed; boundary="===============8973648391469294149=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:xlnx_rebase_v5.4 242/1296] drivers/gpu/drm/xlnx/xlnx_mixer.c:2100:6: warning: Variable 'ret' is reassigned a value before the old one has been used. [redundantAssignment]
Date: Fri, 08 May 2020 17:56:02 +0800
Message-ID: <202005081737.A14krgz5%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8973648391469294149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   0b197959bbbdb68e1da974bd013339f08704b178
commit: 4507a574f06a834a997d961988aad9481e446f93 [242/1296] drm: xlnx: mixe=
r: Initial video mixer driver

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/xlnx/xlnx_mixer.c:2100:6: warning: Variable 'ret' is rea=
ssigned a value before the old one has been used. [redundantAssignment]
    ret =3D of_property_read_u32(node, "xlnx,ppc", &mixer_hw->ppc);
        ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:2087:6: note: ret is assigned
    ret =3D xlnx_mix_init_plane(&mixer->planes[XVMIX_MASTER_LAYER_IDX], 1,
        ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:2100:6: note: ret is overwritten
    ret =3D of_property_read_u32(node, "xlnx,ppc", &mixer_hw->ppc);
        ^
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:2228:30: warning: Variable 'mixer->pix=
el_clock_enabled' is reassigned a value before the old one has been used. [=
redundantAssignment]
     mixer->pixel_clock_enabled =3D true;
                                ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:2225:32: note: mixer->pixel_clock_enab=
led is assigned
       mixer->pixel_clock_enabled =3D false;
                                  ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:2228:30: note: mixer->pixel_clock_enab=
led is overwritten
     mixer->pixel_clock_enabled =3D true;
                                ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:1938:2: warning: Consecutive return, b=
reak, continue, goto or throw statements are unnecessary. [duplicateBreak]
    return 0;
    ^
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:1067:41: warning: Checking if unsigned=
 expression 'val' is less than zero. [unsignedLessThanZero]
    if (val > XVMIX_SCALE_FACTOR_4X || val < XVMIX_SCALE_FACTOR_1X) {
                                           ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:1143:35: warning: Checking if unsigned=
 expression 'val' is less than zero. [unsignedLessThanZero]
    if (val > XVMIX_ALPHA_MAX || val < XVMIX_ALPHA_MIN) {
                                     ^

vim +/ret +2100 drivers/gpu/drm/xlnx/xlnx_mixer.c

  2041	=

  2042	static int xlnx_mix_plane_create(struct device *dev, struct xlnx_mix=
 *mixer)
  2043	{
  2044		struct xlnx_mix_hw		*mixer_hw;
  2045		struct device_node		*node, *layer_node;
  2046		char				name[20];
  2047		struct xlnx_mix_layer_data	*layer_data;
  2048		int				ret, i;
  2049		int				layer_idx;
  2050	=

  2051		node =3D dev->of_node;
  2052		mixer_hw =3D &mixer->mixer_hw;
  2053		xlnx_mix_create_plane_properties(mixer);
  2054	=

  2055		mixer->planes[XVMIX_MASTER_LAYER_IDX].mixer_layer =3D
  2056					&mixer_hw->layer_data[XVMIX_MASTER_LAYER_IDX];
  2057		mixer->planes[XVMIX_MASTER_LAYER_IDX].id =3D XVMIX_MASTER_LAYER_IDX;
  2058		mixer->hw_master_layer =3D &mixer->planes[XVMIX_MASTER_LAYER_IDX];
  2059	=

  2060		if (mixer_hw->logo_layer_en) {
  2061			mixer->planes[XVMIX_LOGO_LAYER_IDX].mixer_layer =3D
  2062					&mixer_hw->layer_data[XVMIX_LOGO_LAYER_IDX];
  2063			mixer->planes[XVMIX_LOGO_LAYER_IDX].id =3D XVMIX_LOGO_LAYER_IDX;
  2064			mixer->hw_logo_layer =3D &mixer->planes[XVMIX_LOGO_LAYER_IDX];
  2065			layer_node =3D of_get_child_by_name(node, "logo");
  2066			ret =3D xlnx_mix_init_plane(&mixer->planes[XVMIX_LOGO_LAYER_IDX],
  2067						  1, layer_node);
  2068			if (ret)
  2069				return ret;
  2070		}
  2071		layer_idx =3D mixer_hw->logo_layer_en ? 2 : 1;
  2072		for (i =3D 1; i < mixer_hw->max_layers; i++, layer_idx++) {
  2073			snprintf(name, sizeof(name), "layer_%d", i);
  2074			ret =3D xlnx_mix_of_init_layer(dev, node, name,
  2075						     &mixer_hw->layer_data[layer_idx],
  2076						     mixer_hw->max_layer_width,
  2077						     mixer, layer_idx);
  2078			if (ret)
  2079				return ret;
  2080		}
  2081		/* If none of the overlay layers were designated as the drm
  2082		 * primary layer, default to the mixer's video0 layer as drm primary
  2083		 */
  2084		if (!mixer->drm_primary_layer)
  2085			mixer->drm_primary_layer =3D mixer->hw_master_layer;
  2086		layer_node =3D of_get_child_by_name(node, "layer_0");
  2087		ret =3D xlnx_mix_init_plane(&mixer->planes[XVMIX_MASTER_LAYER_IDX],=
 1,
  2088					  layer_node);
  2089		/* request irq and obtain pixels-per-clock (ppc) property */
  2090		mixer_hw->irq =3D irq_of_parse_and_map(node, 0);
  2091		if (mixer_hw->irq > 0) {
  2092			ret =3D devm_request_irq(dev, mixer_hw->irq,
  2093					       xlnx_mix_intr_handler,
  2094					       IRQF_SHARED, "xlnx-mixer", mixer_hw);
  2095			if (ret) {
  2096				dev_err(dev, "Failed to request irq\n");
  2097				return ret;
  2098			}
  2099		}
> 2100		ret =3D of_property_read_u32(node, "xlnx,ppc", &mixer_hw->ppc);
  2101		if (ret) {
  2102			dev_err(dev, "No xlnx,ppc property for mixer dts\n");
  2103			return ret;
  2104		}
  2105	=

  2106		/* Init all layers to inactive state in software. An update_plane()
  2107		 * call to our drm driver will change this to 'active' and permit t=
he
  2108		 * layer to be enabled in hardware
  2109		 */
  2110		for (i =3D 0; i < mixer_hw->layer_cnt; i++)
  2111			layer_data =3D &mixer_hw->layer_data[i];
  2112	=

  2113		mixer->max_width =3D XVMIX_DISP_MAX_WIDTH;
  2114		mixer->max_height =3D XVMIX_DISP_MAX_HEIGHT;
  2115		if (mixer->hw_logo_layer) {
  2116			mixer->max_cursor_width =3D
  2117				mixer->hw_logo_layer->mixer_layer->layer_regs.width;
  2118			mixer->max_cursor_height =3D
  2119				mixer->hw_logo_layer->mixer_layer->layer_regs.height;
  2120		}
  2121		return 0;
  2122	}
  2123	=

  2124	/**
  2125	 * xlnx_mix_plane_restore - Restore the plane states
  2126	 * @mixer: mixer device core structure
  2127	 *
  2128	 * Restore the plane states to the default ones. Any state that need=
s to be
  2129	 * restored should be here. This improves consistency as application=
s see
  2130	 * the same default values, and removes mismatch between software an=
d hardware
  2131	 * values as software values are updated as hardware values are rese=
t.
  2132	 */
  2133	static void xlnx_mix_plane_restore(struct xlnx_mix *mixer)
  2134	{
  2135		struct xlnx_mix_plane *plane;
  2136		unsigned int i;
  2137	=

  2138		if (!mixer)
  2139			return;
  2140		/*
  2141		 * Reinitialize property default values as they get reset by DPMS O=
FF
  2142		 * operation. User will read the correct default values later, and
  2143		 * planes will be initialized with default values.
  2144		 */
  2145		for (i =3D 0; i < mixer->num_planes; i++) {
  2146			plane =3D &mixer->planes[i];
  2147			if (!plane)
  2148				continue;
  2149			xlnx_mix_hw_plane_dpms(plane, DRM_MODE_DPMS_OFF);
  2150		}
  2151	}
  2152	=

  2153	/**
  2154	 * xlnx_mix_set_bkg_col - Set background color
  2155	 * @mixer: Mixer instance to program with new background color
  2156	 * @rgb_value: RGB encoded as 32-bit integer in little-endian format
  2157	 *
  2158	 * Set the color to be output as background color when background st=
ream layer
  2159	 */
  2160	static void xlnx_mix_set_bkg_col(struct xlnx_mix_hw *mixer, u64 rgb_=
value)
  2161	{
  2162		u32 bg_bpc =3D mixer->bg_layer_bpc;
  2163		u32 bpc_mask_shift =3D XVMIX_MAX_BPC - bg_bpc;
  2164		u32 val_mask =3D (GENMASK(15, 0) >> bpc_mask_shift);
  2165		u16 b_val =3D (rgb_value >> (bg_bpc * 2)) & val_mask;
  2166		u16 g_val =3D (rgb_value >> bg_bpc) & val_mask;
  2167		u16 r_val =3D (rgb_value >> 0) &  val_mask;
  2168	=

  2169		/* Set Background Color */
  2170		reg_writel(mixer->base, XVMIX_BACKGROUND_Y_R_DATA, r_val);
  2171		reg_writel(mixer->base, XVMIX_BACKGROUND_U_G_DATA, g_val);
  2172		reg_writel(mixer->base, XVMIX_BACKGROUND_V_B_DATA, b_val);
  2173		mixer->bg_color =3D rgb_value;
  2174	}
  2175	=

  2176	/**
  2177	 * xlnx_mix_reset - Reset the mixer core video generator
  2178	 * @mixer: Mixer core instance for which to start video output
  2179	 *
  2180	 * Toggle the reset gpio and restores the bg color, plane and interr=
upt mask.
  2181	 */
  2182	static void xlnx_mix_reset(struct xlnx_mix *mixer)
  2183	{
  2184		struct xlnx_mix_hw *mixer_hw =3D &mixer->mixer_hw;
  2185	=

  2186		gpiod_set_raw_value(mixer_hw->reset_gpio, 0);
  2187		gpiod_set_raw_value(mixer_hw->reset_gpio, 1);
  2188		/* restore layer properties and bg color after reset */
  2189		xlnx_mix_set_bkg_col(mixer_hw, mixer_hw->bg_color);
  2190		xlnx_mix_plane_restore(mixer);
  2191		xlnx_mix_intrpt_enable_done(&mixer->mixer_hw);
  2192	}
  2193	=

  2194	static void xlnx_mix_dpms(struct xlnx_mix *mixer, int dpms)
  2195	{
  2196		switch (dpms) {
  2197		case DRM_MODE_DPMS_ON:
  2198			xlnx_mix_start(&mixer->mixer_hw);
  2199			break;
  2200		default:
  2201			xlnx_mix_stop(&mixer->mixer_hw);
  2202			mdelay(50); /* let IP shut down */
  2203			xlnx_mix_reset(mixer);
  2204		}
  2205	}
  2206	=

  2207	/* set crtc dpms */
  2208	static void xlnx_mix_crtc_dpms(struct drm_crtc *base_crtc, int dpms)
  2209	{
  2210		struct xlnx_crtc *crtc =3D to_xlnx_crtc(base_crtc);
  2211		struct xlnx_mix *mixer =3D to_xlnx_mixer(crtc);
  2212		int ret;
  2213	=

  2214		DRM_DEBUG_KMS("dpms: %d\n", dpms);
  2215		if (mixer->dpms =3D=3D dpms)
  2216			return;
  2217		mixer->dpms =3D dpms;
  2218	=

  2219		switch (dpms) {
  2220		case DRM_MODE_DPMS_ON:
  2221			if (!mixer->pixel_clock_enabled) {
  2222				ret =3D clk_prepare_enable(mixer->pixel_clock);
  2223				if (ret) {
  2224					DRM_ERROR("failed to enable a pixel clock\n");
  2225					mixer->pixel_clock_enabled =3D false;
  2226				}
  2227			}
> 2228			mixer->pixel_clock_enabled =3D true;
  2229	=

  2230			xlnx_mix_dpms(mixer, dpms);
  2231			xlnx_mix_plane_dpms(base_crtc->primary, dpms);
  2232			break;
  2233		default:
  2234			xlnx_mix_plane_dpms(base_crtc->primary, dpms);
  2235			xlnx_mix_dpms(mixer, dpms);
  2236			if (mixer->pixel_clock_enabled) {
  2237				clk_disable_unprepare(mixer->pixel_clock);
  2238				mixer->pixel_clock_enabled =3D false;
  2239			}
  2240			break;
  2241		}
  2242	}
  2243	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8973648391469294149==--


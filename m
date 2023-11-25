Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03C27705
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 22:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkMuLdDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700953072; x=1732489072;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HWAC9fcyLlNjBGW1Y10Vyz1+IE7qRqmvmykBPssgU3A=;
  b=TkMuLdDQ98W648toIq9GcsXYDvO6alsGTH8wXcDNXCMIuVo6z517emjC
   bY0S9vPm+mMVhil//ZmhbhB3gcTEkATVbqP+SVK8S4Bk9B7PRLE12kuBp
   +z0WxH/Z1/c6gC/ut2QDOn05HVwM8Mi9P0VnvbMnybAlZSsXFOoNaec9g
   6TVF2hHLEWVeruqK9VLo8BhlzcMuMwFP5Cbav1Lrz+HJrIWZjj+x92LPv
   vEo3jZs+zokNfXDwN/2Vm8cWbBdnBKmzQ7XFMVrqJq3AxReFi33VI0s28
   u3jt7vth8geu3i388lKhgDiMOXAjymRGjl7GvZfgrXwaful0k30E17Kej
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="372694539"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="372694539"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 14:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="885595285"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="885595285"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2023 14:57:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r71at-0004UU-2s;
	Sat, 25 Nov 2023 22:57:47 +0000
Date: Sun, 26 Nov 2023 06:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 2303/2351] htmldocs:
 ./include/drm/drm_plane.h:280: warning: Function parameter or member
 'gamma_lut' not described in 'drm_plane_state'
Message-ID: <202311260616.ET3OPP0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   b375c3f82247ffd48e5c37e98dafa086bc0eb81b
commit: f88adb4c1023a7a7f03da0f1407e9433b6bf185a [2303/2351] drm: Add Plane Gamma Lut property
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260616.ET3OPP0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260616.ET3OPP0z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_plane.h:280: warning: Function parameter or member 'gamma_lut' not described in 'drm_plane_state'

vim +280 ./include/drm/drm_plane.h

5c759eda9b04cd Pankaj Bharadiya  2020-10-20   42  
43968d7b806d7a Daniel Vetter     2016-09-21   43  /**
43968d7b806d7a Daniel Vetter     2016-09-21   44   * struct drm_plane_state - mutable plane state
2e784a91424892 Daniel Vetter     2018-07-09   45   *
4087d2fb286c85 Alyssa Rosenzweig 2021-08-29   46   * Please note that the destination coordinates @crtc_x, @crtc_y, @crtc_h and
2e784a91424892 Daniel Vetter     2018-07-09   47   * @crtc_w and the source coordinates @src_x, @src_y, @src_h and @src_w are the
2e784a91424892 Daniel Vetter     2018-07-09   48   * raw coordinates provided by userspace. Drivers should use
2e784a91424892 Daniel Vetter     2018-07-09   49   * drm_atomic_helper_check_plane_state() and only use the derived rectangles in
2e784a91424892 Daniel Vetter     2018-07-09   50   * @src and @dst to program the hardware.
43968d7b806d7a Daniel Vetter     2016-09-21   51   */
43968d7b806d7a Daniel Vetter     2016-09-21   52  struct drm_plane_state {
2e784a91424892 Daniel Vetter     2018-07-09   53  	/** @plane: backpointer to the plane */
43968d7b806d7a Daniel Vetter     2016-09-21   54  	struct drm_plane *plane;
43968d7b806d7a Daniel Vetter     2016-09-21   55  
3835b46e5535d9 Gustavo Padovan   2016-11-07   56  	/**
3835b46e5535d9 Gustavo Padovan   2016-11-07   57  	 * @crtc:
3835b46e5535d9 Gustavo Padovan   2016-11-07   58  	 *
3835b46e5535d9 Gustavo Padovan   2016-11-07   59  	 * Currently bound CRTC, NULL if disabled. Do not this write directly,
3835b46e5535d9 Gustavo Padovan   2016-11-07   60  	 * use drm_atomic_set_crtc_for_plane()
3835b46e5535d9 Gustavo Padovan   2016-11-07   61  	 */
3835b46e5535d9 Gustavo Padovan   2016-11-07   62  	struct drm_crtc *crtc;
3835b46e5535d9 Gustavo Padovan   2016-11-07   63  
3835b46e5535d9 Gustavo Padovan   2016-11-07   64  	/**
3835b46e5535d9 Gustavo Padovan   2016-11-07   65  	 * @fb:
3835b46e5535d9 Gustavo Padovan   2016-11-07   66  	 *
3835b46e5535d9 Gustavo Padovan   2016-11-07   67  	 * Currently bound framebuffer. Do not write this directly, use
3835b46e5535d9 Gustavo Padovan   2016-11-07   68  	 * drm_atomic_set_fb_for_plane()
3835b46e5535d9 Gustavo Padovan   2016-11-07   69  	 */
3835b46e5535d9 Gustavo Padovan   2016-11-07   70  	struct drm_framebuffer *fb;
3835b46e5535d9 Gustavo Padovan   2016-11-07   71  
3835b46e5535d9 Gustavo Padovan   2016-11-07   72  	/**
3835b46e5535d9 Gustavo Padovan   2016-11-07   73  	 * @fence:
3835b46e5535d9 Gustavo Padovan   2016-11-07   74  	 *
30d23f220c75cf Daniel Vetter     2018-04-05   75  	 * Optional fence to wait for before scanning out @fb. The core atomic
30d23f220c75cf Daniel Vetter     2018-04-05   76  	 * code will set this when userspace is using explicit fencing. Do not
1ea28bc5542d60 Christian König   2022-04-21   77  	 * write this field directly for a driver's implicit fence.
30d23f220c75cf Daniel Vetter     2018-04-05   78  	 *
30d23f220c75cf Daniel Vetter     2018-04-05   79  	 * Drivers should store any implicit fence in this from their
25d60a648bfa64 Thomas Zimmermann 2022-12-02   80  	 * &drm_plane_helper_funcs.prepare_fb callback. See
25d60a648bfa64 Thomas Zimmermann 2022-12-02   81  	 * drm_gem_plane_helper_prepare_fb() for a suitable helper.
3835b46e5535d9 Gustavo Padovan   2016-11-07   82  	 */
f54d1867005c33 Chris Wilson      2016-10-25   83  	struct dma_fence *fence;
43968d7b806d7a Daniel Vetter     2016-09-21   84  
3835b46e5535d9 Gustavo Padovan   2016-11-07   85  	/**
3835b46e5535d9 Gustavo Padovan   2016-11-07   86  	 * @crtc_x:
3835b46e5535d9 Gustavo Padovan   2016-11-07   87  	 *
3835b46e5535d9 Gustavo Padovan   2016-11-07   88  	 * Left position of visible portion of plane on crtc, signed dest
3835b46e5535d9 Gustavo Padovan   2016-11-07   89  	 * location allows it to be partially off screen.
3835b46e5535d9 Gustavo Padovan   2016-11-07   90  	 */
3835b46e5535d9 Gustavo Padovan   2016-11-07   91  
3835b46e5535d9 Gustavo Padovan   2016-11-07   92  	int32_t crtc_x;
3835b46e5535d9 Gustavo Padovan   2016-11-07   93  	/**
3835b46e5535d9 Gustavo Padovan   2016-11-07   94  	 * @crtc_y:
3835b46e5535d9 Gustavo Padovan   2016-11-07   95  	 *
3835b46e5535d9 Gustavo Padovan   2016-11-07   96  	 * Upper position of visible portion of plane on crtc, signed dest
3835b46e5535d9 Gustavo Padovan   2016-11-07   97  	 * location allows it to be partially off screen.
3835b46e5535d9 Gustavo Padovan   2016-11-07   98  	 */
3835b46e5535d9 Gustavo Padovan   2016-11-07   99  	int32_t crtc_y;
43968d7b806d7a Daniel Vetter     2016-09-21  100  
2e784a91424892 Daniel Vetter     2018-07-09  101  	/** @crtc_w: width of visible portion of plane on crtc */
2e784a91424892 Daniel Vetter     2018-07-09  102  	/** @crtc_h: height of visible portion of plane on crtc */
43968d7b806d7a Daniel Vetter     2016-09-21  103  	uint32_t crtc_w, crtc_h;
43968d7b806d7a Daniel Vetter     2016-09-21  104  
2e784a91424892 Daniel Vetter     2018-07-09  105  	/**
2e784a91424892 Daniel Vetter     2018-07-09  106  	 * @src_x: left position of visible portion of plane within plane (in
2e784a91424892 Daniel Vetter     2018-07-09  107  	 * 16.16 fixed point).
2e784a91424892 Daniel Vetter     2018-07-09  108  	 */
2e784a91424892 Daniel Vetter     2018-07-09  109  	uint32_t src_x;
2e784a91424892 Daniel Vetter     2018-07-09  110  	/**
2e784a91424892 Daniel Vetter     2018-07-09  111  	 * @src_y: upper position of visible portion of plane within plane (in
2e784a91424892 Daniel Vetter     2018-07-09  112  	 * 16.16 fixed point).
2e784a91424892 Daniel Vetter     2018-07-09  113  	 */
2e784a91424892 Daniel Vetter     2018-07-09  114  	uint32_t src_y;
2e784a91424892 Daniel Vetter     2018-07-09  115  	/** @src_w: width of visible portion of plane (in 16.16) */
2e784a91424892 Daniel Vetter     2018-07-09  116  	/** @src_h: height of visible portion of plane (in 16.16) */
43968d7b806d7a Daniel Vetter     2016-09-21  117  	uint32_t src_h, src_w;
43968d7b806d7a Daniel Vetter     2016-09-21  118  
2e784a91424892 Daniel Vetter     2018-07-09  119  	/**
2e784a91424892 Daniel Vetter     2018-07-09  120  	 * @alpha:
2e784a91424892 Daniel Vetter     2018-07-09  121  	 * Opacity of the plane with 0 as completely transparent and 0xffff as
2e784a91424892 Daniel Vetter     2018-07-09  122  	 * completely opaque. See drm_plane_create_alpha_property() for more
2e784a91424892 Daniel Vetter     2018-07-09  123  	 * details.
2e784a91424892 Daniel Vetter     2018-07-09  124  	 */
ae0e28265e216d Maxime Ripard     2018-04-11  125  	u16 alpha;
b972cece9448c5 Sean Paul         2018-08-31  126  
b972cece9448c5 Sean Paul         2018-08-31  127  	/**
b972cece9448c5 Sean Paul         2018-08-31  128  	 * @pixel_blend_mode:
b972cece9448c5 Sean Paul         2018-08-31  129  	 * The alpha blending equation selection, describing how the pixels from
b972cece9448c5 Sean Paul         2018-08-31  130  	 * the current plane are composited with the background. Value can be
b972cece9448c5 Sean Paul         2018-08-31  131  	 * one of DRM_MODE_BLEND_*
b972cece9448c5 Sean Paul         2018-08-31  132  	 */
a5ec8332d42805 Lowry Li          2018-08-23  133  	uint16_t pixel_blend_mode;
ae0e28265e216d Maxime Ripard     2018-04-11  134  
2e784a91424892 Daniel Vetter     2018-07-09  135  	/**
2e784a91424892 Daniel Vetter     2018-07-09  136  	 * @rotation:
2e784a91424892 Daniel Vetter     2018-07-09  137  	 * Rotation of the plane. See drm_plane_create_rotation_property() for
2e784a91424892 Daniel Vetter     2018-07-09  138  	 * more details.
2e784a91424892 Daniel Vetter     2018-07-09  139  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  140  	unsigned int rotation;
43968d7b806d7a Daniel Vetter     2016-09-21  141  
2e784a91424892 Daniel Vetter     2018-07-09  142  	/**
2e784a91424892 Daniel Vetter     2018-07-09  143  	 * @zpos:
2e784a91424892 Daniel Vetter     2018-07-09  144  	 * Priority of the given plane on crtc (optional).
2e784a91424892 Daniel Vetter     2018-07-09  145  	 *
8f6ea27b2fefdf Simon Ser         2019-10-09  146  	 * User-space may set mutable zpos properties so that multiple active
8f6ea27b2fefdf Simon Ser         2019-10-09  147  	 * planes on the same CRTC have identical zpos values. This is a
8f6ea27b2fefdf Simon Ser         2019-10-09  148  	 * user-space bug, but drivers can solve the conflict by comparing the
8f6ea27b2fefdf Simon Ser         2019-10-09  149  	 * plane object IDs; the plane with a higher ID is stacked on top of a
8f6ea27b2fefdf Simon Ser         2019-10-09  150  	 * plane with a lower ID.
2e784a91424892 Daniel Vetter     2018-07-09  151  	 *
2e784a91424892 Daniel Vetter     2018-07-09  152  	 * See drm_plane_create_zpos_property() and
2e784a91424892 Daniel Vetter     2018-07-09  153  	 * drm_plane_create_zpos_immutable_property() for more details.
2e784a91424892 Daniel Vetter     2018-07-09  154  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  155  	unsigned int zpos;
2e784a91424892 Daniel Vetter     2018-07-09  156  
2e784a91424892 Daniel Vetter     2018-07-09  157  	/**
2e784a91424892 Daniel Vetter     2018-07-09  158  	 * @normalized_zpos:
2e784a91424892 Daniel Vetter     2018-07-09  159  	 * Normalized value of zpos: unique, range from 0 to N-1 where N is the
2e784a91424892 Daniel Vetter     2018-07-09  160  	 * number of active planes for given crtc. Note that the driver must set
2e784a91424892 Daniel Vetter     2018-07-09  161  	 * &drm_mode_config.normalize_zpos or call drm_atomic_normalize_zpos() to
2e784a91424892 Daniel Vetter     2018-07-09  162  	 * update this before it can be trusted.
2e784a91424892 Daniel Vetter     2018-07-09  163  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  164  	unsigned int normalized_zpos;
43968d7b806d7a Daniel Vetter     2016-09-21  165  
80f690e9e3a60f Jyri Sarha        2018-02-19  166  	/**
80f690e9e3a60f Jyri Sarha        2018-02-19  167  	 * @color_encoding:
80f690e9e3a60f Jyri Sarha        2018-02-19  168  	 *
80f690e9e3a60f Jyri Sarha        2018-02-19  169  	 * Color encoding for non RGB formats
80f690e9e3a60f Jyri Sarha        2018-02-19  170  	 */
80f690e9e3a60f Jyri Sarha        2018-02-19  171  	enum drm_color_encoding color_encoding;
80f690e9e3a60f Jyri Sarha        2018-02-19  172  
80f690e9e3a60f Jyri Sarha        2018-02-19  173  	/**
80f690e9e3a60f Jyri Sarha        2018-02-19  174  	 * @color_range:
80f690e9e3a60f Jyri Sarha        2018-02-19  175  	 *
80f690e9e3a60f Jyri Sarha        2018-02-19  176  	 * Color range for non RGB formats
80f690e9e3a60f Jyri Sarha        2018-02-19  177  	 */
80f690e9e3a60f Jyri Sarha        2018-02-19  178  	enum drm_color_range color_range;
80f690e9e3a60f Jyri Sarha        2018-02-19  179  
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  180  	/**
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  181  	 * @fb_damage_clips:
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  182  	 *
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  183  	 * Blob representing damage (area in plane framebuffer that changed
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  184  	 * since last plane update) as an array of &drm_mode_rect in framebuffer
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  185  	 * coodinates of the attached framebuffer. Note that unlike plane src,
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  186  	 * damage clips are not in 16.16 fixed point.
6f11f37459d8f9 Daniel Vetter     2021-07-23  187  	 *
6f11f37459d8f9 Daniel Vetter     2021-07-23  188  	 * See drm_plane_get_damage_clips() and
6f11f37459d8f9 Daniel Vetter     2021-07-23  189  	 * drm_plane_get_damage_clips_count() for accessing these.
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  190  	 */
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  191  	struct drm_property_blob *fb_damage_clips;
d3b21767821ed3 Lukasz Spintzyk   2018-05-23  192  
fec748740c9ca3 Maarten Lankhorst 2019-10-10  193  	/**
fec748740c9ca3 Maarten Lankhorst 2019-10-10  194  	 * @src:
fec748740c9ca3 Maarten Lankhorst 2019-10-10  195  	 *
fec748740c9ca3 Maarten Lankhorst 2019-10-10  196  	 * source coordinates of the plane (in 16.16).
fec748740c9ca3 Maarten Lankhorst 2019-10-10  197  	 *
fec748740c9ca3 Maarten Lankhorst 2019-10-10  198  	 * When using drm_atomic_helper_check_plane_state(),
fec748740c9ca3 Maarten Lankhorst 2019-10-10  199  	 * the coordinates are clipped, but the driver may choose
fec748740c9ca3 Maarten Lankhorst 2019-10-10  200  	 * to use unclipped coordinates instead when the hardware
fec748740c9ca3 Maarten Lankhorst 2019-10-10  201  	 * performs the clipping automatically.
fec748740c9ca3 Maarten Lankhorst 2019-10-10  202  	 */
fec748740c9ca3 Maarten Lankhorst 2019-10-10  203  	/**
fec748740c9ca3 Maarten Lankhorst 2019-10-10  204  	 * @dst:
fec748740c9ca3 Maarten Lankhorst 2019-10-10  205  	 *
fec748740c9ca3 Maarten Lankhorst 2019-10-10  206  	 * clipped destination coordinates of the plane.
fec748740c9ca3 Maarten Lankhorst 2019-10-10  207  	 *
fec748740c9ca3 Maarten Lankhorst 2019-10-10  208  	 * When using drm_atomic_helper_check_plane_state(),
fec748740c9ca3 Maarten Lankhorst 2019-10-10  209  	 * the coordinates are clipped, but the driver may choose
fec748740c9ca3 Maarten Lankhorst 2019-10-10  210  	 * to use unclipped coordinates instead when the hardware
fec748740c9ca3 Maarten Lankhorst 2019-10-10  211  	 * performs the clipping automatically.
fec748740c9ca3 Maarten Lankhorst 2019-10-10  212  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  213  	struct drm_rect src, dst;
43968d7b806d7a Daniel Vetter     2016-09-21  214  
3835b46e5535d9 Gustavo Padovan   2016-11-07  215  	/**
3835b46e5535d9 Gustavo Padovan   2016-11-07  216  	 * @visible:
3835b46e5535d9 Gustavo Padovan   2016-11-07  217  	 *
3835b46e5535d9 Gustavo Padovan   2016-11-07  218  	 * Visibility of the plane. This can be false even if fb!=NULL and
3835b46e5535d9 Gustavo Padovan   2016-11-07  219  	 * crtc!=NULL, due to clipping.
43968d7b806d7a Daniel Vetter     2016-09-21  220  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  221  	bool visible;
43968d7b806d7a Daniel Vetter     2016-09-21  222  
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  223  	/**
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  224  	 * @scaling_filter:
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  225  	 *
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  226  	 * Scaling filter to be applied
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  227  	 */
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  228  	enum drm_scaling_filter scaling_filter;
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  229  
21a01abbe32a3c Maarten Lankhorst 2017-09-04  230  	/**
669c9215afea4e Maarten Lankhorst 2017-09-04  231  	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
669c9215afea4e Maarten Lankhorst 2017-09-04  232  	 * and for async plane updates.
21a01abbe32a3c Maarten Lankhorst 2017-09-04  233  	 *
669c9215afea4e Maarten Lankhorst 2017-09-04  234  	 * May be NULL.
21a01abbe32a3c Maarten Lankhorst 2017-09-04  235  	 */
21a01abbe32a3c Maarten Lankhorst 2017-09-04  236  	struct drm_crtc_commit *commit;
21a01abbe32a3c Maarten Lankhorst 2017-09-04  237  
2e784a91424892 Daniel Vetter     2018-07-09  238  	/** @state: backpointer to global drm_atomic_state */
43968d7b806d7a Daniel Vetter     2016-09-21  239  	struct drm_atomic_state *state;
f526f2c449aa3f Uma Shankar       2023-04-18  240  
f526f2c449aa3f Uma Shankar       2023-04-18  241  	/**
f526f2c449aa3f Uma Shankar       2023-04-18  242  	 * @degamma_mode: This is a blob_id and exposes the platform capabilities
f526f2c449aa3f Uma Shankar       2023-04-18  243  	 * wrt to various gamma modes and the respective lut ranges. This also
f526f2c449aa3f Uma Shankar       2023-04-18  244  	 * helps user select a degamma mode amongst the supported ones.
f526f2c449aa3f Uma Shankar       2023-04-18  245  	 */
f526f2c449aa3f Uma Shankar       2023-04-18  246  	u32 degamma_mode;
f526f2c449aa3f Uma Shankar       2023-04-18  247  
d533f37e420d6d Uma Shankar       2023-04-18  248  	/* @degamma_lut:
d533f37e420d6d Uma Shankar       2023-04-18  249  	 *
d533f37e420d6d Uma Shankar       2023-04-18  250  	 * Lookup table for converting framebuffer pixel data before apply the
d533f37e420d6d Uma Shankar       2023-04-18  251  	 * color conversion matrix @ctm. See drm_plane_enable_color_mgmt(). The
d533f37e420d6d Uma Shankar       2023-04-18  252  	 * blob (if not NULL) is an array of &struct drm_color_lut_ext.
d533f37e420d6d Uma Shankar       2023-04-18  253  	 */
d533f37e420d6d Uma Shankar       2023-04-18  254  	struct drm_property_blob *degamma_lut;
d533f37e420d6d Uma Shankar       2023-04-18  255  
f07348f59d071b Uma Shankar       2023-04-18  256  	/**
f07348f59d071b Uma Shankar       2023-04-18  257  	 * @ctm:
f07348f59d071b Uma Shankar       2023-04-18  258  	 *
f07348f59d071b Uma Shankar       2023-04-18  259  	 * Color transformation matrix. See drm_plane_enable_color_mgmt(). The
f07348f59d071b Uma Shankar       2023-04-18  260  	 * blob (if not NULL) is a &struct drm_color_ctm.
f07348f59d071b Uma Shankar       2023-04-18  261  	 */
f07348f59d071b Uma Shankar       2023-04-18  262  	struct drm_property_blob *ctm;
f07348f59d071b Uma Shankar       2023-04-18  263  
53714ab733efba Uma Shankar       2023-04-18  264  	/**
53714ab733efba Uma Shankar       2023-04-18  265  	 * @gamma_mode: This is a blob_id and exposes the platform capabilities
53714ab733efba Uma Shankar       2023-04-18  266  	 * wrt to various gamma modes and the respective lut ranges. This also
53714ab733efba Uma Shankar       2023-04-18  267  	 * helps user select a gamma mode amongst the supported ones.
53714ab733efba Uma Shankar       2023-04-18  268  	 */
53714ab733efba Uma Shankar       2023-04-18  269  	u32 gamma_mode;
53714ab733efba Uma Shankar       2023-04-18  270  
f88adb4c1023a7 Uma Shankar       2023-04-18  271  	/* @gamma_lut:
f88adb4c1023a7 Uma Shankar       2023-04-18  272  	 *
f88adb4c1023a7 Uma Shankar       2023-04-18  273  	 * Lookup table for converting framebuffer pixel data after applying the
f88adb4c1023a7 Uma Shankar       2023-04-18  274  	 * color conversion matrix @ctm. See drm_plane_enable_color_mgmt(). The
f88adb4c1023a7 Uma Shankar       2023-04-18  275  	 * blob (if not NULL) is an array of &struct drm_color_lut_ext.
f88adb4c1023a7 Uma Shankar       2023-04-18  276  	 */
f88adb4c1023a7 Uma Shankar       2023-04-18  277  	struct drm_property_blob *gamma_lut;
f88adb4c1023a7 Uma Shankar       2023-04-18  278  
f526f2c449aa3f Uma Shankar       2023-04-18  279  	u8 color_mgmt_changed : 1;
43968d7b806d7a Daniel Vetter     2016-09-21 @280  };
43968d7b806d7a Daniel Vetter     2016-09-21  281  

:::::: The code at line 280 was first introduced by commit
:::::: 43968d7b806d7a7e021261294c583a216fddf0e5 drm: Extract drm_plane.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

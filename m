Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FFEA50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJGbVf73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700881985; x=1732417985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctninyvtfhdFFAK6wo5TXpyPYhRKVU4KMK1vC2iJO0A=;
  b=bJGbVf73N9rKBac0WFGqFNc476VBEBeaHxMmQbFsldTqlHexcfmv4OPH
   78gTZ0Oh0qF7XcGAoH5BAKIQmenkbaobl349DBkrTsl7qousrJeChJLzv
   dX5W3vzSohn/aSBC8/VBvxETthzv9nwGWWGZsMXJzyiDe9InBmg9GOi6i
   rbcMUkh8/khGgEW5+K9dI7HUOGmkCY34vEeN6lVCEK1Y5RnHkzhIdq1L5
   5SxF9ncoXyuAtGGz4EAioF6jEmixFxJyAjaeOQXIXDcOADts2NXgsV5w1
   fWysIUtIVNd0wB3gNHCHa04Di799PejL6lVkeUCM1wgxidEbnNh8V2S/A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5716333"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="5716333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 19:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="885416764"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="885416764"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 19:13:01 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6j6J-0003a2-2O;
	Sat, 25 Nov 2023 03:12:59 +0000
Date: Sat, 25 Nov 2023 11:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
	"Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.1/linux 2282/2351] htmldocs:
 ./include/drm/drm_crtc.h:403: warning: Function parameter or member
 'gamma_mode_type' not described in 'drm_crtc_state'
Message-ID: <202311250906.ZmzDahs5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   b375c3f82247ffd48e5c37e98dafa086bc0eb81b
commit: 39aeda76272f7019031c141962575f459e680b91 [2282/2351] drm/i915/xelpd: Add support for Logarithmic gamma mode
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250906.ZmzDahs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250906.ZmzDahs5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_crtc.h:403: warning: Function parameter or member 'gamma_mode_type' not described in 'drm_crtc_state'

vim +403 ./include/drm/drm_crtc.h

4490d4c7111e1e Daniel Vetter       2015-12-04   65  
144ecb97cd57d2 Daniel Vetter       2014-10-27   66  /**
cc4ceb484b37b9 Daniel Vetter       2014-07-25   67   * struct drm_crtc_state - mutable CRTC state
d9b13620fa09d2 Daniel Vetter       2014-11-26   68   *
bb10211058880b Kieran Bingham      2019-03-14   69   * Note that the distinction between @enable and @active is rather subtle:
d9b13620fa09d2 Daniel Vetter       2014-11-26   70   * Flipping @active while @enable is set without changing anything else may
d574528a64c3a3 Daniel Vetter       2017-01-25   71   * never return in a failure from the &drm_mode_config_funcs.atomic_check
d574528a64c3a3 Daniel Vetter       2017-01-25   72   * callback. Userspace assumes that a DPMS On will always succeed. In other
d574528a64c3a3 Daniel Vetter       2017-01-25   73   * words: @enable controls resource assignment, @active controls the actual
d574528a64c3a3 Daniel Vetter       2017-01-25   74   * hardware state.
d807ed1c55fb1b Brian Starkey       2016-10-13   75   *
d807ed1c55fb1b Brian Starkey       2016-10-13   76   * The three booleans active_changed, connectors_changed and mode_changed are
d807ed1c55fb1b Brian Starkey       2016-10-13   77   * intended to indicate whether a full modeset is needed, rather than strictly
620eec75f35ce4 Daniel Vetter       2018-07-09   78   * describing what has changed in a commit. See also:
620eec75f35ce4 Daniel Vetter       2018-07-09   79   * drm_atomic_crtc_needs_modeset()
620eec75f35ce4 Daniel Vetter       2018-07-09   80   *
620eec75f35ce4 Daniel Vetter       2018-07-09   81   * WARNING: Transitional helpers (like drm_helper_crtc_mode_set() or
620eec75f35ce4 Daniel Vetter       2018-07-09   82   * drm_helper_crtc_mode_set_base()) do not maintain many of the derived control
620eec75f35ce4 Daniel Vetter       2018-07-09   83   * state like @plane_mask so drivers not converted over to atomic helpers should
620eec75f35ce4 Daniel Vetter       2018-07-09   84   * not rely on these being accurate!
144ecb97cd57d2 Daniel Vetter       2014-10-27   85   */
144ecb97cd57d2 Daniel Vetter       2014-10-27   86  struct drm_crtc_state {
620eec75f35ce4 Daniel Vetter       2018-07-09   87  	/** @crtc: backpointer to the CRTC */
07cc0ef67fa873 Daniel Vetter       2014-11-27   88  	struct drm_crtc *crtc;
07cc0ef67fa873 Daniel Vetter       2014-11-27   89  
620eec75f35ce4 Daniel Vetter       2018-07-09   90  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09   91  	 * @enable: Whether the CRTC should be enabled, gates all other state.
620eec75f35ce4 Daniel Vetter       2018-07-09   92  	 * This controls reservations of shared resources. Actual hardware state
620eec75f35ce4 Daniel Vetter       2018-07-09   93  	 * is controlled by @active.
620eec75f35ce4 Daniel Vetter       2018-07-09   94  	 */
cc4ceb484b37b9 Daniel Vetter       2014-07-25   95  	bool enable;
620eec75f35ce4 Daniel Vetter       2018-07-09   96  
620eec75f35ce4 Daniel Vetter       2018-07-09   97  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09   98  	 * @active: Whether the CRTC is actively displaying (used for DPMS).
620eec75f35ce4 Daniel Vetter       2018-07-09   99  	 * Implies that @enable is set. The driver must not release any shared
620eec75f35ce4 Daniel Vetter       2018-07-09  100  	 * resources if @active is set to false but @enable still true, because
620eec75f35ce4 Daniel Vetter       2018-07-09  101  	 * userspace expects that a DPMS ON always succeeds.
620eec75f35ce4 Daniel Vetter       2018-07-09  102  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  103  	 * Hence drivers must not consult @active in their various
620eec75f35ce4 Daniel Vetter       2018-07-09  104  	 * &drm_mode_config_funcs.atomic_check callback to reject an atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  105  	 * commit. They can consult it to aid in the computation of derived
620eec75f35ce4 Daniel Vetter       2018-07-09  106  	 * hardware state, since even in the DPMS OFF state the display hardware
620eec75f35ce4 Daniel Vetter       2018-07-09  107  	 * should be as much powered down as when the CRTC is completely
620eec75f35ce4 Daniel Vetter       2018-07-09  108  	 * disabled through setting @enable to false.
620eec75f35ce4 Daniel Vetter       2018-07-09  109  	 */
d9b13620fa09d2 Daniel Vetter       2014-11-26  110  	bool active;
144ecb97cd57d2 Daniel Vetter       2014-10-27  111  
620eec75f35ce4 Daniel Vetter       2018-07-09  112  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  113  	 * @planes_changed: Planes on this crtc are updated. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  114  	 * helpers and drivers to steer the atomic commit control flow.
620eec75f35ce4 Daniel Vetter       2018-07-09  115  	 */
c2fcd274bce521 Daniel Vetter       2014-11-05  116  	bool planes_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  117  
620eec75f35ce4 Daniel Vetter       2018-07-09  118  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  119  	 * @mode_changed: @mode or @enable has been changed. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  120  	 * helpers and drivers to steer the atomic commit control flow. See also
620eec75f35ce4 Daniel Vetter       2018-07-09  121  	 * drm_atomic_crtc_needs_modeset().
620eec75f35ce4 Daniel Vetter       2018-07-09  122  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  123  	 * Drivers are supposed to set this for any CRTC state changes that
620eec75f35ce4 Daniel Vetter       2018-07-09  124  	 * require a full modeset. They can also reset it to false if e.g. a
620eec75f35ce4 Daniel Vetter       2018-07-09  125  	 * @mode change can be done without a full modeset by only changing
620eec75f35ce4 Daniel Vetter       2018-07-09  126  	 * scaler settings.
620eec75f35ce4 Daniel Vetter       2018-07-09  127  	 */
623369e533e8a5 Daniel Vetter       2014-09-16  128  	bool mode_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  129  
620eec75f35ce4 Daniel Vetter       2018-07-09  130  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  131  	 * @active_changed: @active has been toggled. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  132  	 * helpers and drivers to steer the atomic commit control flow. See also
620eec75f35ce4 Daniel Vetter       2018-07-09  133  	 * drm_atomic_crtc_needs_modeset().
620eec75f35ce4 Daniel Vetter       2018-07-09  134  	 */
eab3bbeffd1521 Daniel Vetter       2015-01-22  135  	bool active_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  136  
620eec75f35ce4 Daniel Vetter       2018-07-09  137  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  138  	 * @connectors_changed: Connectors to this crtc have been updated,
620eec75f35ce4 Daniel Vetter       2018-07-09  139  	 * either in their state or routing. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  140  	 * helpers and drivers to steer the atomic commit control flow. See also
620eec75f35ce4 Daniel Vetter       2018-07-09  141  	 * drm_atomic_crtc_needs_modeset().
620eec75f35ce4 Daniel Vetter       2018-07-09  142  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  143  	 * Drivers are supposed to set this as-needed from their own atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  144  	 * check code, e.g. from &drm_encoder_helper_funcs.atomic_check
620eec75f35ce4 Daniel Vetter       2018-07-09  145  	 */
fc596660dd4e83 Maarten Lankhorst   2015-07-21  146  	bool connectors_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  147  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  148  	 * @zpos_changed: zpos values of planes on this crtc have been updated.
620eec75f35ce4 Daniel Vetter       2018-07-09  149  	 * Used by the atomic helpers and drivers to steer the atomic commit
620eec75f35ce4 Daniel Vetter       2018-07-09  150  	 * control flow.
620eec75f35ce4 Daniel Vetter       2018-07-09  151  	 */
44d1240d006c9c Marek Szyprowski    2016-06-13  152  	bool zpos_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  153  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  154  	 * @color_mgmt_changed: Color management properties have changed
620eec75f35ce4 Daniel Vetter       2018-07-09  155  	 * (@gamma_lut, @degamma_lut or @ctm). Used by the atomic helpers and
620eec75f35ce4 Daniel Vetter       2018-07-09  156  	 * drivers to steer the atomic commit control flow.
620eec75f35ce4 Daniel Vetter       2018-07-09  157  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  158  	bool color_mgmt_changed : 1;
623369e533e8a5 Daniel Vetter       2014-09-16  159  
b25c60af7a8773 Boris Brezillon     2018-07-03  160  	/**
b25c60af7a8773 Boris Brezillon     2018-07-03  161  	 * @no_vblank:
b25c60af7a8773 Boris Brezillon     2018-07-03  162  	 *
b25c60af7a8773 Boris Brezillon     2018-07-03  163  	 * Reflects the ability of a CRTC to send VBLANK events. This state
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  164  	 * usually depends on the pipeline configuration. If set to true, DRM
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  165  	 * atomic helpers will send out a fake VBLANK event during display
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  166  	 * updates after all hardware changes have been committed. This is
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  167  	 * implemented in drm_atomic_helper_fake_vblank().
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  168  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  169  	 * One usage is for drivers and/or hardware without support for VBLANK
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  170  	 * interrupts. Such drivers typically do not initialize vblanking
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  171  	 * (i.e., call drm_vblank_init() with the number of CRTCs). For CRTCs
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  172  	 * without initialized vblanking, this field is set to true in
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  173  	 * drm_atomic_helper_check_modeset(), and a fake VBLANK event will be
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  174  	 * send out on each update of the display pipeline by
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  175  	 * drm_atomic_helper_fake_vblank().
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  176  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  177  	 * Another usage is CRTCs feeding a writeback connector operating in
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  178  	 * oneshot mode. In this case the fake VBLANK event is only generated
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  179  	 * when a job is queued to the writeback connector, and we want the
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  180  	 * core to fake VBLANK events when this part of the pipeline hasn't
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  181  	 * changed but others had or when the CRTC and connectors are being
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  182  	 * disabled.
b25c60af7a8773 Boris Brezillon     2018-07-03  183  	 *
b25c60af7a8773 Boris Brezillon     2018-07-03  184  	 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
b25c60af7a8773 Boris Brezillon     2018-07-03  185  	 * from the current state, the CRTC driver is then responsible for
b25c60af7a8773 Boris Brezillon     2018-07-03  186  	 * updating this field when needed.
b25c60af7a8773 Boris Brezillon     2018-07-03  187  	 *
b25c60af7a8773 Boris Brezillon     2018-07-03  188  	 * Note that the combination of &drm_crtc_state.event == NULL and
b25c60af7a8773 Boris Brezillon     2018-07-03  189  	 * &drm_crtc_state.no_blank == true is valid and usually used when the
b25c60af7a8773 Boris Brezillon     2018-07-03  190  	 * writeback connector attached to the CRTC has a new job queued. In
b25c60af7a8773 Boris Brezillon     2018-07-03  191  	 * this case the driver will send the VBLANK event on its own when the
b25c60af7a8773 Boris Brezillon     2018-07-03  192  	 * writeback job is complete.
b25c60af7a8773 Boris Brezillon     2018-07-03  193  	 */
b25c60af7a8773 Boris Brezillon     2018-07-03  194  	bool no_vblank : 1;
b25c60af7a8773 Boris Brezillon     2018-07-03  195  
620eec75f35ce4 Daniel Vetter       2018-07-09  196  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  197  	 * @plane_mask: Bitmask of drm_plane_mask(plane) of planes attached to
620eec75f35ce4 Daniel Vetter       2018-07-09  198  	 * this CRTC.
6ddd388ab222b6 Rob Clark           2014-11-21  199  	 */
6ddd388ab222b6 Rob Clark           2014-11-21  200  	u32 plane_mask;
6ddd388ab222b6 Rob Clark           2014-11-21  201  
620eec75f35ce4 Daniel Vetter       2018-07-09  202  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  203  	 * @connector_mask: Bitmask of drm_connector_mask(connector) of
620eec75f35ce4 Daniel Vetter       2018-07-09  204  	 * connectors attached to this CRTC.
620eec75f35ce4 Daniel Vetter       2018-07-09  205  	 */
4cd9fa529d77dd Maarten Lankhorst   2016-01-04  206  	u32 connector_mask;
620eec75f35ce4 Daniel Vetter       2018-07-09  207  
620eec75f35ce4 Daniel Vetter       2018-07-09  208  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  209  	 * @encoder_mask: Bitmask of drm_encoder_mask(encoder) of encoders
620eec75f35ce4 Daniel Vetter       2018-07-09  210  	 * attached to this CRTC.
620eec75f35ce4 Daniel Vetter       2018-07-09  211  	 */
e87a52b3894360 Maarten Lankhorst   2016-01-28  212  	u32 encoder_mask;
4cd9fa529d77dd Maarten Lankhorst   2016-01-04  213  
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  214  	/**
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  215  	 * @adjusted_mode:
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  216  	 *
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  217  	 * Internal display timings which can be used by the driver to handle
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  218  	 * differences between the mode requested by userspace in @mode and what
584a0146ec4989 Philippe Cornu      2018-04-09  219  	 * is actually programmed into the hardware.
584a0146ec4989 Philippe Cornu      2018-04-09  220  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  221  	 * For drivers using &drm_bridge, this stores hardware display timings
584a0146ec4989 Philippe Cornu      2018-04-09  222  	 * used between the CRTC and the first bridge. For other drivers, the
584a0146ec4989 Philippe Cornu      2018-04-09  223  	 * meaning of the adjusted_mode field is purely driver implementation
584a0146ec4989 Philippe Cornu      2018-04-09  224  	 * defined information, and will usually be used to store the hardware
584a0146ec4989 Philippe Cornu      2018-04-09  225  	 * display timings used between the CRTC and encoder blocks.
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  226  	 */
2f324b42b7b24a Daniel Vetter       2014-10-29  227  	struct drm_display_mode adjusted_mode;
2f324b42b7b24a Daniel Vetter       2014-10-29  228  
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  229  	/**
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  230  	 * @mode:
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  231  	 *
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  232  	 * Display timings requested by userspace. The driver should try to
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  233  	 * match the refresh rate as close as possible (but note that it's
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  234  	 * undefined what exactly is close enough, e.g. some of the HDMI modes
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  235  	 * only differ in less than 1% of the refresh rate). The active width
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  236  	 * and height as observed by userspace for positioning planes must match
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  237  	 * exactly.
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  238  	 *
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  239  	 * For external connectors where the sink isn't fixed (like with a
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  240  	 * built-in panel), this mode here should match the physical mode on the
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  241  	 * wire to the last details (i.e. including sync polarities and
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  242  	 * everything).
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  243  	 */
144ecb97cd57d2 Daniel Vetter       2014-10-27  244  	struct drm_display_mode mode;
144ecb97cd57d2 Daniel Vetter       2014-10-27  245  
620eec75f35ce4 Daniel Vetter       2018-07-09  246  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  247  	 * @mode_blob: &drm_property_blob for @mode, for exposing the mode to
620eec75f35ce4 Daniel Vetter       2018-07-09  248  	 * atomic userspace.
620eec75f35ce4 Daniel Vetter       2018-07-09  249  	 */
99cf4a29fa2446 Daniel Stone        2015-05-25  250  	struct drm_property_blob *mode_blob;
99cf4a29fa2446 Daniel Stone        2015-05-25  251  
8957a380d19144 Uma Shankar         2023-04-18  252  	/**
8957a380d19144 Uma Shankar         2023-04-18  253  	 * @gamma_mode: This is a blob_id and exposes the platform capabilities
8957a380d19144 Uma Shankar         2023-04-18  254  	 * wrt to various gamma modes and the respective lut ranges. This also
8957a380d19144 Uma Shankar         2023-04-18  255  	 * helps user select a gamma mode amongst the supported ones.
8957a380d19144 Uma Shankar         2023-04-18  256  	 */
8957a380d19144 Uma Shankar         2023-04-18  257  	u32 gamma_mode;
8957a380d19144 Uma Shankar         2023-04-18  258  
39aeda76272f70 Uma Shankar         2023-04-18  259  	/** Gamma mode type programmed on the pipe */
39aeda76272f70 Uma Shankar         2023-04-18  260  	u32 gamma_mode_type;
39aeda76272f70 Uma Shankar         2023-04-18  261  
2e38178e23e63b Daniel Vetter       2017-04-12  262  	/**
2e38178e23e63b Daniel Vetter       2017-04-12  263  	 * @degamma_lut:
2e38178e23e63b Daniel Vetter       2017-04-12  264  	 *
2e38178e23e63b Daniel Vetter       2017-04-12  265  	 * Lookup table for converting framebuffer pixel data before apply the
2e38178e23e63b Daniel Vetter       2017-04-12  266  	 * color conversion matrix @ctm. See drm_crtc_enable_color_mgmt(). The
2e38178e23e63b Daniel Vetter       2017-04-12  267  	 * blob (if not NULL) is an array of &struct drm_color_lut.
2e38178e23e63b Daniel Vetter       2017-04-12  268  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  269  	struct drm_property_blob *degamma_lut;
2e38178e23e63b Daniel Vetter       2017-04-12  270  
2e38178e23e63b Daniel Vetter       2017-04-12  271  	/**
2e38178e23e63b Daniel Vetter       2017-04-12  272  	 * @ctm:
2e38178e23e63b Daniel Vetter       2017-04-12  273  	 *
2e38178e23e63b Daniel Vetter       2017-04-12  274  	 * Color transformation matrix. See drm_crtc_enable_color_mgmt(). The
2e38178e23e63b Daniel Vetter       2017-04-12  275  	 * blob (if not NULL) is a &struct drm_color_ctm.
2e38178e23e63b Daniel Vetter       2017-04-12  276  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  277  	struct drm_property_blob *ctm;
2e38178e23e63b Daniel Vetter       2017-04-12  278  
2e38178e23e63b Daniel Vetter       2017-04-12  279  	/**
2e38178e23e63b Daniel Vetter       2017-04-12  280  	 * @gamma_lut:
2e38178e23e63b Daniel Vetter       2017-04-12  281  	 *
2e38178e23e63b Daniel Vetter       2017-04-12  282  	 * Lookup table for converting pixel data after the color conversion
2e38178e23e63b Daniel Vetter       2017-04-12  283  	 * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
2e38178e23e63b Daniel Vetter       2017-04-12  284  	 * NULL) is an array of &struct drm_color_lut.
4fd5e720b709b8 Daniel Vetter       2022-01-24  285  	 *
4fd5e720b709b8 Daniel Vetter       2022-01-24  286  	 * Note that for mostly historical reasons stemming from Xorg heritage,
4fd5e720b709b8 Daniel Vetter       2022-01-24  287  	 * this is also used to store the color map (also sometimes color lut,
4fd5e720b709b8 Daniel Vetter       2022-01-24  288  	 * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
2e38178e23e63b Daniel Vetter       2017-04-12  289  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  290  	struct drm_property_blob *gamma_lut;
5488dc16fde745 Lionel Landwerlin   2016-02-26  291  
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  292  	/**
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  293  	 * @target_vblank:
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  294  	 *
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  295  	 * Target vertical blank period when a page flip
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  296  	 * should take effect.
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  297  	 */
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  298  	u32 target_vblank;
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  299  
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  300  	/**
4d85f45c73a22b Daniel Vetter       2019-09-03  301  	 * @async_flip:
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  302  	 *
4d85f45c73a22b Daniel Vetter       2019-09-03  303  	 * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
4d85f45c73a22b Daniel Vetter       2019-09-03  304  	 * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL itself yet.
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  305  	 */
4d85f45c73a22b Daniel Vetter       2019-09-03  306  	bool async_flip;
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  307  
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  308  	/**
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  309  	 * @vrr_enabled:
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  310  	 *
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  311  	 * Indicates if variable refresh rate should be enabled for the CRTC.
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  312  	 * Support for the requested vrr state will depend on driver and
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  313  	 * hardware capabiltiy - lacking support is not treated as failure.
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  314  	 */
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  315  	bool vrr_enabled;
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  316  
1452c25b0e6027 Sean Paul           2019-06-12  317  	/**
1452c25b0e6027 Sean Paul           2019-06-12  318  	 * @self_refresh_active:
1452c25b0e6027 Sean Paul           2019-06-12  319  	 *
1452c25b0e6027 Sean Paul           2019-06-12  320  	 * Used by the self refresh helpers to denote when a self refresh
1452c25b0e6027 Sean Paul           2019-06-12  321  	 * transition is occurring. This will be set on enable/disable callbacks
1452c25b0e6027 Sean Paul           2019-06-12  322  	 * when self refresh is being enabled or disabled. In some cases, it may
1452c25b0e6027 Sean Paul           2019-06-12  323  	 * not be desirable to fully shut off the crtc during self refresh.
1452c25b0e6027 Sean Paul           2019-06-12  324  	 * CRTC's can inspect this flag and determine the best course of action.
1452c25b0e6027 Sean Paul           2019-06-12  325  	 */
1452c25b0e6027 Sean Paul           2019-06-12  326  	bool self_refresh_active;
1452c25b0e6027 Sean Paul           2019-06-12  327  
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  328  	/**
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  329  	 * @scaling_filter:
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  330  	 *
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  331  	 * Scaling filter to be applied
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  332  	 */
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  333  	enum drm_scaling_filter scaling_filter;
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  334  
61802130d85fda Daniel Vetter       2016-09-30  335  	/**
61802130d85fda Daniel Vetter       2016-09-30  336  	 * @event:
61802130d85fda Daniel Vetter       2016-09-30  337  	 *
61802130d85fda Daniel Vetter       2016-09-30  338  	 * Optional pointer to a DRM event to signal upon completion of the
61802130d85fda Daniel Vetter       2016-09-30  339  	 * state update. The driver must send out the event when the atomic
61802130d85fda Daniel Vetter       2016-09-30  340  	 * commit operation completes. There are two cases:
61802130d85fda Daniel Vetter       2016-09-30  341  	 *
61802130d85fda Daniel Vetter       2016-09-30  342  	 *  - The event is for a CRTC which is being disabled through this
61802130d85fda Daniel Vetter       2016-09-30  343  	 *    atomic commit. In that case the event can be send out any time
61802130d85fda Daniel Vetter       2016-09-30  344  	 *    after the hardware has stopped scanning out the current
61802130d85fda Daniel Vetter       2016-09-30  345  	 *    framebuffers. It should contain the timestamp and counter for the
8938d13585bc91 Daniel Vetter       2017-05-24  346  	 *    last vblank before the display pipeline was shut off. The simplest
8938d13585bc91 Daniel Vetter       2017-05-24  347  	 *    way to achieve that is calling drm_crtc_send_vblank_event()
8938d13585bc91 Daniel Vetter       2017-05-24  348  	 *    somewhen after drm_crtc_vblank_off() has been called.
61802130d85fda Daniel Vetter       2016-09-30  349  	 *
61802130d85fda Daniel Vetter       2016-09-30  350  	 *  - For a CRTC which is enabled at the end of the commit (even when it
61802130d85fda Daniel Vetter       2016-09-30  351  	 *    undergoes an full modeset) the vblank timestamp and counter must
61802130d85fda Daniel Vetter       2016-09-30  352  	 *    be for the vblank right before the first frame that scans out the
61802130d85fda Daniel Vetter       2016-09-30  353  	 *    new set of buffers. Again the event can only be sent out after the
61802130d85fda Daniel Vetter       2016-09-30  354  	 *    hardware has stopped scanning out the old buffers.
61802130d85fda Daniel Vetter       2016-09-30  355  	 *
61802130d85fda Daniel Vetter       2016-09-30  356  	 *  - Events for disabled CRTCs are not allowed, and drivers can ignore
61802130d85fda Daniel Vetter       2016-09-30  357  	 *    that case.
61802130d85fda Daniel Vetter       2016-09-30  358  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  359  	 * For very simple hardware without VBLANK interrupt, enabling
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  360  	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  361  	 * send a fake VBLANK event at the end of the display update after all
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  362  	 * hardware changes have been applied. See
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  363  	 * drm_atomic_helper_fake_vblank().
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  364  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  365  	 * For more complex hardware this
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  366  	 * can be handled by the drm_crtc_send_vblank_event() function,
61802130d85fda Daniel Vetter       2016-09-30  367  	 * which the driver should call on the provided event upon completion of
61802130d85fda Daniel Vetter       2016-09-30  368  	 * the atomic commit. Note that if the driver supports vblank signalling
61802130d85fda Daniel Vetter       2016-09-30  369  	 * and timestamping the vblank counters and timestamps must agree with
61802130d85fda Daniel Vetter       2016-09-30  370  	 * the ones returned from page flip events. With the current vblank
61802130d85fda Daniel Vetter       2016-09-30  371  	 * helper infrastructure this can be achieved by holding a vblank
61802130d85fda Daniel Vetter       2016-09-30  372  	 * reference while the page flip is pending, acquired through
61802130d85fda Daniel Vetter       2016-09-30  373  	 * drm_crtc_vblank_get() and released with drm_crtc_vblank_put().
61802130d85fda Daniel Vetter       2016-09-30  374  	 * Drivers are free to implement their own vblank counter and timestamp
61802130d85fda Daniel Vetter       2016-09-30  375  	 * tracking though, e.g. if they have accurate timestamp registers in
61802130d85fda Daniel Vetter       2016-09-30  376  	 * hardware.
61802130d85fda Daniel Vetter       2016-09-30  377  	 *
61802130d85fda Daniel Vetter       2016-09-30  378  	 * For hardware which supports some means to synchronize vblank
61802130d85fda Daniel Vetter       2016-09-30  379  	 * interrupt delivery with committing display state there's also
61802130d85fda Daniel Vetter       2016-09-30  380  	 * drm_crtc_arm_vblank_event(). See the documentation of that function
61802130d85fda Daniel Vetter       2016-09-30  381  	 * for a detailed discussion of the constraints it needs to be used
61802130d85fda Daniel Vetter       2016-09-30  382  	 * safely.
66f8c100039661 Daniel Vetter       2017-03-08  383  	 *
66f8c100039661 Daniel Vetter       2017-03-08  384  	 * If the device can't notify of flip completion in a race-free way
66f8c100039661 Daniel Vetter       2017-03-08  385  	 * at all, then the event should be armed just after the page flip is
66f8c100039661 Daniel Vetter       2017-03-08  386  	 * committed. In the worst case the driver will send the event to
66f8c100039661 Daniel Vetter       2017-03-08  387  	 * userspace one frame too late. This doesn't allow for a real atomic
66f8c100039661 Daniel Vetter       2017-03-08  388  	 * update, but it should avoid tearing.
61802130d85fda Daniel Vetter       2016-09-30  389  	 */
144ecb97cd57d2 Daniel Vetter       2014-10-27  390  	struct drm_pending_vblank_event *event;
144ecb97cd57d2 Daniel Vetter       2014-10-27  391  
163bcc2c74a22c Maarten Lankhorst   2017-09-04  392  	/**
163bcc2c74a22c Maarten Lankhorst   2017-09-04  393  	 * @commit:
163bcc2c74a22c Maarten Lankhorst   2017-09-04  394  	 *
163bcc2c74a22c Maarten Lankhorst   2017-09-04  395  	 * This tracks how the commit for this update proceeds through the
163bcc2c74a22c Maarten Lankhorst   2017-09-04  396  	 * various phases. This is never cleared, except when we destroy the
163bcc2c74a22c Maarten Lankhorst   2017-09-04  397  	 * state, so that subsequent commits can synchronize with previous ones.
163bcc2c74a22c Maarten Lankhorst   2017-09-04  398  	 */
163bcc2c74a22c Maarten Lankhorst   2017-09-04  399  	struct drm_crtc_commit *commit;
163bcc2c74a22c Maarten Lankhorst   2017-09-04  400  
620eec75f35ce4 Daniel Vetter       2018-07-09  401  	/** @state: backpointer to global drm_atomic_state */
144ecb97cd57d2 Daniel Vetter       2014-10-27  402  	struct drm_atomic_state *state;
144ecb97cd57d2 Daniel Vetter       2014-10-27 @403  };
f453ba0460742a Dave Airlie         2008-11-07  404  

:::::: The code at line 403 was first introduced by commit
:::::: 144ecb97cd57d2a61cc455730a3337e413499cae drm: Add atomic driver interface definitions for objects

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

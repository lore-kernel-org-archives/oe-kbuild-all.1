Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9008672622
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459852; cv=none; b=gIDLcTdYh4BDW/9rnVqUIOc9qdNMj0aci1eTQdBERB18DiA15+P2R6waCp0h2P/s2S6CX0QTkyV1p4mthvKAjCQTPqhaBZ+2XjY76FBJRyFt4JzmW/x2EwhdrelHYX8hGsuKZjEa29nL+68KnjMuTiAMum7U8dn767ljiWqtpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459852; c=relaxed/simple;
	bh=+Jpa/sEjDH5b6qO+BSQfWPmfYNg0l1kISkQ1L5FxM7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lpys4hQ1XW0g+Pred8ZEkXNSi7Cmj3dUAgqNO3034jIhdxUJaPnhp0fUArCONK4H48Lb5FwCmfoBDQrU3+BhwyM0Y+RSuwlcAa98qYs3ztA5dMrvssXYMvYpYJFLKetnrb6aDRMdKbfjXG7kdLH3ifGOJ7RpHy36lMIBzOUPqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvB86IGg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvB86IGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765459850; x=1796995850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Jpa/sEjDH5b6qO+BSQfWPmfYNg0l1kISkQ1L5FxM7Q=;
  b=AvB86IGgojV6tP7UtPOjjDCUa6caImfH8I9a5rc38Eke7pE8o5560y2n
   WneUUm3jhHn0LPEvPP0htq5uMt4Z+ZgOkCO0MHbjc0AqW7XD/BBv0G/r3
   tljJCPRC6TSlp8d13fSRtoB2YPOpNypktVaKzMKvH+lDa/aQkoaTSEH2B
   Gr38/Q4/JyZW++iTM8jSlh6axrtgm9kq1WYzyJzGWmzTByyAqAh1OeB2x
   ft9l2T9cW+m4AY7pcqIJWIITcog7rkGPHgP+6qcP2tXhEB7auD4gEC0MC
   edAxSA1JUe+ONMaPZmZoKGG2gwxxPd4j075iaUhY9bFXZihy6FDfFLlUD
   Q==;
X-CSE-ConnectionGUID: 4qWa52J4T82vpT6izjPMgg==
X-CSE-MsgGUID: ZEpsYj9NQK6kXSd0kD5xmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67326516"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67326516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:30:49 -0800
X-CSE-ConnectionGUID: FPY7lzL6RpG+UIF6fyTSqA==
X-CSE-MsgGUID: 0noT2NQwTMSDbvQyONIJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197618561"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 05:30:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgkn-0000000016Q-0iWH;
	Thu, 11 Dec 2025 13:30:45 +0000
Date: Thu, 11 Dec 2025 14:30:03 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/drm/drm_crtc.h:392: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'drm_crtc_state'
Message-ID: <202512111432.s5VdCSnc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: c838ee8e68deff494edbc699764a07ba937a80b9 [3508/3508] drm: drm_crtc.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111432.s5VdCSnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111432.s5VdCSnc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/backlight.h
   ./include/drm/drm_client.h:121: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_dev'
   ./include/drm/drm_client.h:163: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_buffer'
   ./include/drm/drm_atomic.h:246: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state_funcs'
   ./include/drm/drm_atomic.h:347: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state'
>> ./include/drm/drm_crtc.h:392: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_crtc_state'
>> ./include/drm/drm_crtc.h:1185: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_crtc'
   ./include/drm/drm_connector.h:328: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_hdmi_info'
   ./include/drm/drm_connector.h:531: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'
   ./include/drm/drm_connector.h:826: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_display_info'
   ./include/drm/drm_connector.h:888: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_tv_connector_state'
   ./include/drm/drm_connector.h:1350: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector_funcs'


vim +392 ./include/drm/drm_crtc.h

4490d4c7111e1e Daniel Vetter       2015-12-04   66  
144ecb97cd57d2 Daniel Vetter       2014-10-27   67  /**
cc4ceb484b37b9 Daniel Vetter       2014-07-25   68   * struct drm_crtc_state - mutable CRTC state
d9b13620fa09d2 Daniel Vetter       2014-11-26   69   *
bb10211058880b Kieran Bingham      2019-03-14   70   * Note that the distinction between @enable and @active is rather subtle:
d9b13620fa09d2 Daniel Vetter       2014-11-26   71   * Flipping @active while @enable is set without changing anything else may
d574528a64c3a3 Daniel Vetter       2017-01-25   72   * never return in a failure from the &drm_mode_config_funcs.atomic_check
d574528a64c3a3 Daniel Vetter       2017-01-25   73   * callback. Userspace assumes that a DPMS On will always succeed. In other
d574528a64c3a3 Daniel Vetter       2017-01-25   74   * words: @enable controls resource assignment, @active controls the actual
d574528a64c3a3 Daniel Vetter       2017-01-25   75   * hardware state.
d807ed1c55fb1b Brian Starkey       2016-10-13   76   *
d807ed1c55fb1b Brian Starkey       2016-10-13   77   * The three booleans active_changed, connectors_changed and mode_changed are
d807ed1c55fb1b Brian Starkey       2016-10-13   78   * intended to indicate whether a full modeset is needed, rather than strictly
620eec75f35ce4 Daniel Vetter       2018-07-09   79   * describing what has changed in a commit. See also:
620eec75f35ce4 Daniel Vetter       2018-07-09   80   * drm_atomic_crtc_needs_modeset()
144ecb97cd57d2 Daniel Vetter       2014-10-27   81   */
144ecb97cd57d2 Daniel Vetter       2014-10-27   82  struct drm_crtc_state {
620eec75f35ce4 Daniel Vetter       2018-07-09   83  	/** @crtc: backpointer to the CRTC */
07cc0ef67fa873 Daniel Vetter       2014-11-27   84  	struct drm_crtc *crtc;
07cc0ef67fa873 Daniel Vetter       2014-11-27   85  
620eec75f35ce4 Daniel Vetter       2018-07-09   86  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09   87  	 * @enable: Whether the CRTC should be enabled, gates all other state.
620eec75f35ce4 Daniel Vetter       2018-07-09   88  	 * This controls reservations of shared resources. Actual hardware state
620eec75f35ce4 Daniel Vetter       2018-07-09   89  	 * is controlled by @active.
620eec75f35ce4 Daniel Vetter       2018-07-09   90  	 */
cc4ceb484b37b9 Daniel Vetter       2014-07-25   91  	bool enable;
620eec75f35ce4 Daniel Vetter       2018-07-09   92  
620eec75f35ce4 Daniel Vetter       2018-07-09   93  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09   94  	 * @active: Whether the CRTC is actively displaying (used for DPMS).
620eec75f35ce4 Daniel Vetter       2018-07-09   95  	 * Implies that @enable is set. The driver must not release any shared
620eec75f35ce4 Daniel Vetter       2018-07-09   96  	 * resources if @active is set to false but @enable still true, because
620eec75f35ce4 Daniel Vetter       2018-07-09   97  	 * userspace expects that a DPMS ON always succeeds.
620eec75f35ce4 Daniel Vetter       2018-07-09   98  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09   99  	 * Hence drivers must not consult @active in their various
620eec75f35ce4 Daniel Vetter       2018-07-09  100  	 * &drm_mode_config_funcs.atomic_check callback to reject an atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  101  	 * commit. They can consult it to aid in the computation of derived
620eec75f35ce4 Daniel Vetter       2018-07-09  102  	 * hardware state, since even in the DPMS OFF state the display hardware
620eec75f35ce4 Daniel Vetter       2018-07-09  103  	 * should be as much powered down as when the CRTC is completely
620eec75f35ce4 Daniel Vetter       2018-07-09  104  	 * disabled through setting @enable to false.
620eec75f35ce4 Daniel Vetter       2018-07-09  105  	 */
d9b13620fa09d2 Daniel Vetter       2014-11-26  106  	bool active;
144ecb97cd57d2 Daniel Vetter       2014-10-27  107  
620eec75f35ce4 Daniel Vetter       2018-07-09  108  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  109  	 * @planes_changed: Planes on this crtc are updated. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  110  	 * helpers and drivers to steer the atomic commit control flow.
620eec75f35ce4 Daniel Vetter       2018-07-09  111  	 */
c2fcd274bce521 Daniel Vetter       2014-11-05  112  	bool planes_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  113  
620eec75f35ce4 Daniel Vetter       2018-07-09  114  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  115  	 * @mode_changed: @mode or @enable has been changed. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  116  	 * helpers and drivers to steer the atomic commit control flow. See also
620eec75f35ce4 Daniel Vetter       2018-07-09  117  	 * drm_atomic_crtc_needs_modeset().
620eec75f35ce4 Daniel Vetter       2018-07-09  118  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  119  	 * Drivers are supposed to set this for any CRTC state changes that
620eec75f35ce4 Daniel Vetter       2018-07-09  120  	 * require a full modeset. They can also reset it to false if e.g. a
620eec75f35ce4 Daniel Vetter       2018-07-09  121  	 * @mode change can be done without a full modeset by only changing
620eec75f35ce4 Daniel Vetter       2018-07-09  122  	 * scaler settings.
620eec75f35ce4 Daniel Vetter       2018-07-09  123  	 */
623369e533e8a5 Daniel Vetter       2014-09-16  124  	bool mode_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  125  
620eec75f35ce4 Daniel Vetter       2018-07-09  126  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  127  	 * @active_changed: @active has been toggled. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  128  	 * helpers and drivers to steer the atomic commit control flow. See also
620eec75f35ce4 Daniel Vetter       2018-07-09  129  	 * drm_atomic_crtc_needs_modeset().
620eec75f35ce4 Daniel Vetter       2018-07-09  130  	 */
eab3bbeffd1521 Daniel Vetter       2015-01-22  131  	bool active_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  132  
620eec75f35ce4 Daniel Vetter       2018-07-09  133  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  134  	 * @connectors_changed: Connectors to this crtc have been updated,
620eec75f35ce4 Daniel Vetter       2018-07-09  135  	 * either in their state or routing. Used by the atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  136  	 * helpers and drivers to steer the atomic commit control flow. See also
620eec75f35ce4 Daniel Vetter       2018-07-09  137  	 * drm_atomic_crtc_needs_modeset().
620eec75f35ce4 Daniel Vetter       2018-07-09  138  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  139  	 * Drivers are supposed to set this as-needed from their own atomic
620eec75f35ce4 Daniel Vetter       2018-07-09  140  	 * check code, e.g. from &drm_encoder_helper_funcs.atomic_check
620eec75f35ce4 Daniel Vetter       2018-07-09  141  	 */
fc596660dd4e83 Maarten Lankhorst   2015-07-21  142  	bool connectors_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  143  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  144  	 * @zpos_changed: zpos values of planes on this crtc have been updated.
620eec75f35ce4 Daniel Vetter       2018-07-09  145  	 * Used by the atomic helpers and drivers to steer the atomic commit
620eec75f35ce4 Daniel Vetter       2018-07-09  146  	 * control flow.
620eec75f35ce4 Daniel Vetter       2018-07-09  147  	 */
44d1240d006c9c Marek Szyprowski    2016-06-13  148  	bool zpos_changed : 1;
620eec75f35ce4 Daniel Vetter       2018-07-09  149  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  150  	 * @color_mgmt_changed: Color management properties have changed
620eec75f35ce4 Daniel Vetter       2018-07-09  151  	 * (@gamma_lut, @degamma_lut or @ctm). Used by the atomic helpers and
620eec75f35ce4 Daniel Vetter       2018-07-09  152  	 * drivers to steer the atomic commit control flow.
620eec75f35ce4 Daniel Vetter       2018-07-09  153  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  154  	bool color_mgmt_changed : 1;
623369e533e8a5 Daniel Vetter       2014-09-16  155  
b25c60af7a8773 Boris Brezillon     2018-07-03  156  	/**
b25c60af7a8773 Boris Brezillon     2018-07-03  157  	 * @no_vblank:
b25c60af7a8773 Boris Brezillon     2018-07-03  158  	 *
b25c60af7a8773 Boris Brezillon     2018-07-03  159  	 * Reflects the ability of a CRTC to send VBLANK events. This state
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  160  	 * usually depends on the pipeline configuration. If set to true, DRM
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  161  	 * atomic helpers will send out a fake VBLANK event during display
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  162  	 * updates after all hardware changes have been committed. This is
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  163  	 * implemented in drm_atomic_helper_fake_vblank().
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  164  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  165  	 * One usage is for drivers and/or hardware without support for VBLANK
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  166  	 * interrupts. Such drivers typically do not initialize vblanking
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  167  	 * (i.e., call drm_vblank_init() with the number of CRTCs). For CRTCs
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  168  	 * without initialized vblanking, this field is set to true in
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  169  	 * drm_atomic_helper_check_modeset(), and a fake VBLANK event will be
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  170  	 * send out on each update of the display pipeline by
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  171  	 * drm_atomic_helper_fake_vblank().
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  172  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  173  	 * Another usage is CRTCs feeding a writeback connector operating in
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  174  	 * oneshot mode. In this case the fake VBLANK event is only generated
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  175  	 * when a job is queued to the writeback connector, and we want the
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  176  	 * core to fake VBLANK events when this part of the pipeline hasn't
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  177  	 * changed but others had or when the CRTC and connectors are being
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  178  	 * disabled.
b25c60af7a8773 Boris Brezillon     2018-07-03  179  	 *
b25c60af7a8773 Boris Brezillon     2018-07-03  180  	 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
b25c60af7a8773 Boris Brezillon     2018-07-03  181  	 * from the current state, the CRTC driver is then responsible for
b25c60af7a8773 Boris Brezillon     2018-07-03  182  	 * updating this field when needed.
b25c60af7a8773 Boris Brezillon     2018-07-03  183  	 *
b25c60af7a8773 Boris Brezillon     2018-07-03  184  	 * Note that the combination of &drm_crtc_state.event == NULL and
b25c60af7a8773 Boris Brezillon     2018-07-03  185  	 * &drm_crtc_state.no_blank == true is valid and usually used when the
b25c60af7a8773 Boris Brezillon     2018-07-03  186  	 * writeback connector attached to the CRTC has a new job queued. In
b25c60af7a8773 Boris Brezillon     2018-07-03  187  	 * this case the driver will send the VBLANK event on its own when the
b25c60af7a8773 Boris Brezillon     2018-07-03  188  	 * writeback job is complete.
b25c60af7a8773 Boris Brezillon     2018-07-03  189  	 */
b25c60af7a8773 Boris Brezillon     2018-07-03  190  	bool no_vblank : 1;
b25c60af7a8773 Boris Brezillon     2018-07-03  191  
620eec75f35ce4 Daniel Vetter       2018-07-09  192  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  193  	 * @plane_mask: Bitmask of drm_plane_mask(plane) of planes attached to
620eec75f35ce4 Daniel Vetter       2018-07-09  194  	 * this CRTC.
6ddd388ab222b6 Rob Clark           2014-11-21  195  	 */
6ddd388ab222b6 Rob Clark           2014-11-21  196  	u32 plane_mask;
6ddd388ab222b6 Rob Clark           2014-11-21  197  
620eec75f35ce4 Daniel Vetter       2018-07-09  198  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  199  	 * @connector_mask: Bitmask of drm_connector_mask(connector) of
620eec75f35ce4 Daniel Vetter       2018-07-09  200  	 * connectors attached to this CRTC.
620eec75f35ce4 Daniel Vetter       2018-07-09  201  	 */
4cd9fa529d77dd Maarten Lankhorst   2016-01-04  202  	u32 connector_mask;
620eec75f35ce4 Daniel Vetter       2018-07-09  203  
620eec75f35ce4 Daniel Vetter       2018-07-09  204  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  205  	 * @encoder_mask: Bitmask of drm_encoder_mask(encoder) of encoders
620eec75f35ce4 Daniel Vetter       2018-07-09  206  	 * attached to this CRTC.
620eec75f35ce4 Daniel Vetter       2018-07-09  207  	 */
e87a52b3894360 Maarten Lankhorst   2016-01-28  208  	u32 encoder_mask;
4cd9fa529d77dd Maarten Lankhorst   2016-01-04  209  
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  210  	/**
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  211  	 * @adjusted_mode:
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  212  	 *
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  213  	 * Internal display timings which can be used by the driver to handle
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  214  	 * differences between the mode requested by userspace in @mode and what
584a0146ec4989 Philippe Cornu      2018-04-09  215  	 * is actually programmed into the hardware.
584a0146ec4989 Philippe Cornu      2018-04-09  216  	 *
620eec75f35ce4 Daniel Vetter       2018-07-09  217  	 * For drivers using &drm_bridge, this stores hardware display timings
584a0146ec4989 Philippe Cornu      2018-04-09  218  	 * used between the CRTC and the first bridge. For other drivers, the
584a0146ec4989 Philippe Cornu      2018-04-09  219  	 * meaning of the adjusted_mode field is purely driver implementation
584a0146ec4989 Philippe Cornu      2018-04-09  220  	 * defined information, and will usually be used to store the hardware
584a0146ec4989 Philippe Cornu      2018-04-09  221  	 * display timings used between the CRTC and encoder blocks.
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  222  	 */
2f324b42b7b24a Daniel Vetter       2014-10-29  223  	struct drm_display_mode adjusted_mode;
2f324b42b7b24a Daniel Vetter       2014-10-29  224  
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  225  	/**
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  226  	 * @mode:
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  227  	 *
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  228  	 * Display timings requested by userspace. The driver should try to
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  229  	 * match the refresh rate as close as possible (but note that it's
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  230  	 * undefined what exactly is close enough, e.g. some of the HDMI modes
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  231  	 * only differ in less than 1% of the refresh rate). The active width
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  232  	 * and height as observed by userspace for positioning planes must match
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  233  	 * exactly.
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  234  	 *
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  235  	 * For external connectors where the sink isn't fixed (like with a
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  236  	 * built-in panel), this mode here should match the physical mode on the
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  237  	 * wire to the last details (i.e. including sync polarities and
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  238  	 * everything).
9de5d4a61cc2a9 Daniel Vetter       2017-05-15  239  	 */
144ecb97cd57d2 Daniel Vetter       2014-10-27  240  	struct drm_display_mode mode;
144ecb97cd57d2 Daniel Vetter       2014-10-27  241  
620eec75f35ce4 Daniel Vetter       2018-07-09  242  	/**
620eec75f35ce4 Daniel Vetter       2018-07-09  243  	 * @mode_blob: &drm_property_blob for @mode, for exposing the mode to
620eec75f35ce4 Daniel Vetter       2018-07-09  244  	 * atomic userspace.
620eec75f35ce4 Daniel Vetter       2018-07-09  245  	 */
99cf4a29fa2446 Daniel Stone        2015-05-25  246  	struct drm_property_blob *mode_blob;
99cf4a29fa2446 Daniel Stone        2015-05-25  247  
2e38178e23e63b Daniel Vetter       2017-04-12  248  	/**
2e38178e23e63b Daniel Vetter       2017-04-12  249  	 * @degamma_lut:
2e38178e23e63b Daniel Vetter       2017-04-12  250  	 *
2e38178e23e63b Daniel Vetter       2017-04-12  251  	 * Lookup table for converting framebuffer pixel data before apply the
2e38178e23e63b Daniel Vetter       2017-04-12  252  	 * color conversion matrix @ctm. See drm_crtc_enable_color_mgmt(). The
2e38178e23e63b Daniel Vetter       2017-04-12  253  	 * blob (if not NULL) is an array of &struct drm_color_lut.
2e38178e23e63b Daniel Vetter       2017-04-12  254  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  255  	struct drm_property_blob *degamma_lut;
2e38178e23e63b Daniel Vetter       2017-04-12  256  
2e38178e23e63b Daniel Vetter       2017-04-12  257  	/**
2e38178e23e63b Daniel Vetter       2017-04-12  258  	 * @ctm:
2e38178e23e63b Daniel Vetter       2017-04-12  259  	 *
2e38178e23e63b Daniel Vetter       2017-04-12  260  	 * Color transformation matrix. See drm_crtc_enable_color_mgmt(). The
2e38178e23e63b Daniel Vetter       2017-04-12  261  	 * blob (if not NULL) is a &struct drm_color_ctm.
2e38178e23e63b Daniel Vetter       2017-04-12  262  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  263  	struct drm_property_blob *ctm;
2e38178e23e63b Daniel Vetter       2017-04-12  264  
2e38178e23e63b Daniel Vetter       2017-04-12  265  	/**
2e38178e23e63b Daniel Vetter       2017-04-12  266  	 * @gamma_lut:
2e38178e23e63b Daniel Vetter       2017-04-12  267  	 *
2e38178e23e63b Daniel Vetter       2017-04-12  268  	 * Lookup table for converting pixel data after the color conversion
2e38178e23e63b Daniel Vetter       2017-04-12  269  	 * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
2e38178e23e63b Daniel Vetter       2017-04-12  270  	 * NULL) is an array of &struct drm_color_lut.
4fd5e720b709b8 Daniel Vetter       2022-01-24  271  	 *
4fd5e720b709b8 Daniel Vetter       2022-01-24  272  	 * Note that for mostly historical reasons stemming from Xorg heritage,
4fd5e720b709b8 Daniel Vetter       2022-01-24  273  	 * this is also used to store the color map (also sometimes color lut,
4fd5e720b709b8 Daniel Vetter       2022-01-24  274  	 * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
2e38178e23e63b Daniel Vetter       2017-04-12  275  	 */
5488dc16fde745 Lionel Landwerlin   2016-02-26  276  	struct drm_property_blob *gamma_lut;
5488dc16fde745 Lionel Landwerlin   2016-02-26  277  
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  278  	/**
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  279  	 * @target_vblank:
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  280  	 *
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  281  	 * Target vertical blank period when a page flip
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  282  	 * should take effect.
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  283  	 */
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  284  	u32 target_vblank;
f869a6ecf25419 Andrey Grodzovsky   2017-01-06  285  
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  286  	/**
4d85f45c73a22b Daniel Vetter       2019-09-03  287  	 * @async_flip:
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  288  	 *
4d85f45c73a22b Daniel Vetter       2019-09-03  289  	 * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
4d85f45c73a22b Daniel Vetter       2019-09-03  290  	 * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL itself yet.
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  291  	 */
4d85f45c73a22b Daniel Vetter       2019-09-03  292  	bool async_flip;
6cbe5c466d7336 Andrey Grodzovsky   2017-02-02  293  
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  294  	/**
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  295  	 * @vrr_enabled:
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  296  	 *
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  297  	 * Indicates if variable refresh rate should be enabled for the CRTC.
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  298  	 * Support for the requested vrr state will depend on driver and
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  299  	 * hardware capabiltiy - lacking support is not treated as failure.
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  300  	 */
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  301  	bool vrr_enabled;
1398958cfd8d33 Nicholas Kazlauskas 2018-10-04  302  
1452c25b0e6027 Sean Paul           2019-06-12  303  	/**
1452c25b0e6027 Sean Paul           2019-06-12  304  	 * @self_refresh_active:
1452c25b0e6027 Sean Paul           2019-06-12  305  	 *
1452c25b0e6027 Sean Paul           2019-06-12  306  	 * Used by the self refresh helpers to denote when a self refresh
1452c25b0e6027 Sean Paul           2019-06-12  307  	 * transition is occurring. This will be set on enable/disable callbacks
1452c25b0e6027 Sean Paul           2019-06-12  308  	 * when self refresh is being enabled or disabled. In some cases, it may
1452c25b0e6027 Sean Paul           2019-06-12  309  	 * not be desirable to fully shut off the crtc during self refresh.
1452c25b0e6027 Sean Paul           2019-06-12  310  	 * CRTC's can inspect this flag and determine the best course of action.
1452c25b0e6027 Sean Paul           2019-06-12  311  	 */
1452c25b0e6027 Sean Paul           2019-06-12  312  	bool self_refresh_active;
1452c25b0e6027 Sean Paul           2019-06-12  313  
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  314  	/**
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  315  	 * @scaling_filter:
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  316  	 *
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  317  	 * Scaling filter to be applied
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  318  	 */
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  319  	enum drm_scaling_filter scaling_filter;
5c759eda9b04cd Pankaj Bharadiya    2020-10-20  320  
61802130d85fda Daniel Vetter       2016-09-30  321  	/**
61802130d85fda Daniel Vetter       2016-09-30  322  	 * @event:
61802130d85fda Daniel Vetter       2016-09-30  323  	 *
61802130d85fda Daniel Vetter       2016-09-30  324  	 * Optional pointer to a DRM event to signal upon completion of the
61802130d85fda Daniel Vetter       2016-09-30  325  	 * state update. The driver must send out the event when the atomic
61802130d85fda Daniel Vetter       2016-09-30  326  	 * commit operation completes. There are two cases:
61802130d85fda Daniel Vetter       2016-09-30  327  	 *
61802130d85fda Daniel Vetter       2016-09-30  328  	 *  - The event is for a CRTC which is being disabled through this
61802130d85fda Daniel Vetter       2016-09-30  329  	 *    atomic commit. In that case the event can be send out any time
61802130d85fda Daniel Vetter       2016-09-30  330  	 *    after the hardware has stopped scanning out the current
61802130d85fda Daniel Vetter       2016-09-30  331  	 *    framebuffers. It should contain the timestamp and counter for the
8938d13585bc91 Daniel Vetter       2017-05-24  332  	 *    last vblank before the display pipeline was shut off. The simplest
8938d13585bc91 Daniel Vetter       2017-05-24  333  	 *    way to achieve that is calling drm_crtc_send_vblank_event()
8938d13585bc91 Daniel Vetter       2017-05-24  334  	 *    somewhen after drm_crtc_vblank_off() has been called.
61802130d85fda Daniel Vetter       2016-09-30  335  	 *
61802130d85fda Daniel Vetter       2016-09-30  336  	 *  - For a CRTC which is enabled at the end of the commit (even when it
61802130d85fda Daniel Vetter       2016-09-30  337  	 *    undergoes an full modeset) the vblank timestamp and counter must
61802130d85fda Daniel Vetter       2016-09-30  338  	 *    be for the vblank right before the first frame that scans out the
61802130d85fda Daniel Vetter       2016-09-30  339  	 *    new set of buffers. Again the event can only be sent out after the
61802130d85fda Daniel Vetter       2016-09-30  340  	 *    hardware has stopped scanning out the old buffers.
61802130d85fda Daniel Vetter       2016-09-30  341  	 *
61802130d85fda Daniel Vetter       2016-09-30  342  	 *  - Events for disabled CRTCs are not allowed, and drivers can ignore
61802130d85fda Daniel Vetter       2016-09-30  343  	 *    that case.
61802130d85fda Daniel Vetter       2016-09-30  344  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  345  	 * For very simple hardware without VBLANK interrupt, enabling
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  346  	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  347  	 * send a fake VBLANK event at the end of the display update after all
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  348  	 * hardware changes have been applied. See
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  349  	 * drm_atomic_helper_fake_vblank().
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  350  	 *
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  351  	 * For more complex hardware this
7beb691f1e6f34 Thomas Zimmermann   2020-01-29  352  	 * can be handled by the drm_crtc_send_vblank_event() function,
61802130d85fda Daniel Vetter       2016-09-30  353  	 * which the driver should call on the provided event upon completion of
61802130d85fda Daniel Vetter       2016-09-30  354  	 * the atomic commit. Note that if the driver supports vblank signalling
61802130d85fda Daniel Vetter       2016-09-30  355  	 * and timestamping the vblank counters and timestamps must agree with
61802130d85fda Daniel Vetter       2016-09-30  356  	 * the ones returned from page flip events. With the current vblank
61802130d85fda Daniel Vetter       2016-09-30  357  	 * helper infrastructure this can be achieved by holding a vblank
61802130d85fda Daniel Vetter       2016-09-30  358  	 * reference while the page flip is pending, acquired through
61802130d85fda Daniel Vetter       2016-09-30  359  	 * drm_crtc_vblank_get() and released with drm_crtc_vblank_put().
61802130d85fda Daniel Vetter       2016-09-30  360  	 * Drivers are free to implement their own vblank counter and timestamp
61802130d85fda Daniel Vetter       2016-09-30  361  	 * tracking though, e.g. if they have accurate timestamp registers in
61802130d85fda Daniel Vetter       2016-09-30  362  	 * hardware.
61802130d85fda Daniel Vetter       2016-09-30  363  	 *
61802130d85fda Daniel Vetter       2016-09-30  364  	 * For hardware which supports some means to synchronize vblank
61802130d85fda Daniel Vetter       2016-09-30  365  	 * interrupt delivery with committing display state there's also
61802130d85fda Daniel Vetter       2016-09-30  366  	 * drm_crtc_arm_vblank_event(). See the documentation of that function
61802130d85fda Daniel Vetter       2016-09-30  367  	 * for a detailed discussion of the constraints it needs to be used
61802130d85fda Daniel Vetter       2016-09-30  368  	 * safely.
66f8c100039661 Daniel Vetter       2017-03-08  369  	 *
66f8c100039661 Daniel Vetter       2017-03-08  370  	 * If the device can't notify of flip completion in a race-free way
66f8c100039661 Daniel Vetter       2017-03-08  371  	 * at all, then the event should be armed just after the page flip is
66f8c100039661 Daniel Vetter       2017-03-08  372  	 * committed. In the worst case the driver will send the event to
66f8c100039661 Daniel Vetter       2017-03-08  373  	 * userspace one frame too late. This doesn't allow for a real atomic
66f8c100039661 Daniel Vetter       2017-03-08  374  	 * update, but it should avoid tearing.
61802130d85fda Daniel Vetter       2016-09-30  375  	 */
144ecb97cd57d2 Daniel Vetter       2014-10-27  376  	struct drm_pending_vblank_event *event;
144ecb97cd57d2 Daniel Vetter       2014-10-27  377  
163bcc2c74a22c Maarten Lankhorst   2017-09-04  378  	/**
163bcc2c74a22c Maarten Lankhorst   2017-09-04  379  	 * @commit:
163bcc2c74a22c Maarten Lankhorst   2017-09-04  380  	 *
163bcc2c74a22c Maarten Lankhorst   2017-09-04  381  	 * This tracks how the commit for this update proceeds through the
163bcc2c74a22c Maarten Lankhorst   2017-09-04  382  	 * various phases. This is never cleared, except when we destroy the
163bcc2c74a22c Maarten Lankhorst   2017-09-04  383  	 * state, so that subsequent commits can synchronize with previous ones.
163bcc2c74a22c Maarten Lankhorst   2017-09-04  384  	 */
163bcc2c74a22c Maarten Lankhorst   2017-09-04  385  	struct drm_crtc_commit *commit;
163bcc2c74a22c Maarten Lankhorst   2017-09-04  386  
620eec75f35ce4 Daniel Vetter       2018-07-09  387  	/** @state: backpointer to global drm_atomic_state */
144ecb97cd57d2 Daniel Vetter       2014-10-27  388  	struct drm_atomic_state *state;
c838ee8e68deff Lin Yujun           2024-02-04  389  
c838ee8e68deff Lin Yujun           2024-02-04  390  	KABI_RESERVE(1)
c838ee8e68deff Lin Yujun           2024-02-04  391  	KABI_RESERVE(2)
144ecb97cd57d2 Daniel Vetter       2014-10-27 @392  };
f453ba0460742a Dave Airlie         2008-11-07  393  

:::::: The code at line 392 was first introduced by commit
:::::: 144ecb97cd57d2a61cc455730a3337e413499cae drm: Add atomic driver interface definitions for objects

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

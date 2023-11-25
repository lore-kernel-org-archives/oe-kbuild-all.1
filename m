Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE0F9EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 20:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5mP9OQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700942449; x=1732478449;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=umzHWxq4FoDfUeGHxMo/d5QEqUjIqPQ1czenarQnv5o=;
  b=E5mP9OQD4YKdn5DcRnzjmJtU+EDrQc2RqjrD+1MwBr23DnMBACs1yrAW
   68O3jcGmRTsgQ1NkA/VP6yUyhjkMywZvAlS9eThKR1MyeZagckZ+U4k0M
   KcvmDBMx+j+rc7+TrO3JMBxTpM3aHt5fZnYf0ZNzX5iYKDWUZE3h64m0w
   UVsmS57uwABTg4ArF61NNRDT6msJyWbJTZEzDkhVEJyitTKOHdjcYuIUL
   JzIe5iK3rnLEtBo+voUlW0svxQGM6ZrA9LDUGkYmz9L8c0pxPLK2V3mCQ
   wtyXNhHfZBcY3VWLkmgfOaZVsLt/WJd+nhHoGY5s8++GR2+JoQX6ca6b3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="391398648"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="391398648"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 12:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="891332361"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="891332361"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2023 12:00:46 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6ypY-0004Mk-25;
	Sat, 25 Nov 2023 20:00:44 +0000
Date: Sun, 26 Nov 2023 04:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 2299/2351] htmldocs:
 ./include/drm/drm_plane.h:795: warning: Function parameter or member
 'ctm_property' not described in 'drm_plane'
Message-ID: <202311260217.r85V8B1V-lkp@intel.com>
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
commit: f07348f59d071b4449b7714d8d8deee77bc5e56a [2299/2351] drm: Add Plane CTM property
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260217.r85V8B1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260217.r85V8B1V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_plane.h:795: warning: Function parameter or member 'ctm_property' not described in 'drm_plane'

vim +795 ./include/drm/drm_plane.h

43968d7b806d7a Daniel Vetter     2016-09-21  607  
43968d7b806d7a Daniel Vetter     2016-09-21  608  
43968d7b806d7a Daniel Vetter     2016-09-21  609  /**
43968d7b806d7a Daniel Vetter     2016-09-21  610   * struct drm_plane - central DRM plane control structure
268bc24e861efd Daniel Vetter     2018-07-09  611   *
268bc24e861efd Daniel Vetter     2018-07-09  612   * Planes represent the scanout hardware of a display block. They receive their
268bc24e861efd Daniel Vetter     2018-07-09  613   * input data from a &drm_framebuffer and feed it to a &drm_crtc. Planes control
268bc24e861efd Daniel Vetter     2018-07-09  614   * the color conversion, see `Plane Composition Properties`_ for more details,
268bc24e861efd Daniel Vetter     2018-07-09  615   * and are also involved in the color conversion of input pixels, see `Color
268bc24e861efd Daniel Vetter     2018-07-09  616   * Management Properties`_ for details on that.
43968d7b806d7a Daniel Vetter     2016-09-21  617   */
43968d7b806d7a Daniel Vetter     2016-09-21  618  struct drm_plane {
268bc24e861efd Daniel Vetter     2018-07-09  619  	/** @dev: DRM device this plane belongs to */
43968d7b806d7a Daniel Vetter     2016-09-21  620  	struct drm_device *dev;
268bc24e861efd Daniel Vetter     2018-07-09  621  
268bc24e861efd Daniel Vetter     2018-07-09  622  	/**
268bc24e861efd Daniel Vetter     2018-07-09  623  	 * @head:
268bc24e861efd Daniel Vetter     2018-07-09  624  	 *
268bc24e861efd Daniel Vetter     2018-07-09  625  	 * List of all planes on @dev, linked from &drm_mode_config.plane_list.
268bc24e861efd Daniel Vetter     2018-07-09  626  	 * Invariant over the lifetime of @dev and therefore does not need
268bc24e861efd Daniel Vetter     2018-07-09  627  	 * locking.
268bc24e861efd Daniel Vetter     2018-07-09  628  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  629  	struct list_head head;
43968d7b806d7a Daniel Vetter     2016-09-21  630  
268bc24e861efd Daniel Vetter     2018-07-09  631  	/** @name: human readable name, can be overwritten by the driver */
43968d7b806d7a Daniel Vetter     2016-09-21  632  	char *name;
43968d7b806d7a Daniel Vetter     2016-09-21  633  
43968d7b806d7a Daniel Vetter     2016-09-21  634  	/**
43968d7b806d7a Daniel Vetter     2016-09-21  635  	 * @mutex:
43968d7b806d7a Daniel Vetter     2016-09-21  636  	 *
d574528a64c3a3 Daniel Vetter     2017-01-25  637  	 * Protects modeset plane state, together with the &drm_crtc.mutex of
d574528a64c3a3 Daniel Vetter     2017-01-25  638  	 * CRTC this plane is linked to (when active, getting activated or
d574528a64c3a3 Daniel Vetter     2017-01-25  639  	 * getting disabled).
c9e42b72b44acc Daniel Vetter     2017-03-28  640  	 *
c9e42b72b44acc Daniel Vetter     2017-03-28  641  	 * For atomic drivers specifically this protects @state.
43968d7b806d7a Daniel Vetter     2016-09-21  642  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  643  	struct drm_modeset_lock mutex;
43968d7b806d7a Daniel Vetter     2016-09-21  644  
268bc24e861efd Daniel Vetter     2018-07-09  645  	/** @base: base mode object */
43968d7b806d7a Daniel Vetter     2016-09-21  646  	struct drm_mode_object base;
43968d7b806d7a Daniel Vetter     2016-09-21  647  
268bc24e861efd Daniel Vetter     2018-07-09  648  	/**
268bc24e861efd Daniel Vetter     2018-07-09  649  	 * @possible_crtcs: pipes this plane can be bound to constructed from
268bc24e861efd Daniel Vetter     2018-07-09  650  	 * drm_crtc_mask()
268bc24e861efd Daniel Vetter     2018-07-09  651  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  652  	uint32_t possible_crtcs;
268bc24e861efd Daniel Vetter     2018-07-09  653  	/** @format_types: array of formats supported by this plane */
43968d7b806d7a Daniel Vetter     2016-09-21  654  	uint32_t *format_types;
268bc24e861efd Daniel Vetter     2018-07-09  655  	/** @format_count: Size of the array pointed at by @format_types. */
43968d7b806d7a Daniel Vetter     2016-09-21  656  	unsigned int format_count;
268bc24e861efd Daniel Vetter     2018-07-09  657  	/**
268bc24e861efd Daniel Vetter     2018-07-09  658  	 * @format_default: driver hasn't supplied supported formats for the
7221941c4f3249 Thomas Zimmermann 2022-09-09  659  	 * plane. Used by the non-atomic driver compatibility wrapper only.
268bc24e861efd Daniel Vetter     2018-07-09  660  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  661  	bool format_default;
43968d7b806d7a Daniel Vetter     2016-09-21  662  
268bc24e861efd Daniel Vetter     2018-07-09  663  	/** @modifiers: array of modifiers supported by this plane */
e6fc3b68558e4c Ben Widawsky      2017-07-23  664  	uint64_t *modifiers;
268bc24e861efd Daniel Vetter     2018-07-09  665  	/** @modifier_count: Size of the array pointed at by @modifier_count. */
e6fc3b68558e4c Ben Widawsky      2017-07-23  666  	unsigned int modifier_count;
e6fc3b68558e4c Ben Widawsky      2017-07-23  667  
2e2b96ef7a9b71 Daniel Vetter     2017-11-08  668  	/**
268bc24e861efd Daniel Vetter     2018-07-09  669  	 * @crtc:
268bc24e861efd Daniel Vetter     2018-07-09  670  	 *
268bc24e861efd Daniel Vetter     2018-07-09  671  	 * Currently bound CRTC, only meaningful for non-atomic drivers. For
268bc24e861efd Daniel Vetter     2018-07-09  672  	 * atomic drivers this is forced to be NULL, atomic drivers should
268bc24e861efd Daniel Vetter     2018-07-09  673  	 * instead check &drm_plane_state.crtc.
2e2b96ef7a9b71 Daniel Vetter     2017-11-08  674  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  675  	struct drm_crtc *crtc;
2e2b96ef7a9b71 Daniel Vetter     2017-11-08  676  
2e2b96ef7a9b71 Daniel Vetter     2017-11-08  677  	/**
268bc24e861efd Daniel Vetter     2018-07-09  678  	 * @fb:
268bc24e861efd Daniel Vetter     2018-07-09  679  	 *
268bc24e861efd Daniel Vetter     2018-07-09  680  	 * Currently bound framebuffer, only meaningful for non-atomic drivers.
268bc24e861efd Daniel Vetter     2018-07-09  681  	 * For atomic drivers this is forced to be NULL, atomic drivers should
268bc24e861efd Daniel Vetter     2018-07-09  682  	 * instead check &drm_plane_state.fb.
2e2b96ef7a9b71 Daniel Vetter     2017-11-08  683  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  684  	struct drm_framebuffer *fb;
43968d7b806d7a Daniel Vetter     2016-09-21  685  
268bc24e861efd Daniel Vetter     2018-07-09  686  	/**
268bc24e861efd Daniel Vetter     2018-07-09  687  	 * @old_fb:
268bc24e861efd Daniel Vetter     2018-07-09  688  	 *
268bc24e861efd Daniel Vetter     2018-07-09  689  	 * Temporary tracking of the old fb while a modeset is ongoing. Only
268bc24e861efd Daniel Vetter     2018-07-09  690  	 * used by non-atomic drivers, forced to be NULL for atomic drivers.
268bc24e861efd Daniel Vetter     2018-07-09  691  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  692  	struct drm_framebuffer *old_fb;
43968d7b806d7a Daniel Vetter     2016-09-21  693  
268bc24e861efd Daniel Vetter     2018-07-09  694  	/** @funcs: plane control functions */
43968d7b806d7a Daniel Vetter     2016-09-21  695  	const struct drm_plane_funcs *funcs;
43968d7b806d7a Daniel Vetter     2016-09-21  696  
268bc24e861efd Daniel Vetter     2018-07-09  697  	/** @properties: property tracking for this plane */
43968d7b806d7a Daniel Vetter     2016-09-21  698  	struct drm_object_properties properties;
43968d7b806d7a Daniel Vetter     2016-09-21  699  
268bc24e861efd Daniel Vetter     2018-07-09  700  	/** @type: Type of plane, see &enum drm_plane_type for details. */
43968d7b806d7a Daniel Vetter     2016-09-21  701  	enum drm_plane_type type;
43968d7b806d7a Daniel Vetter     2016-09-21  702  
43968d7b806d7a Daniel Vetter     2016-09-21  703  	/**
43968d7b806d7a Daniel Vetter     2016-09-21  704  	 * @index: Position inside the mode_config.list, can be used as an array
43968d7b806d7a Daniel Vetter     2016-09-21  705  	 * index. It is invariant over the lifetime of the plane.
43968d7b806d7a Daniel Vetter     2016-09-21  706  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  707  	unsigned index;
43968d7b806d7a Daniel Vetter     2016-09-21  708  
268bc24e861efd Daniel Vetter     2018-07-09  709  	/** @helper_private: mid-layer private data */
43968d7b806d7a Daniel Vetter     2016-09-21  710  	const struct drm_plane_helper_funcs *helper_private;
43968d7b806d7a Daniel Vetter     2016-09-21  711  
c9e42b72b44acc Daniel Vetter     2017-03-28  712  	/**
c9e42b72b44acc Daniel Vetter     2017-03-28  713  	 * @state:
c9e42b72b44acc Daniel Vetter     2017-03-28  714  	 *
c9e42b72b44acc Daniel Vetter     2017-03-28  715  	 * Current atomic state for this plane.
c9e42b72b44acc Daniel Vetter     2017-03-28  716  	 *
c9e42b72b44acc Daniel Vetter     2017-03-28  717  	 * This is protected by @mutex. Note that nonblocking atomic commits
c9e42b72b44acc Daniel Vetter     2017-03-28  718  	 * access the current plane state without taking locks. Either by going
c9e42b72b44acc Daniel Vetter     2017-03-28  719  	 * through the &struct drm_atomic_state pointers, see
77ac3b00b13185 Maarten Lankhorst 2017-07-19  720  	 * for_each_oldnew_plane_in_state(), for_each_old_plane_in_state() and
77ac3b00b13185 Maarten Lankhorst 2017-07-19  721  	 * for_each_new_plane_in_state(). Or through careful ordering of atomic
77ac3b00b13185 Maarten Lankhorst 2017-07-19  722  	 * commit operations as implemented in the atomic helpers, see
77ac3b00b13185 Maarten Lankhorst 2017-07-19  723  	 * &struct drm_crtc_commit.
c9e42b72b44acc Daniel Vetter     2017-03-28  724  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  725  	struct drm_plane_state *state;
43968d7b806d7a Daniel Vetter     2016-09-21  726  
268bc24e861efd Daniel Vetter     2018-07-09  727  	/**
268bc24e861efd Daniel Vetter     2018-07-09  728  	 * @alpha_property:
268bc24e861efd Daniel Vetter     2018-07-09  729  	 * Optional alpha property for this plane. See
268bc24e861efd Daniel Vetter     2018-07-09  730  	 * drm_plane_create_alpha_property().
268bc24e861efd Daniel Vetter     2018-07-09  731  	 */
ae0e28265e216d Maxime Ripard     2018-04-11  732  	struct drm_property *alpha_property;
268bc24e861efd Daniel Vetter     2018-07-09  733  	/**
268bc24e861efd Daniel Vetter     2018-07-09  734  	 * @zpos_property:
268bc24e861efd Daniel Vetter     2018-07-09  735  	 * Optional zpos property for this plane. See
268bc24e861efd Daniel Vetter     2018-07-09  736  	 * drm_plane_create_zpos_property().
268bc24e861efd Daniel Vetter     2018-07-09  737  	 */
43968d7b806d7a Daniel Vetter     2016-09-21  738  	struct drm_property *zpos_property;
268bc24e861efd Daniel Vetter     2018-07-09  739  	/**
268bc24e861efd Daniel Vetter     2018-07-09  740  	 * @rotation_property:
268bc24e861efd Daniel Vetter     2018-07-09  741  	 * Optional rotation property for this plane. See
268bc24e861efd Daniel Vetter     2018-07-09  742  	 * drm_plane_create_rotation_property().
268bc24e861efd Daniel Vetter     2018-07-09  743  	 */
d138dd3c0c7097 Ville Syrjälä     2016-09-26  744  	struct drm_property *rotation_property;
a5ec8332d42805 Lowry Li          2018-08-23  745  	/**
a5ec8332d42805 Lowry Li          2018-08-23  746  	 * @blend_mode_property:
a5ec8332d42805 Lowry Li          2018-08-23  747  	 * Optional "pixel blend mode" enum property for this plane.
a5ec8332d42805 Lowry Li          2018-08-23  748  	 * Blend mode property represents the alpha blending equation selection,
a5ec8332d42805 Lowry Li          2018-08-23  749  	 * describing how the pixels from the current plane are composited with
a5ec8332d42805 Lowry Li          2018-08-23  750  	 * the background.
a5ec8332d42805 Lowry Li          2018-08-23  751  	 */
a5ec8332d42805 Lowry Li          2018-08-23  752  	struct drm_property *blend_mode_property;
80f690e9e3a60f Jyri Sarha        2018-02-19  753  
80f690e9e3a60f Jyri Sarha        2018-02-19  754  	/**
80f690e9e3a60f Jyri Sarha        2018-02-19  755  	 * @color_encoding_property:
80f690e9e3a60f Jyri Sarha        2018-02-19  756  	 *
80f690e9e3a60f Jyri Sarha        2018-02-19  757  	 * Optional "COLOR_ENCODING" enum property for specifying
80f690e9e3a60f Jyri Sarha        2018-02-19  758  	 * color encoding for non RGB formats.
80f690e9e3a60f Jyri Sarha        2018-02-19  759  	 * See drm_plane_create_color_properties().
80f690e9e3a60f Jyri Sarha        2018-02-19  760  	 */
80f690e9e3a60f Jyri Sarha        2018-02-19  761  	struct drm_property *color_encoding_property;
80f690e9e3a60f Jyri Sarha        2018-02-19  762  	/**
80f690e9e3a60f Jyri Sarha        2018-02-19  763  	 * @color_range_property:
80f690e9e3a60f Jyri Sarha        2018-02-19  764  	 *
80f690e9e3a60f Jyri Sarha        2018-02-19  765  	 * Optional "COLOR_RANGE" enum property for specifying
80f690e9e3a60f Jyri Sarha        2018-02-19  766  	 * color range for non RGB formats.
80f690e9e3a60f Jyri Sarha        2018-02-19  767  	 * See drm_plane_create_color_properties().
80f690e9e3a60f Jyri Sarha        2018-02-19  768  	 */
80f690e9e3a60f Jyri Sarha        2018-02-19  769  	struct drm_property *color_range_property;
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  770  
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  771  	/**
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  772  	 * @scaling_filter_property: property to apply a particular filter while
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  773  	 * scaling.
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  774  	 */
5c759eda9b04cd Pankaj Bharadiya  2020-10-20  775  	struct drm_property *scaling_filter_property;
f526f2c449aa3f Uma Shankar       2023-04-18  776  
f526f2c449aa3f Uma Shankar       2023-04-18  777  	/**
f526f2c449aa3f Uma Shankar       2023-04-18  778  	 * @degamma_mode_property: Optional Plane property to set the LUT
f526f2c449aa3f Uma Shankar       2023-04-18  779  	 * used to convert the framebuffer's colors to linear gamma.
f526f2c449aa3f Uma Shankar       2023-04-18  780  	 */
f526f2c449aa3f Uma Shankar       2023-04-18  781  	struct drm_property *degamma_mode_property;
d533f37e420d6d Uma Shankar       2023-04-18  782  
d533f37e420d6d Uma Shankar       2023-04-18  783  	/**
d533f37e420d6d Uma Shankar       2023-04-18  784  	 * @degamma_lut_property: Optional Plane property to set the LUT
d533f37e420d6d Uma Shankar       2023-04-18  785  	 * used to convert the framebuffer's colors to linear gamma.
d533f37e420d6d Uma Shankar       2023-04-18  786  	 */
d533f37e420d6d Uma Shankar       2023-04-18  787  	struct drm_property *degamma_lut_property;
f07348f59d071b Uma Shankar       2023-04-18  788  
f07348f59d071b Uma Shankar       2023-04-18  789  	/**
f07348f59d071b Uma Shankar       2023-04-18  790  	 * @plane_ctm_property: Optional Plane property to set the
f07348f59d071b Uma Shankar       2023-04-18  791  	 * matrix used to convert colors after the lookup in the
f07348f59d071b Uma Shankar       2023-04-18  792  	 * degamma LUT.
f07348f59d071b Uma Shankar       2023-04-18  793  	 */
f07348f59d071b Uma Shankar       2023-04-18  794  	struct drm_property *ctm_property;
43968d7b806d7a Daniel Vetter     2016-09-21 @795  };
43968d7b806d7a Daniel Vetter     2016-09-21  796  

:::::: The code at line 795 was first introduced by commit
:::::: 43968d7b806d7a7e021261294c583a216fddf0e5 drm: Extract drm_plane.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

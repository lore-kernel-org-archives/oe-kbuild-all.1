Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718A274FEF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 23:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757114746; cv=none; b=WzN4LJJsgNQj9CpLJcU3DOvXNQkfOKqapEz86uib1SP4fAtTLKCMNNL1UL6IC/ElOb42KPVGeDQFGMbYGqHe8+IrkpSXHtcXrhUuuws+B7xVpmLjtjF6IIENPmvZ0S9RN4PfFYsV/zVth9e3yNkDHDYlWKzTS5uxn7cFsEHLkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757114746; c=relaxed/simple;
	bh=m2fhz+Eal384mlE5PhiLiZEUf/mX7IZAWQozJgqo4rY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=burr3UEblkyyOtPSGvjWEUsTh55almMhv/8l2xfUpdjhkXs3n7kZhQED05IYC5rJbR0+SCSvZie4QeNvMgSsZoPWN/ZhJBkenYwpJvwXveiijjf/6binFaywD6gdoKUvtpafNisH7VVyj1WEe6ZetvmrNiSkiWFn6fgM3NmDuJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEXJjhqS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEXJjhqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757114745; x=1788650745;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m2fhz+Eal384mlE5PhiLiZEUf/mX7IZAWQozJgqo4rY=;
  b=gEXJjhqS4+w6/ulO/Ws9bY5NBgnSpzJcFGKC9EZVlOIwJIR+1aGMkLyq
   s+xDS/i+CstgRJ32gAgHiKKfVHR7RMx0ujc6ay2wknV4w/5ixA5OUwRyA
   R98FgVNTnx33L8Mp2eUDagLQ/TzY1G/rnJP4Xk7W6ld3qApugEn2gfM4p
   QVLhUNvoHy1coSxfaGL7QCNFU+15AmWhSDpyphScnknTKZ0KpF34ynw7U
   fV/t0VG6UUGa31boI9mcpXoqIRf0UmJsNnBDIRZd9oeWNWba17zbhFPFT
   W15k7pet9b/8oaMFUSHVPXMBJICi+xsb49uNcZNooaUwPyRIsV3ycauuY
   Q==;
X-CSE-ConnectionGUID: N3Gpg6oqRguQZUo/ILXLsQ==
X-CSE-MsgGUID: pONzywTiS7eHrzhW+Dc/xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59407253"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="59407253"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 16:25:44 -0700
X-CSE-ConnectionGUID: TXS9lvYLRHmuHazbg4/8dA==
X-CSE-MsgGUID: B5BI/+IlQy6pNKOfBby1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="176362896"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2025 16:25:42 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uufoK-00044l-1B;
	Fri, 05 Sep 2025 23:25:40 +0000
Date: Sat, 6 Sep 2025 01:24:41 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] htmldocs:
 ./include/drm/drm_framebuffer.h:209: warning: Excess struct member
 'internal_flags' description in 'drm_framebuffer'
Message-ID: <202509060124.aE8l5v2H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d9542e0aea649e8b834c5281ee2996503f8110fb
commit: c5058bfb5bf2e1dab569caab2f5d6ca5f072ac0e [2/2] ANDROID: drm: fixup ABI break in struct drm_framebuffer
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509060124.aE8l5v2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060124.aE8l5v2H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/pipe_fs_i.h
   Error: Cannot open file ./include/linux/backlight.h
   Error: Cannot open file ./include/linux/backlight.h
   ./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:          * @fbdev_probe
   ./include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fbdev_probe' not described in 'drm_driver'
>> ./include/drm/drm_framebuffer.h:209: warning: Excess struct member 'internal_flags' description in 'drm_framebuffer'
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   ./include/drm/drm_bridge.h:861: warning: Excess struct member 'support_hdcp' description in 'drm_bridge'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h


vim +209 ./include/drm/drm_framebuffer.h

33c125be18de97 Carlos Llamas      2025-09-04  105  
750fb8c439bcaa Simona Vetter      2016-08-12  106  /**
750fb8c439bcaa Simona Vetter      2016-08-12  107   * struct drm_framebuffer - frame buffer object
750fb8c439bcaa Simona Vetter      2016-08-12  108   *
7520a277d97be6 Simona Vetter      2016-08-15  109   * Note that the fb is refcounted for the benefit of driver internals,
7520a277d97be6 Simona Vetter      2016-08-15  110   * for example some hw, disabling a CRTC/plane is asynchronous, and
7520a277d97be6 Simona Vetter      2016-08-15  111   * scanout does not actually complete until the next vblank.  So some
7520a277d97be6 Simona Vetter      2016-08-15  112   * cleanup (like releasing the reference(s) on the backing GEM bo(s))
7520a277d97be6 Simona Vetter      2016-08-15  113   * should be deferred.  In cases like this, the driver would like to
7520a277d97be6 Simona Vetter      2016-08-15  114   * hold a ref to the fb even though it has already been removed from
a4a69da06bc11a Thierry Reding     2017-02-28  115   * userspace perspective. See drm_framebuffer_get() and
a4a69da06bc11a Thierry Reding     2017-02-28  116   * drm_framebuffer_put().
750fb8c439bcaa Simona Vetter      2016-08-12  117   *
750fb8c439bcaa Simona Vetter      2016-08-12  118   * The refcount is stored inside the mode object @base.
7520a277d97be6 Simona Vetter      2016-08-15  119   */
750fb8c439bcaa Simona Vetter      2016-08-12  120  struct drm_framebuffer {
750fb8c439bcaa Simona Vetter      2016-08-12  121  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  122  	 * @dev: DRM device this framebuffer belongs to
750fb8c439bcaa Simona Vetter      2016-08-12  123  	 */
750fb8c439bcaa Simona Vetter      2016-08-12  124  	struct drm_device *dev;
750fb8c439bcaa Simona Vetter      2016-08-12  125  	/**
d574528a64c3a3 Simona Vetter      2017-01-25  126  	 * @head: Place on the &drm_mode_config.fb_list, access protected by
d574528a64c3a3 Simona Vetter      2017-01-25  127  	 * &drm_mode_config.fb_lock.
7520a277d97be6 Simona Vetter      2016-08-15  128  	 */
7520a277d97be6 Simona Vetter      2016-08-15  129  	struct list_head head;
750fb8c439bcaa Simona Vetter      2016-08-12  130  
750fb8c439bcaa Simona Vetter      2016-08-12  131  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  132  	 * @base: base modeset object structure, contains the reference count.
750fb8c439bcaa Simona Vetter      2016-08-12  133  	 */
7520a277d97be6 Simona Vetter      2016-08-15  134  	struct drm_mode_object base;
8d44e9e69aacec Maarten Lankhorst  2017-12-20  135  
8d44e9e69aacec Maarten Lankhorst  2017-12-20  136  	/**
8d44e9e69aacec Maarten Lankhorst  2017-12-20  137  	 * @comm: Name of the process allocating the fb, used for fb dumping.
8d44e9e69aacec Maarten Lankhorst  2017-12-20  138  	 */
8d44e9e69aacec Maarten Lankhorst  2017-12-20  139  	char comm[TASK_COMM_LEN];
8d44e9e69aacec Maarten Lankhorst  2017-12-20  140  
e14c23c647abfc Ville Syrjälä      2016-11-18  141  	/**
e14c23c647abfc Ville Syrjälä      2016-11-18  142  	 * @format: framebuffer format information
e14c23c647abfc Ville Syrjälä      2016-11-18  143  	 */
e14c23c647abfc Ville Syrjälä      2016-11-18  144  	const struct drm_format_info *format;
750fb8c439bcaa Simona Vetter      2016-08-12  145  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  146  	 * @funcs: framebuffer vfunc table
750fb8c439bcaa Simona Vetter      2016-08-12  147  	 */
7520a277d97be6 Simona Vetter      2016-08-15  148  	const struct drm_framebuffer_funcs *funcs;
750fb8c439bcaa Simona Vetter      2016-08-12  149  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  150  	 * @pitches: Line stride per buffer. For userspace created object this
750fb8c439bcaa Simona Vetter      2016-08-12  151  	 * is copied from drm_mode_fb_cmd2.
750fb8c439bcaa Simona Vetter      2016-08-12  152  	 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30  153  	unsigned int pitches[DRM_FORMAT_MAX_PLANES];
750fb8c439bcaa Simona Vetter      2016-08-12  154  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  155  	 * @offsets: Offset from buffer start to the actual pixel data in bytes,
750fb8c439bcaa Simona Vetter      2016-08-12  156  	 * per buffer. For userspace created object this is copied from
750fb8c439bcaa Simona Vetter      2016-08-12  157  	 * drm_mode_fb_cmd2.
750fb8c439bcaa Simona Vetter      2016-08-12  158  	 *
750fb8c439bcaa Simona Vetter      2016-08-12  159  	 * Note that this is a linear offset and does not take into account
6de745238aa305 Geert Uytterhoeven 2022-07-06  160  	 * tiling or buffer layout per @modifier. It is meant to be used when
6de745238aa305 Geert Uytterhoeven 2022-07-06  161  	 * the actual pixel data for this framebuffer plane starts at an offset,
750fb8c439bcaa Simona Vetter      2016-08-12  162  	 * e.g. when multiple planes are allocated within the same backing
6de745238aa305 Geert Uytterhoeven 2022-07-06  163  	 * storage buffer object. For tiled layouts this generally means its
750fb8c439bcaa Simona Vetter      2016-08-12  164  	 * @offsets must at least be tile-size aligned, but hardware often has
750fb8c439bcaa Simona Vetter      2016-08-12  165  	 * stricter requirements.
750fb8c439bcaa Simona Vetter      2016-08-12  166  	 *
750fb8c439bcaa Simona Vetter      2016-08-12  167  	 * This should not be used to specifiy x/y pixel offsets into the buffer
750fb8c439bcaa Simona Vetter      2016-08-12  168  	 * data (even for linear buffers). Specifying an x/y pixel offset is
ea0dd85a75f151 Simona Vetter      2016-12-29  169  	 * instead done through the source rectangle in &struct drm_plane_state.
750fb8c439bcaa Simona Vetter      2016-08-12  170  	 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30  171  	unsigned int offsets[DRM_FORMAT_MAX_PLANES];
750fb8c439bcaa Simona Vetter      2016-08-12  172  	/**
bae781b2592695 Ville Syrjälä      2016-11-16  173  	 * @modifier: Data layout modifier. This is used to describe
750fb8c439bcaa Simona Vetter      2016-08-12  174  	 * tiling, or also special layouts (like compression) of auxiliary
750fb8c439bcaa Simona Vetter      2016-08-12  175  	 * buffers. For userspace created object this is copied from
750fb8c439bcaa Simona Vetter      2016-08-12  176  	 * drm_mode_fb_cmd2.
750fb8c439bcaa Simona Vetter      2016-08-12  177  	 */
bae781b2592695 Ville Syrjälä      2016-11-16  178  	uint64_t modifier;
750fb8c439bcaa Simona Vetter      2016-08-12  179  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  180  	 * @width: Logical width of the visible area of the framebuffer, in
750fb8c439bcaa Simona Vetter      2016-08-12  181  	 * pixels.
750fb8c439bcaa Simona Vetter      2016-08-12  182  	 */
7520a277d97be6 Simona Vetter      2016-08-15  183  	unsigned int width;
750fb8c439bcaa Simona Vetter      2016-08-12  184  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  185  	 * @height: Logical height of the visible area of the framebuffer, in
750fb8c439bcaa Simona Vetter      2016-08-12  186  	 * pixels.
750fb8c439bcaa Simona Vetter      2016-08-12  187  	 */
7520a277d97be6 Simona Vetter      2016-08-15  188  	unsigned int height;
750fb8c439bcaa Simona Vetter      2016-08-12  189  	/**
750fb8c439bcaa Simona Vetter      2016-08-12  190  	 * @flags: Framebuffer flags like DRM_MODE_FB_INTERLACED or
750fb8c439bcaa Simona Vetter      2016-08-12  191  	 * DRM_MODE_FB_MODIFIERS.
750fb8c439bcaa Simona Vetter      2016-08-12  192  	 */
7520a277d97be6 Simona Vetter      2016-08-15  193  	int flags;
33c125be18de97 Carlos Llamas      2025-09-04  194  	/**
33c125be18de97 Carlos Llamas      2025-09-04  195  	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
33c125be18de97 Carlos Llamas      2025-09-04  196  	 */
c5058bfb5bf2e1 Carlos Llamas      2025-09-04  197  	ANDROID_KABI_IGNORE(0, unsigned int internal_flags);
750fb8c439bcaa Simona Vetter      2016-08-12  198  	/**
d574528a64c3a3 Simona Vetter      2017-01-25  199  	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
750fb8c439bcaa Simona Vetter      2016-08-12  200  	 */
7520a277d97be6 Simona Vetter      2016-08-15  201  	struct list_head filp_head;
4c3dbb2c312c9f Noralf Trønnes     2017-08-13  202  	/**
4c3dbb2c312c9f Noralf Trønnes     2017-08-13  203  	 * @obj: GEM objects backing the framebuffer, one per plane (optional).
4c3dbb2c312c9f Noralf Trønnes     2017-08-13  204  	 *
4c3dbb2c312c9f Noralf Trønnes     2017-08-13  205  	 * This is used by the GEM framebuffer helpers, see e.g.
4c3dbb2c312c9f Noralf Trønnes     2017-08-13  206  	 * drm_gem_fb_create().
4c3dbb2c312c9f Noralf Trønnes     2017-08-13  207  	 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30  208  	struct drm_gem_object *obj[DRM_FORMAT_MAX_PLANES];
7520a277d97be6 Simona Vetter      2016-08-15 @209  };
7520a277d97be6 Simona Vetter      2016-08-15  210  

:::::: The code at line 209 was first introduced by commit
:::::: 7520a277d97be6e8a8ec038bb5ed01f40d4f9aeb drm: Extract drm_framebuffer.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

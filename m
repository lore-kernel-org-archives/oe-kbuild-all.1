Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00931A56C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408659; cv=none; b=hH04eDqUbTgOCfKUXrdGw4F9P+Wv8JbYM1HcK433JBWI5/ssCNC+CjBLSK3wHAps5S/+xU8pDCKmgq0mZ2jN1pVl7oHUrmUSTHlLxHmQnSlIA35SiLE9oHbWJA7pB8YJ0lvuc7dCS4/ri3n+0taj+fptoxzA+uhxTz+HOmGTXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408659; c=relaxed/simple;
	bh=zKx4O2qPMcKyOXCmjm1zBlKmDaI6+XPbKgOJTHIU3Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQLSirDSi5Pzpav75YYmBgLdRV6P7bcMhUtq4ATv4HyoKgaBy1H2Ue80PmIYSGyuQfqiOxu/F56+6djYLycQuXSM+d/Sv8YYopknF+GvQPn1yd+cHUss4b+klr6/N/UEwPlM5UMAfxU9W8F8Bt5M/Qh3PixdTX85MDPAJ6dK0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O988ba8E; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O988ba8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765408658; x=1796944658;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zKx4O2qPMcKyOXCmjm1zBlKmDaI6+XPbKgOJTHIU3Fo=;
  b=O988ba8EUZFvj6TZMz51PqMKcGMMMZGf1pgfU2vVtKHJH8O6pS9F2HA6
   DUXq9B864vgLORCArbEvgmdwgSPMoDc2aLU3SyUKiriQQeaDOjKNzJY12
   wVdfnQcL3mqRsCQe3XY5aFvYY5IbEZ7U75hQ8ILaUlcfypGnyEvHPPc2J
   WOERPkGu3rXB3tkK3aeGZlOW529cfBGzVRkrhpBv6fn8+BOsxAEU2teTd
   aXxaVdIvNyhZ5kzcQfysNjNoWOouh1Xv1wbH2DjgZAFyZnSl+HzEBY/tZ
   Ojwh2j5ONwkCbBYPOb8opI68tEbkC+iWdLqF9awJk/omFZPbPEY2HwdCs
   A==;
X-CSE-ConnectionGUID: 3HaQniMyTCyDxXaQaiNBeQ==
X-CSE-MsgGUID: tNPFb/Z+SxO58xMcxeHq+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67274933"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67274933"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 15:17:37 -0800
X-CSE-ConnectionGUID: fJOqUWe0RXqOIeIC14z7fA==
X-CSE-MsgGUID: zKtQGePhTlCD7lloQa/kSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196397354"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2025 15:17:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTTR6-000000000q0-3qu1;
	Wed, 10 Dec 2025 23:17:32 +0000
Date: Thu, 11 Dec 2025 00:17:19 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/drm/drm_atomic.h:246: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'drm_private_state_funcs'
Message-ID: <202512110047.nTLxJwrh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: cfa43356aa8915bedee4920a6c98abdc8a75afa5 [3508/3508] drm: drm_atomic.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110047.nTLxJwrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110047.nTLxJwrh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'
   Error: Cannot open file ./include/linux/backlight.h
   Error: Cannot open file ./include/linux/backlight.h
>> ./include/drm/drm_atomic.h:246: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state_funcs'
>> ./include/drm/drm_atomic.h:347: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state'
   ./include/drm/drm_connector.h:527: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +246 ./include/drm/drm_atomic.h

a4370c777406c28 Ville Syrjälä        2017-07-12  199  
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  200  /**
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  201   * struct drm_private_state_funcs - atomic state functions for private objects
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  202   *
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  203   * These hooks are used by atomic helpers to create, swap and destroy states of
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  204   * private objects. The structure itself is used as a vtable to identify the
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  205   * associated private object type. Each private object type that needs to be
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  206   * added to the atomic states is expected to have an implementation of these
1e55a53a28d3e52 Matt Roper           2019-02-01  207   * hooks and pass a pointer to its drm_private_state_funcs struct to
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  208   * drm_atomic_get_private_obj_state().
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  209   */
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  210  struct drm_private_state_funcs {
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  211  	/**
a4370c777406c28 Ville Syrjälä        2017-07-12  212  	 * @atomic_duplicate_state:
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  213  	 *
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  214  	 * Duplicate the current state of the private object and return it. It
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  215  	 * is an error to call this before obj->state has been initialized.
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  216  	 *
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  217  	 * RETURNS:
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  218  	 *
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  219  	 * Duplicated atomic state or NULL when obj->state is not
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  220  	 * initialized or allocation failed.
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  221  	 */
a4370c777406c28 Ville Syrjälä        2017-07-12  222  	struct drm_private_state *(*atomic_duplicate_state)(struct drm_private_obj *obj);
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  223  
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  224  	/**
a4370c777406c28 Ville Syrjälä        2017-07-12  225  	 * @atomic_destroy_state:
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  226  	 *
a4370c777406c28 Ville Syrjälä        2017-07-12  227  	 * Frees the private object state created with @atomic_duplicate_state.
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  228  	 */
a4370c777406c28 Ville Syrjälä        2017-07-12  229  	void (*atomic_destroy_state)(struct drm_private_obj *obj,
a4370c777406c28 Ville Syrjälä        2017-07-12  230  				     struct drm_private_state *state);
97a1f01b3f2f734 Maxime Ripard        2022-03-28  231  
97a1f01b3f2f734 Maxime Ripard        2022-03-28  232  	/**
97a1f01b3f2f734 Maxime Ripard        2022-03-28  233  	 * @atomic_print_state:
97a1f01b3f2f734 Maxime Ripard        2022-03-28  234  	 *
97a1f01b3f2f734 Maxime Ripard        2022-03-28  235  	 * If driver subclasses &struct drm_private_state, it should implement
97a1f01b3f2f734 Maxime Ripard        2022-03-28  236  	 * this optional hook for printing additional driver specific state.
97a1f01b3f2f734 Maxime Ripard        2022-03-28  237  	 *
97a1f01b3f2f734 Maxime Ripard        2022-03-28  238  	 * Do not call this directly, use drm_atomic_private_obj_print_state()
97a1f01b3f2f734 Maxime Ripard        2022-03-28  239  	 * instead.
97a1f01b3f2f734 Maxime Ripard        2022-03-28  240  	 */
97a1f01b3f2f734 Maxime Ripard        2022-03-28  241  	void (*atomic_print_state)(struct drm_printer *p,
97a1f01b3f2f734 Maxime Ripard        2022-03-28  242  				   const struct drm_private_state *state);
cfa43356aa8915b Lin Yujun            2024-02-04  243  
cfa43356aa8915b Lin Yujun            2024-02-04  244  	KABI_RESERVE(1)
cfa43356aa8915b Lin Yujun            2024-02-04  245  	KABI_RESERVE(2)
a4370c777406c28 Ville Syrjälä        2017-07-12 @246  };
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  247  
da6c05969785a0f Daniel Vetter        2017-12-14  248  /**
da6c05969785a0f Daniel Vetter        2017-12-14  249   * struct drm_private_obj - base struct for driver private atomic object
da6c05969785a0f Daniel Vetter        2017-12-14  250   *
da6c05969785a0f Daniel Vetter        2017-12-14  251   * A driver private object is initialized by calling
da6c05969785a0f Daniel Vetter        2017-12-14  252   * drm_atomic_private_obj_init() and cleaned up by calling
da6c05969785a0f Daniel Vetter        2017-12-14  253   * drm_atomic_private_obj_fini().
da6c05969785a0f Daniel Vetter        2017-12-14  254   *
da6c05969785a0f Daniel Vetter        2017-12-14  255   * Currently only tracks the state update functions and the opaque driver
da6c05969785a0f Daniel Vetter        2017-12-14  256   * private state itself, but in the future might also track which
da6c05969785a0f Daniel Vetter        2017-12-14  257   * &drm_modeset_lock is required to duplicate and update this object's state.
b962a12050a387e Rob Clark            2018-10-22  258   *
b962a12050a387e Rob Clark            2018-10-22  259   * All private objects must be initialized before the DRM device they are
b962a12050a387e Rob Clark            2018-10-22  260   * attached to is registered to the DRM subsystem (call to drm_dev_register())
b962a12050a387e Rob Clark            2018-10-22  261   * and should stay around until this DRM device is unregistered (call to
b962a12050a387e Rob Clark            2018-10-22  262   * drm_dev_unregister()). In other words, private objects lifetime is tied
b962a12050a387e Rob Clark            2018-10-22  263   * to the DRM device lifetime. This implies that:
b962a12050a387e Rob Clark            2018-10-22  264   *
b962a12050a387e Rob Clark            2018-10-22  265   * 1/ all calls to drm_atomic_private_obj_init() must be done before calling
b962a12050a387e Rob Clark            2018-10-22  266   *    drm_dev_register()
b962a12050a387e Rob Clark            2018-10-22  267   * 2/ all calls to drm_atomic_private_obj_fini() must be done after calling
b962a12050a387e Rob Clark            2018-10-22  268   *    drm_dev_unregister()
27125e86b797dee Maxime Ripard        2020-12-04  269   *
27125e86b797dee Maxime Ripard        2020-12-04  270   * If that private object is used to store a state shared by multiple
27125e86b797dee Maxime Ripard        2020-12-04  271   * CRTCs, proper care must be taken to ensure that non-blocking commits are
27125e86b797dee Maxime Ripard        2020-12-04  272   * properly ordered to avoid a use-after-free issue.
27125e86b797dee Maxime Ripard        2020-12-04  273   *
27125e86b797dee Maxime Ripard        2020-12-04  274   * Indeed, assuming a sequence of two non-blocking &drm_atomic_commit on two
27125e86b797dee Maxime Ripard        2020-12-04  275   * different &drm_crtc using different &drm_plane and &drm_connector, so with no
27125e86b797dee Maxime Ripard        2020-12-04  276   * resources shared, there's no guarantee on which commit is going to happen
27125e86b797dee Maxime Ripard        2020-12-04  277   * first. However, the second &drm_atomic_commit will consider the first
27125e86b797dee Maxime Ripard        2020-12-04  278   * &drm_private_obj its old state, and will be in charge of freeing it whenever
27125e86b797dee Maxime Ripard        2020-12-04  279   * the second &drm_atomic_commit is done.
27125e86b797dee Maxime Ripard        2020-12-04  280   *
27125e86b797dee Maxime Ripard        2020-12-04  281   * If the first &drm_atomic_commit happens after it, it will consider its
27125e86b797dee Maxime Ripard        2020-12-04  282   * &drm_private_obj the new state and will be likely to access it, resulting in
27125e86b797dee Maxime Ripard        2020-12-04  283   * an access to a freed memory region. Drivers should store (and get a reference
27125e86b797dee Maxime Ripard        2020-12-04  284   * to) the &drm_crtc_commit structure in our private state in
27125e86b797dee Maxime Ripard        2020-12-04  285   * &drm_mode_config_helper_funcs.atomic_commit_setup, and then wait for that
27125e86b797dee Maxime Ripard        2020-12-04  286   * commit to complete as the first step of
27125e86b797dee Maxime Ripard        2020-12-04  287   * &drm_mode_config_helper_funcs.atomic_commit_tail, similar to
27125e86b797dee Maxime Ripard        2020-12-04  288   * drm_atomic_helper_wait_for_dependencies().
da6c05969785a0f Daniel Vetter        2017-12-14  289   */
a4370c777406c28 Ville Syrjälä        2017-07-12  290  struct drm_private_obj {
b962a12050a387e Rob Clark            2018-10-22  291  	/**
b962a12050a387e Rob Clark            2018-10-22  292  	 * @head: List entry used to attach a private object to a &drm_device
b962a12050a387e Rob Clark            2018-10-22  293  	 * (queued to &drm_mode_config.privobj_list).
b962a12050a387e Rob Clark            2018-10-22  294  	 */
b962a12050a387e Rob Clark            2018-10-22  295  	struct list_head head;
b962a12050a387e Rob Clark            2018-10-22  296  
b962a12050a387e Rob Clark            2018-10-22  297  	/**
b962a12050a387e Rob Clark            2018-10-22  298  	 * @lock: Modeset lock to protect the state object.
b962a12050a387e Rob Clark            2018-10-22  299  	 */
b962a12050a387e Rob Clark            2018-10-22  300  	struct drm_modeset_lock lock;
b962a12050a387e Rob Clark            2018-10-22  301  
da6c05969785a0f Daniel Vetter        2017-12-14  302  	/**
da6c05969785a0f Daniel Vetter        2017-12-14  303  	 * @state: Current atomic state for this driver private object.
da6c05969785a0f Daniel Vetter        2017-12-14  304  	 */
a4370c777406c28 Ville Syrjälä        2017-07-12  305  	struct drm_private_state *state;
a4370c777406c28 Ville Syrjälä        2017-07-12  306  
da6c05969785a0f Daniel Vetter        2017-12-14  307  	/**
da6c05969785a0f Daniel Vetter        2017-12-14  308  	 * @funcs:
da6c05969785a0f Daniel Vetter        2017-12-14  309  	 *
da6c05969785a0f Daniel Vetter        2017-12-14  310  	 * Functions to manipulate the state of this driver private object, see
da6c05969785a0f Daniel Vetter        2017-12-14  311  	 * &drm_private_state_funcs.
da6c05969785a0f Daniel Vetter        2017-12-14  312  	 */
a4370c777406c28 Ville Syrjälä        2017-07-12  313  	const struct drm_private_state_funcs *funcs;
a4370c777406c28 Ville Syrjälä        2017-07-12  314  };
a4370c777406c28 Ville Syrjälä        2017-07-12  315  
b962a12050a387e Rob Clark            2018-10-22  316  /**
b962a12050a387e Rob Clark            2018-10-22  317   * drm_for_each_privobj() - private object iterator
b962a12050a387e Rob Clark            2018-10-22  318   *
b962a12050a387e Rob Clark            2018-10-22  319   * @privobj: pointer to the current private object. Updated after each
b962a12050a387e Rob Clark            2018-10-22  320   *	     iteration
b962a12050a387e Rob Clark            2018-10-22  321   * @dev: the DRM device we want get private objects from
b962a12050a387e Rob Clark            2018-10-22  322   *
b962a12050a387e Rob Clark            2018-10-22  323   * Allows one to iterate over all private objects attached to @dev
b962a12050a387e Rob Clark            2018-10-22  324   */
b962a12050a387e Rob Clark            2018-10-22  325  #define drm_for_each_privobj(privobj, dev) \
b962a12050a387e Rob Clark            2018-10-22  326  	list_for_each_entry(privobj, &(dev)->mode_config.privobj_list, head)
b962a12050a387e Rob Clark            2018-10-22  327  
da6c05969785a0f Daniel Vetter        2017-12-14  328  /**
da6c05969785a0f Daniel Vetter        2017-12-14  329   * struct drm_private_state - base struct for driver private object state
da6c05969785a0f Daniel Vetter        2017-12-14  330   *
97a1f01b3f2f734 Maxime Ripard        2022-03-28  331   * Currently only contains a backpointer to the overall atomic update,
97a1f01b3f2f734 Maxime Ripard        2022-03-28  332   * and the relevant private object but in the future also might hold
97a1f01b3f2f734 Maxime Ripard        2022-03-28  333   * synchronization information similar to e.g. &drm_crtc.commit.
da6c05969785a0f Daniel Vetter        2017-12-14  334   */
a4370c777406c28 Ville Syrjälä        2017-07-12  335  struct drm_private_state {
97a1f01b3f2f734 Maxime Ripard        2022-03-28  336  	/**
97a1f01b3f2f734 Maxime Ripard        2022-03-28  337  	 * @state: backpointer to global drm_atomic_state
97a1f01b3f2f734 Maxime Ripard        2022-03-28  338  	 */
a4370c777406c28 Ville Syrjälä        2017-07-12  339  	struct drm_atomic_state *state;
97a1f01b3f2f734 Maxime Ripard        2022-03-28  340  
97a1f01b3f2f734 Maxime Ripard        2022-03-28  341  	/**
97a1f01b3f2f734 Maxime Ripard        2022-03-28  342  	 * @obj: backpointer to the private object
97a1f01b3f2f734 Maxime Ripard        2022-03-28  343  	 */
97a1f01b3f2f734 Maxime Ripard        2022-03-28  344  	struct drm_private_obj *obj;
cfa43356aa8915b Lin Yujun            2024-02-04  345  	KABI_RESERVE(1)
cfa43356aa8915b Lin Yujun            2024-02-04  346  	KABI_RESERVE(2)
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20 @347  };
b430c27a7de3ccf Pandiyan, Dhinakaran 2017-04-20  348  

:::::: The code at line 246 was first introduced by commit
:::::: a4370c777406c2810e37fafd166ccddecdb2a60c drm/atomic: Make private objs proper objects

:::::: TO: Ville Syrjälä <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

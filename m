Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17D30FF3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473774; cv=none; b=LcIGxAnTkJr4f3w05gvWvQxi8Qm7kq4AL7SRSlgVrjt4tgJ0jxVsHtKY//OqkvC5ww0F21ixT4ntF7V6sxkjuf9GAToxKAvTJCRdBN3fZHAkYYHrHH/6kgv/Q2Gl/WPILkRKbPCiPxraC2tkPk5tuZ4fTxmxsINX2s6EWjSkGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473774; c=relaxed/simple;
	bh=YsFsIWIG29JxUIH+9wN6sRbl/A3Jcm7Uwfv6GDVhhKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ex6TT5K9K8vnJrqAiP8Q5ba8p9SXZtbXldPLw6EL/fMLbXDmPGQbbWRNzhB4tzsithdq2kgVTMgGrl3HtqA6nPeBGFEp32Dg0uxL6SpAdVBQmxtFF/rH30JaCMnGcePxIonPRzoEVouNy2pG9iKEU8ShRzoooqxMokXXN0Tpxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBlDaaW6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBlDaaW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765473772; x=1797009772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YsFsIWIG29JxUIH+9wN6sRbl/A3Jcm7Uwfv6GDVhhKA=;
  b=nBlDaaW6JNNiZ9PLZi05OBApxp61VqVb/jEaPrXRMMJ29bXia9dnXlEF
   Zffbdf2DyAX1EkShmuaxjYzn6bWf5TtIgHEtcdmWmkmOuCaPHlVtDzfXZ
   tWg/poscI+AiBF8HI/TBOMmO/YbqYYX3ubaX5xkCT3XsCicSXzlhCyGJW
   dTVY0A/MyqwIfUh0lDmnPz79h0cV4aHB+h0g5J2dhmkMn6iTjagTNI2JP
   amW93vZDvxOHVPjczO19DzlXb7iLEq0Myg7p+Z4iikLeUGbYb0/VwsSdo
   e86dmWQPyL5HnklOqUu81rFyBxJH9R3GmF+cTQB2V9+bPcdm6HmfnqQfZ
   Q==;
X-CSE-ConnectionGUID: ZnfJwKA5T7GyOa3khcr1Aw==
X-CSE-MsgGUID: 0h+8Fgz/QeGKJFawSqGZmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85070822"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="85070822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 09:22:51 -0800
X-CSE-ConnectionGUID: DVbD4QMqSlGcj/eD82sf/A==
X-CSE-MsgGUID: dvwbh9UaQFq5ou0W5bZfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196852336"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 09:22:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTkNL-0000000019c-2slj;
	Thu, 11 Dec 2025 17:22:47 +0000
Date: Thu, 11 Dec 2025 18:21:52 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/drm/drm_fb_helper.h:107: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'drm_fb_helper_funcs'
Message-ID: <202512111820.FOuZzKT5-lkp@intel.com>
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
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 544aacc8da43991ecec944d135d89335642d7b3c [3508/3508] drm: drm_fb_helper.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111820.FOuZzKT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111820.FOuZzKT5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/drm/drm_connector.h:826: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_display_info'
   ./include/drm/drm_connector.h:888: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_tv_connector_state'
   ./include/drm/drm_connector.h:1350: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector_funcs'
   ./include/drm/drm_connector.h:1499: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_cmdline_mode'
   ./include/drm/drm_connector.h:1897: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector'
>> ./include/drm/drm_fb_helper.h:107: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_fb_helper_funcs'
>> ./include/drm/drm_fb_helper.h:217: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_fb_helper'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +107 ./include/drm/drm_fb_helper.h

386516744ba45d Dave Airlie              2010-03-30   67  
207fd32970b1de Daniel Vetter            2013-01-20   68  /**
207fd32970b1de Daniel Vetter            2013-01-20   69   * struct drm_fb_helper_funcs - driver callbacks for the fbdev emulation library
207fd32970b1de Daniel Vetter            2013-01-20   70   *
207fd32970b1de Daniel Vetter            2013-01-20   71   * Driver callbacks used by the fbdev emulation helper library.
207fd32970b1de Daniel Vetter            2013-01-20   72   */
4abe35204af82a Dave Airlie              2010-03-30   73  struct drm_fb_helper_funcs {
264d6970e16c68 Daniel Vetter            2015-12-04   74  	/**
264d6970e16c68 Daniel Vetter            2015-12-04   75  	 * @fb_probe:
264d6970e16c68 Daniel Vetter            2015-12-04   76  	 *
264d6970e16c68 Daniel Vetter            2015-12-04   77  	 * Driver callback to allocate and initialize the fbdev info structure.
264d6970e16c68 Daniel Vetter            2015-12-04   78  	 * Furthermore it also needs to allocate the DRM framebuffer used to
264d6970e16c68 Daniel Vetter            2015-12-04   79  	 * back the fbdev.
264d6970e16c68 Daniel Vetter            2015-12-04   80  	 *
264d6970e16c68 Daniel Vetter            2015-12-04   81  	 * This callback is mandatory.
264d6970e16c68 Daniel Vetter            2015-12-04   82  	 *
264d6970e16c68 Daniel Vetter            2015-12-04   83  	 * RETURNS:
264d6970e16c68 Daniel Vetter            2015-12-04   84  	 *
264d6970e16c68 Daniel Vetter            2015-12-04   85  	 * The driver should return 0 on success and a negative error code on
264d6970e16c68 Daniel Vetter            2015-12-04   86  	 * failure.
264d6970e16c68 Daniel Vetter            2015-12-04   87  	 */
4abe35204af82a Dave Airlie              2010-03-30   88  	int (*fb_probe)(struct drm_fb_helper *helper,
4abe35204af82a Dave Airlie              2010-03-30   89  			struct drm_fb_helper_surface_size *sizes);
f231af498c29f3 Thomas Zimmermann        2022-11-03   90  
f231af498c29f3 Thomas Zimmermann        2022-11-03   91  	/**
f231af498c29f3 Thomas Zimmermann        2022-11-03   92  	 * @fb_dirty:
f231af498c29f3 Thomas Zimmermann        2022-11-03   93  	 *
f231af498c29f3 Thomas Zimmermann        2022-11-03   94  	 * Driver callback to update the framebuffer memory. If set, fbdev
f231af498c29f3 Thomas Zimmermann        2022-11-03   95  	 * emulation will invoke this callback in regular intervals after
f231af498c29f3 Thomas Zimmermann        2022-11-03   96  	 * the framebuffer has been written.
f231af498c29f3 Thomas Zimmermann        2022-11-03   97  	 *
f231af498c29f3 Thomas Zimmermann        2022-11-03   98  	 * This callback is optional.
f231af498c29f3 Thomas Zimmermann        2022-11-03   99  	 *
f231af498c29f3 Thomas Zimmermann        2022-11-03  100  	 * Returns:
f231af498c29f3 Thomas Zimmermann        2022-11-03  101  	 * 0 on success, or an error code otherwise.
f231af498c29f3 Thomas Zimmermann        2022-11-03  102  	 */
f231af498c29f3 Thomas Zimmermann        2022-11-03  103  	int (*fb_dirty)(struct drm_fb_helper *helper, struct drm_clip_rect *clip);
544aacc8da4399 Lin Yujun                2024-02-04  104  
544aacc8da4399 Lin Yujun                2024-02-04  105  	KABI_RESERVE(1)
544aacc8da4399 Lin Yujun                2024-02-04  106  	KABI_RESERVE(2)
4abe35204af82a Dave Airlie              2010-03-30 @107  };
4abe35204af82a Dave Airlie              2010-03-30  108  
9685cd9df75c1f Rob Clark                2015-08-25  109  /**
264d6970e16c68 Daniel Vetter            2015-12-04  110   * struct drm_fb_helper - main structure to emulate fbdev on top of KMS
9685cd9df75c1f Rob Clark                2015-08-25  111   * @fb: Scanout framebuffer object
9685cd9df75c1f Rob Clark                2015-08-25  112   * @dev: DRM device
9685cd9df75c1f Rob Clark                2015-08-25  113   * @funcs: driver callbacks for fb helper
9877d8f6bc3749 Thomas Zimmermann        2022-11-03  114   * @info: emulated fbdev device info struct
9685cd9df75c1f Rob Clark                2015-08-25  115   * @pseudo_palette: fake palette of 16 colors
9622349ea1b623 Thomas Zimmermann        2020-11-20  116   * @damage_clip: clip rectangle used with deferred_io to accumulate damage to
eaa434defaca17 Noralf Trønnes           2016-04-28  117   *                the screen buffer
9622349ea1b623 Thomas Zimmermann        2020-11-20  118   * @damage_lock: spinlock protecting @damage_clip
7aa3d63e1ad56c Thomas Zimmermann        2022-11-18  119   * @damage_work: worker used to flush the framebuffer
cfe63423d9be3e Noralf Trønnes           2016-08-23  120   * @resume_work: worker used during resume if the console lock is already taken
264d6970e16c68 Daniel Vetter            2015-12-04  121   *
264d6970e16c68 Daniel Vetter            2015-12-04  122   * This is the main structure used by the fbdev helpers. Drivers supporting
264d6970e16c68 Daniel Vetter            2015-12-04  123   * fbdev emulation should embedded this into their overall driver structure.
ea0dd85a75f151 Daniel Vetter            2016-12-29  124   * Drivers must also fill out a &struct drm_fb_helper_funcs with a few
264d6970e16c68 Daniel Vetter            2015-12-04  125   * operations.
9685cd9df75c1f Rob Clark                2015-08-25  126   */
785b93ef8c3097 Dave Airlie              2009-08-28  127  struct drm_fb_helper {
d536540f304ce0 Noralf Trønnes           2018-07-03  128  	/**
d536540f304ce0 Noralf Trønnes           2018-07-03  129  	 * @client:
d536540f304ce0 Noralf Trønnes           2018-07-03  130  	 *
d536540f304ce0 Noralf Trønnes           2018-07-03  131  	 * DRM client used by the generic fbdev emulation.
d536540f304ce0 Noralf Trønnes           2018-07-03  132  	 */
d536540f304ce0 Noralf Trønnes           2018-07-03  133  	struct drm_client_dev client;
d536540f304ce0 Noralf Trønnes           2018-07-03  134  
d536540f304ce0 Noralf Trønnes           2018-07-03  135  	/**
d536540f304ce0 Noralf Trønnes           2018-07-03  136  	 * @buffer:
d536540f304ce0 Noralf Trønnes           2018-07-03  137  	 *
d536540f304ce0 Noralf Trønnes           2018-07-03  138  	 * Framebuffer used by the generic fbdev emulation.
d536540f304ce0 Noralf Trønnes           2018-07-03  139  	 */
d536540f304ce0 Noralf Trønnes           2018-07-03  140  	struct drm_client_buffer *buffer;
d536540f304ce0 Noralf Trønnes           2018-07-03  141  
785b93ef8c3097 Dave Airlie              2009-08-28  142  	struct drm_framebuffer *fb;
785b93ef8c3097 Dave Airlie              2009-08-28  143  	struct drm_device *dev;
3a4938799dec32 Thierry Reding           2014-06-27  144  	const struct drm_fb_helper_funcs *funcs;
9877d8f6bc3749 Thomas Zimmermann        2022-11-03  145  	struct fb_info *info;
386516744ba45d Dave Airlie              2010-03-30  146  	u32 pseudo_palette[17];
9622349ea1b623 Thomas Zimmermann        2020-11-20  147  	struct drm_clip_rect damage_clip;
9622349ea1b623 Thomas Zimmermann        2020-11-20  148  	spinlock_t damage_lock;
7aa3d63e1ad56c Thomas Zimmermann        2022-11-18  149  	struct work_struct damage_work;
cfe63423d9be3e Noralf Trønnes           2016-08-23  150  	struct work_struct resume_work;
264d6970e16c68 Daniel Vetter            2015-12-04  151  
e9827d8ea2142d Thierry Reding           2017-07-04  152  	/**
e9827d8ea2142d Thierry Reding           2017-07-04  153  	 * @lock:
e9827d8ea2142d Thierry Reding           2017-07-04  154  	 *
e9827d8ea2142d Thierry Reding           2017-07-04  155  	 * Top-level FBDEV helper lock. This protects all internal data
e9827d8ea2142d Thierry Reding           2017-07-04  156  	 * structures and lists, such as @connector_info and @crtc_info.
e9827d8ea2142d Thierry Reding           2017-07-04  157  	 *
e9827d8ea2142d Thierry Reding           2017-07-04  158  	 * FIXME: fbdev emulation locking is a mess and long term we want to
e9827d8ea2142d Thierry Reding           2017-07-04  159  	 * protect all helper internal state with this lock as well as reduce
e9827d8ea2142d Thierry Reding           2017-07-04  160  	 * core KMS locking as much as possible.
e9827d8ea2142d Thierry Reding           2017-07-04  161  	 */
e9827d8ea2142d Thierry Reding           2017-07-04  162  	struct mutex lock;
e9827d8ea2142d Thierry Reding           2017-07-04  163  
264d6970e16c68 Daniel Vetter            2015-12-04  164  	/**
264d6970e16c68 Daniel Vetter            2015-12-04  165  	 * @kernel_fb_list:
264d6970e16c68 Daniel Vetter            2015-12-04  166  	 *
264d6970e16c68 Daniel Vetter            2015-12-04  167  	 * Entry on the global kernel_fb_helper_list, used for kgdb entry/exit.
264d6970e16c68 Daniel Vetter            2015-12-04  168  	 */
785b93ef8c3097 Dave Airlie              2009-08-28  169  	struct list_head kernel_fb_list;
8be48d924c307e Dave Airlie              2010-03-30  170  
264d6970e16c68 Daniel Vetter            2015-12-04  171  	/**
264d6970e16c68 Daniel Vetter            2015-12-04  172  	 * @delayed_hotplug:
264d6970e16c68 Daniel Vetter            2015-12-04  173  	 *
264d6970e16c68 Daniel Vetter            2015-12-04  174  	 * A hotplug was received while fbdev wasn't in control of the DRM
264d6970e16c68 Daniel Vetter            2015-12-04  175  	 * device, i.e. another KMS master was active. The output configuration
264d6970e16c68 Daniel Vetter            2015-12-04  176  	 * needs to be reprobe when fbdev is in control again.
264d6970e16c68 Daniel Vetter            2015-12-04  177  	 */
4abe35204af82a Dave Airlie              2010-03-30  178  	bool delayed_hotplug;
ca91a2758fcef6 Daniel Vetter            2017-07-06  179  
ca91a2758fcef6 Daniel Vetter            2017-07-06  180  	/**
ca91a2758fcef6 Daniel Vetter            2017-07-06  181  	 * @deferred_setup:
ca91a2758fcef6 Daniel Vetter            2017-07-06  182  	 *
ca91a2758fcef6 Daniel Vetter            2017-07-06  183  	 * If no outputs are connected (disconnected or unknown) the FB helper
ca91a2758fcef6 Daniel Vetter            2017-07-06  184  	 * code will defer setup until at least one of the outputs shows up.
ca91a2758fcef6 Daniel Vetter            2017-07-06  185  	 * This field keeps track of the status so that setup can be retried
ca91a2758fcef6 Daniel Vetter            2017-07-06  186  	 * at every hotplug event until it succeeds eventually.
ca91a2758fcef6 Daniel Vetter            2017-07-06  187  	 *
ca91a2758fcef6 Daniel Vetter            2017-07-06  188  	 * Protected by @lock.
ca91a2758fcef6 Daniel Vetter            2017-07-06  189  	 */
ca91a2758fcef6 Daniel Vetter            2017-07-06  190  	bool deferred_setup;
ca91a2758fcef6 Daniel Vetter            2017-07-06  191  
ca91a2758fcef6 Daniel Vetter            2017-07-06  192  	/**
ca91a2758fcef6 Daniel Vetter            2017-07-06  193  	 * @preferred_bpp:
ca91a2758fcef6 Daniel Vetter            2017-07-06  194  	 *
ca91a2758fcef6 Daniel Vetter            2017-07-06  195  	 * Temporary storage for the driver's preferred BPP setting passed to
ca91a2758fcef6 Daniel Vetter            2017-07-06  196  	 * FB helper initialization. This needs to be tracked so that deferred
ca91a2758fcef6 Daniel Vetter            2017-07-06  197  	 * FB helper setup can pass this on.
ca91a2758fcef6 Daniel Vetter            2017-07-06  198  	 *
ca91a2758fcef6 Daniel Vetter            2017-07-06  199  	 * See also: @deferred_setup
ca91a2758fcef6 Daniel Vetter            2017-07-06  200  	 */
ca91a2758fcef6 Daniel Vetter            2017-07-06  201  	int preferred_bpp;
e7c5c29a9eb1c9 Thomas Zimmermann        2022-11-03  202  
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  203  #ifdef CONFIG_FB_DEFERRED_IO
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  204  	/**
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  205  	 * @fbdefio:
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  206  	 *
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  207  	 * Temporary storage for the driver's FB deferred I/O handler. If the
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  208  	 * driver uses the DRM fbdev emulation layer, this is set by the core
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  209  	 * to a generic deferred I/O handler if a driver is preferring to use
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  210  	 * a shadow buffer.
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  211  	 */
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  212  	struct fb_deferred_io fbdefio;
d6591da5f3ff28 Javier Martinez Canillas 2023-01-21  213  #endif
544aacc8da4399 Lin Yujun                2024-02-04  214  
544aacc8da4399 Lin Yujun                2024-02-04  215  	KABI_RESERVE(1)
544aacc8da4399 Lin Yujun                2024-02-04  216  	KABI_RESERVE(2)
785b93ef8c3097 Dave Airlie              2009-08-28 @217  };
785b93ef8c3097 Dave Airlie              2009-08-28  218  

:::::: The code at line 107 was first introduced by commit
:::::: 4abe35204af82a018ca3ce6db4102aa09719698e drm/kms/fb: use slow work mechanism for normal hotplug also.

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

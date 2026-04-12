Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7C31328E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 23:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776036040; cv=none; b=UPqiqg6U6K2maRBrG5UxOFbW3rB2vNxels9DoorIhTLRbghHQkuTvkHEvB4lzAgjAbWDq4X4fbQ/thnqtKGVSMap7xJm1MF6ZM/9QcEKCEodHtThQi6i8VLIBctwcMqoXkmS761ocqG/xZgmB0N9pzyNPb+H/vhiERVUZiP+fFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776036040; c=relaxed/simple;
	bh=rfjrmHvCNDk3IKfa97i48Ia4kuXsfB55J8IfzC0kqNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzzFrqb//KjZ1aeCO0yuxG6REc30S5/RXRauxYGvKO9l/RoA52nFU08Zh7D/P85tmu6jYzIwe9w81b0UpUll2yhFN/umbi+LuLodbWcIlyCm4qd6c0xn0st5JOnx3XpLjgb1pwNmRzu0W12DLigNxGBDG5SDBuoJOgpA+JH2Tqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT5200As; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT5200As"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776036038; x=1807572038;
  h=date:from:to:cc:subject:message-id;
  bh=rfjrmHvCNDk3IKfa97i48Ia4kuXsfB55J8IfzC0kqNk=;
  b=BT5200Asv1JO46cJm5/FEcmpP9T99xF1qAbtDn7H8S7tUoDgJGUtOzgz
   2z8qBqCzwtzKTPCjbmbXBk8V3Hpy7AU8LkUpjIVJ7ubd4fudJbYNY3Xhj
   vqPDV4Mj3TnTh5yHrwLBkcmerOFKz4B3mszNPwyABdfYQZ36GgJd7Dwbu
   rjP8+rJcBzyPIYIxYz9RZDWCOZUQBxxl/fUhqBtGVh7Ms763vE9238y81
   tB9TbcCe5sxCsLVt6vtlXr7Q4nVPg2qRantkUNY9FBUg2w6loBED2UIm6
   CdXGtgSTMqETNtZG4QPRkRtepALxRch6oNBGc4MuRxcY0jH4FenDn1F8y
   g==;
X-CSE-ConnectionGUID: etkX7erzRE6EUKIDp1nQIg==
X-CSE-MsgGUID: QNbjq4aYQY2rFtKMAmlMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87671679"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="87671679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 16:20:37 -0700
X-CSE-ConnectionGUID: 3YVqyyArSVaz3Sha+ccV5A==
X-CSE-MsgGUID: SwsQ842nRYSexA2K0Zv3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="267612111"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 16:20:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC46T-00000000BNJ-2Q5S;
	Sun, 12 Apr 2026 23:20:33 +0000
Date: Mon, 13 Apr 2026 01:19:55 +0200
From: kernel test robot <lkp@intel.com>
To: Val Packett <val@packett.cool>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/drm/drm_panel.h:91:40: warning: 'struct
 drm_display_mode' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202604130128.rv6Vfwai-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Val-Packett/drm-Introduce-drm_panel_prepare_for_mode-callback/20260412-203219
head:   a210eaa6cf90ed0bb6afe19395c080e50a1f71a7
commit: 9bd267e761ba71f9f691e6c5d5b990f7a8cba2ad drm: Introduce drm_panel_prepare_for_mode callback
date:   11 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260413/202604130128.rv6Vfwai-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130128.rv6Vfwai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130128.rv6Vfwai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:41:
>> include/drm/drm_panel.h:91:40: warning: 'struct drm_display_mode' declared inside parameter list will not be visible outside of this definition or declaration
      91 |                                 struct drm_display_mode *mode);
         |                                        ^~~~~~~~~~~~~~~~
   include/drm/drm_panel.h:345:40: warning: 'struct drm_display_mode' declared inside parameter list will not be visible outside of this definition or declaration
     345 |                                 struct drm_display_mode *mode);
         |                                        ^~~~~~~~~~~~~~~~


vim +91 include/drm/drm_panel.h

    42	
    43	/**
    44	 * struct drm_panel_funcs - perform operations on a given panel
    45	 *
    46	 * The .prepare() function is typically called before the display controller
    47	 * starts to transmit video data. Panel drivers can use this to turn the panel
    48	 * on and wait for it to become ready. If additional configuration is required
    49	 * (via a control bus such as I2C, SPI or DSI for example) this is a good time
    50	 * to do that.
    51	 *
    52	 * After the display controller has started transmitting video data, it's safe
    53	 * to call the .enable() function. This will typically enable the backlight to
    54	 * make the image on screen visible. Some panels require a certain amount of
    55	 * time or frames before the image is displayed. This function is responsible
    56	 * for taking this into account before enabling the backlight to avoid visual
    57	 * glitches.
    58	 *
    59	 * Before stopping video transmission from the display controller it can be
    60	 * necessary to turn off the panel to avoid visual glitches. This is done in
    61	 * the .disable() function. Analogously to .enable() this typically involves
    62	 * turning off the backlight and waiting for some time to make sure no image
    63	 * is visible on the panel. It is then safe for the display controller to
    64	 * cease transmission of video data.
    65	 *
    66	 * To save power when no video data is transmitted, a driver can power down
    67	 * the panel. This is the job of the .unprepare() function.
    68	 *
    69	 * Backlight can be handled automatically if configured using
    70	 * drm_panel_of_backlight() or drm_panel_dp_aux_backlight(). Then the driver
    71	 * does not need to implement the functionality to enable/disable backlight.
    72	 */
    73	struct drm_panel_funcs {
    74		/**
    75		 * @prepare:
    76		 *
    77		 * Turn on panel and perform set up.
    78		 *
    79		 * This function is optional.
    80		 */
    81		int (*prepare)(struct drm_panel *panel);
    82	
    83		/**
    84		 * @prepare_for_mode:
    85		 *
    86		 * Turn on panel and perform set up, with awareness of the mode being set.
    87		 *
    88		 * This function is optional.
    89		 */
    90		int (*prepare_for_mode)(struct drm_panel *panel,
  > 91		                        struct drm_display_mode *mode);
    92	
    93		/**
    94		 * @enable:
    95		 *
    96		 * Enable panel (turn on back light, etc.).
    97		 *
    98		 * This function is optional.
    99		 */
   100		int (*enable)(struct drm_panel *panel);
   101	
   102		/**
   103		 * @disable:
   104		 *
   105		 * Disable panel (turn off back light, etc.).
   106		 *
   107		 * This function is optional.
   108		 */
   109		int (*disable)(struct drm_panel *panel);
   110	
   111		/**
   112		 * @unprepare:
   113		 *
   114		 * Turn off panel.
   115		 *
   116		 * This function is optional.
   117		 */
   118		int (*unprepare)(struct drm_panel *panel);
   119	
   120		/**
   121		 * @get_modes:
   122		 *
   123		 * Add modes to the connector that the panel is attached to
   124		 * and returns the number of modes added.
   125		 *
   126		 * This function is mandatory.
   127		 */
   128		int (*get_modes)(struct drm_panel *panel,
   129				 struct drm_connector *connector);
   130	
   131		/**
   132		 * @get_orientation:
   133		 *
   134		 * Return the panel orientation set by device tree or EDID.
   135		 *
   136		 * This function is optional.
   137		 */
   138		enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
   139	
   140		/**
   141		 * @get_timings:
   142		 *
   143		 * Copy display timings into the provided array and return
   144		 * the number of display timings available.
   145		 *
   146		 * This function is optional.
   147		 */
   148		int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
   149				   struct display_timing *timings);
   150	
   151		/**
   152		 * @debugfs_init:
   153		 *
   154		 * Allows panels to create panels-specific debugfs files.
   155		 */
   156		void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
   157	};
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95196816
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 03:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693711303; x=1725247303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L74FlvE1y+rtAxDd3zcrE7EbrYevoAmQjsV8I7TTiLs=;
  b=XZWMFgvpskUl4lhSeD6tW3Wv/iVnuOnzFGCqOXc6lggun7+aeA+BKRzD
   SJihvidszuPRBakYyWGLntWLf/THPwYkczhln69HgypXSMuF+XJbdCHYd
   rAFLGWAc/F0WKqv94MbrIUaVYde2eoJBBfJ+BtVyAQ+e/5oyKKISbhwGm
   AwCDvNacKZHXT1henogqRD4TUQh9jJ50mywCHndOUlfV8JDbMaJlXq9P3
   T6JXZOAm/SckPm8h5DaTNVTJAj5gPT3Og2E8xHNpbcio3gx1qifLzTjp2
   gS6TH/Sp6KSxTc+bpP/PfixpL5Lq50JBZ45t5AIl6FzXJX6BULjPDGftM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="355918962"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="355918962"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 20:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="914128661"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="914128661"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Sep 2023 20:21:41 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcdgB-0002qP-01;
	Sun, 03 Sep 2023 03:21:39 +0000
Date: Sun, 3 Sep 2023 11:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/15] htmldocs:
 ./include/drm/drm_debugfs.h:93: warning: Function parameter or member 'name'
 not described in 'drm_debugfs_info'
Message-ID: <202309031144.R5zX4rkR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   32ff9025e6a9a3f02840fab8bf2e5a5b059dbe87
commit: 84649e33ce2c4ecab5b4d753691673cd7c930c22 [1/15] UPSTREAM: drm/debugfs: create device-centered debugfs functions
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031144.R5zX4rkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031144.R5zX4rkR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member 'name' not described in 'drm_debugfs_info'
>> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member 'show' not described in 'drm_debugfs_info'
>> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member 'driver_features' not described in 'drm_debugfs_info'
>> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member 'data' not described in 'drm_debugfs_info'
>> ./include/drm/drm_debugfs.h:105: warning: Function parameter or member 'dev' not described in 'drm_debugfs_entry'
>> ./include/drm/drm_debugfs.h:105: warning: Function parameter or member 'file' not described in 'drm_debugfs_entry'
>> ./include/drm/drm_debugfs.h:105: warning: Function parameter or member 'list' not described in 'drm_debugfs_entry'

vim +93 ./include/drm/drm_debugfs.h

    81	
    82	/**
    83	 * struct drm_debugfs_info - debugfs info list entry
    84	 *
    85	 * This structure represents a debugfs file to be created by the drm
    86	 * core.
    87	 */
    88	struct drm_debugfs_info {
    89		const char *name;
    90		int (*show)(struct seq_file*, void*);
    91		u32 driver_features;
    92		void *data;
  > 93	};
    94	
    95	/**
    96	 * struct drm_debugfs_entry - Per-device debugfs node structure
    97	 *
    98	 * This structure represents a debugfs file, as an instantiation of a &struct
    99	 * drm_debugfs_info on a &struct drm_device.
   100	 */
   101	struct drm_debugfs_entry {
   102		struct drm_device *dev;
   103		struct drm_debugfs_info file;
   104		struct list_head list;
 > 105	};
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

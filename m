Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D7BE58
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693575044; x=1725111044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2Z3ITFURQ3y0B4zwD6Ds5iHWXw17kNJeFGC17mNQo8=;
  b=m1iSwPZ8mO4CfeWtVhlU19kGUPn0wR39P69FDrZ/2WdCufrcaKGCExNL
   S52DjiNgH2k7L8txcz7ZzyhIHxsFqZbfrZIFnOSOFgdSo99Yc3xqYf8Co
   aRvTbw5KiLcQE0JnBsCmWOvc38zH0MkLNJlAiPaecioxPhxqjui7LOFpk
   IX/Y1hccdURZAfxvKnahQYI6u3xle9A0g4kh91zMGje9htHArt7nHHlRP
   z1YVNRJTJSYdUNRVSl43hRwuvgdtU8nuRugkddpvHk5h9+YVf5mgxPajG
   16K7BSlMAjGJLIJdeSOOeSlS6uhN04CrVCutxsElbfRdytCIGxWtdcG2u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442614816"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="442614816"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883188488"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883188488"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 06:30:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc4EP-0001KV-29;
	Fri, 01 Sep 2023 13:30:37 +0000
Date: Fri, 1 Sep 2023 21:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [drm-misc:drm-misc-next 1/3] include/drm/drm_drv.h:587:13: warning:
 'drm_debugfs_dev_init' defined but not used
Message-ID: <202309012114.T8Vlfaf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8e455145d8f163aefa6b9cc29478e0a9f82276e6
commit: 0b30d57acafcaa5374756d314ee54f80d0bcc860 [1/3] drm/debugfs: rework debugfs directory creation v5
config: parisc-randconfig-r033-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012114.T8Vlfaf8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012114.T8Vlfaf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012114.T8Vlfaf8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/solomon/ssd130x.h:18,
                    from drivers/gpu/drm/solomon/ssd130x-i2c.c:14:
>> include/drm/drm_drv.h:587:13: warning: 'drm_debugfs_dev_init' defined but not used [-Wunused-function]
     587 | static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/drm_debugfs_dev_init +587 include/drm/drm_drv.h

   583	
   584	#if defined(CONFIG_DEBUG_FS)
   585	void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
   586	#else
 > 587	static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
   588	{
   589	}
   590	#endif
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

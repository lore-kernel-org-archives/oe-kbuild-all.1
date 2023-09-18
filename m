Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873F1D691
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695047449; x=1726583449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKhmz+G0lnP+76Z3tkxK0WuEs+71wcF0ZOUkcKbskhI=;
  b=D+gBOo+d+PQR5qMF7Awlzef4s94NrWbyaqFsJWMAggWSY8kkR+2hEkhS
   S82NhZKykK646A0YHqGibY9s/td0F6Ox7jnYUH6QhuUfqOO7H1lGkN7g9
   nyP2Kf0b2Lkb5HqGTV3EA2Vbi7SfTfHKjUeclQpbUbcOae+CL6wYE+Xeb
   50PovbJePEXMaOQK2Lcza/QpBdEeLav1LSwm48uqy0CChX6JvpCHCams6
   01wZuGlUjQY5iaCJL7mAEu0bqMXRYBPq0oe0M/0gFGKN8lJ0SwTpBj2z4
   DuA1rEBZqY3is4uzJ6dTbd3PzvH2KAY7zWx30SRX7Iz4ws5rKV0vh7NB2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364714487"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="364714487"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 07:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="889089014"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="889089014"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2023 07:30:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiFGt-0006BI-2a;
	Mon, 18 Sep 2023 14:30:43 +0000
Date: Mon, 18 Sep 2023 22:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [linux-next:master 758/5912] include/drm/drm_drv.h:587:13: error:
 'drm_debugfs_dev_init' defined but not used
Message-ID: <202309182211.yFC3zaup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fc7222d9680366edeecc219c21ca96310bdbc10
commit: 0b30d57acafcaa5374756d314ee54f80d0bcc860 [758/5912] drm/debugfs: rework debugfs directory creation v5
config: arm-randconfig-003-20230918 (https://download.01.org/0day-ci/archive/20230918/202309182211.yFC3zaup-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309182211.yFC3zaup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309182211.yFC3zaup-lkp@intel.com/

Note: the linux-next/master HEAD 7fc7222d9680366edeecc219c21ca96310bdbc10 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_drv.c:18:
>> include/drm/drm_drv.h:587:13: error: 'drm_debugfs_dev_init' defined but not used [-Werror=unused-function]
     587 | static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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

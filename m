Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B19BE4F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611346; cv=none; b=a81LAekZ5J9/33IahezGGNRZ0vkl5hAE2G7fjqyS2ZBndva9Dj1O8kVnMxfq535CsbvKVLWdyC/gV0xQKvz4WhFvDeAEr8iEacHA8yNfUMrchBi2uRCxmcg9PvNNmuu5Znr9Zu+ZgOZWS5Q3jIfNwq5rgha6AAnAWH7sBAg53bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611346; c=relaxed/simple;
	bh=mwwHCNEuYnTBbLLVudDJrOqqLvQfCIUHA6Ff/zCsuAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGPa0eifGUq/oa3bQLNuiV5aTMQLaYjZbgHEd64HMKXIKR7jhd4pTXWS8UHPvuwCXDIfQ9NfGvzG7GXUy8ItmpWRXk/lgY4iW0GSYoS0NCYw6ajLN8VTQPQiVE02T1o/ihkBPbJFArmGSQQohuSkN7ZCkefq+T0Xma5X7YhsyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKBuAHQK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKBuAHQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726611344; x=1758147344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mwwHCNEuYnTBbLLVudDJrOqqLvQfCIUHA6Ff/zCsuAk=;
  b=aKBuAHQKtF3F1/RU3tQQP/xRfXpACmK5qLNvHnYLqosCb/v2tN1GR9oW
   veHMyoNyLFkk6zsrA0EoU32GolfUWrzNg1o3VtY2xyA8YQnUALrftdYrb
   w+hgZX/YwSZbtM0y0SjVnK3/IQ/33U5+7JODdNXGvw0eYjp8CW7nXaf04
   wx02t56AgSILa0zWzVHlOpVoar3f3iWwSWP1P9OSvtZ093Qei5yhA/01x
   S/VJWJ4Euq+gMn4yv6iseb+g8MVeMiG6J+XqsQ1tyzRxBMMRVoinZxAeL
   X2776Neto5VsjoXYnPjJzm1o0F/0uMukFgqzSMjuXTn7TUy3jQvxK09TR
   A==;
X-CSE-ConnectionGUID: M4DWWI0wSfiriJZdFEhb9Q==
X-CSE-MsgGUID: 58TURCSjS9Gm3VLZIXj67w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43015667"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="43015667"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 15:15:43 -0700
X-CSE-ConnectionGUID: YRb/QKZ0RZqLafRHWgGlFg==
X-CSE-MsgGUID: g9V5ut04QTKes1kS3NfNIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="106791581"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Sep 2024 15:15:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqgU0-000Beg-1H;
	Tue, 17 Sep 2024 22:15:40 +0000
Date: Wed, 18 Sep 2024 06:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/61 46/58]
 drivers/gpu/drm/mediatek/mtk_drm_fbdev.h:14:5: warning: no previous
 prototype for 'mtk_fbdev_init'
Message-ID: <202409180649.5eyRQAx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/61
head:   3af288be69ea0433351286701053a33e0690e338
commit: 4bda8482c3dcce12f0dfaf2df9c1298e42735348 [46/58] drm/mediatek: Add MTK Framebuffer-Device (mt7623)
config: arm64-randconfig-002-20240917 (https://download.01.org/0day-ci/archive/20240918/202409180649.5eyRQAx7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409180649.5eyRQAx7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180649.5eyRQAx7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_drm_drv.c:35:
>> drivers/gpu/drm/mediatek/mtk_drm_fbdev.h:14:5: warning: no previous prototype for 'mtk_fbdev_init' [-Wmissing-prototypes]
      14 | int mtk_fbdev_init(struct drm_device *dev)
         |     ^~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_drm_fbdev.h:19:6: warning: no previous prototype for 'mtk_fbdev_fini' [-Wmissing-prototypes]
      19 | void mtk_fbdev_fini(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_atomic_wait_for_fences':
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:53:27: warning: variable 'plane' set but not used [-Wunused-but-set-variable]
      53 |         struct drm_plane *plane;
         |                           ^~~~~


vim +/mtk_fbdev_init +14 drivers/gpu/drm/mediatek/mtk_drm_fbdev.h

     9	
    10	#ifdef CONFIG_DRM_FBDEV_EMULATION
    11	int mtk_fbdev_init(struct drm_device *dev);
    12	void mtk_fbdev_fini(struct drm_device *dev);
    13	#else
  > 14	int mtk_fbdev_init(struct drm_device *dev)
    15	{
    16		return 0;
    17	}
    18	
  > 19	void mtk_fbdev_fini(struct drm_device *dev)
    20	{
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

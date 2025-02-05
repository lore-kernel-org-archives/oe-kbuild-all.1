Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256FA214A90
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799761; cv=none; b=HSAkrsxqULpPK4v4PoTW0Uvj2JuFq7eqAO5ncuE4Q4M6U0VMHid9mdVmT6R15TmgSfp7nCvBiZuEzBikh4UTBnkthw02oM/k7h2OF4mQP45cZI+uHCzqqjKSIB65ehXD+8p/tgVhQXokFyi8QQRLnfd91cTR4wk6HdDghFOE0GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799761; c=relaxed/simple;
	bh=cN5jH2jp1Nv+GAku9elhkJ9Fg7QPELvPsy9cEgyt0lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gL3qTWfODj3REr1Zal8f5kKh6YHATNjLDMFmVCfrxkGkayMlxSesugTe867AQo684QZAxR4Ral+n5VGy8v71tUeb+2J/wXshB4SdeXCP/aTBGAx6EFya5jqxYxLCq7VA2x11IyGAEGKRgJcuRW6AJ/amKC1d+KvbGDv0R143HPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWXyBK5N; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWXyBK5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738799760; x=1770335760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cN5jH2jp1Nv+GAku9elhkJ9Fg7QPELvPsy9cEgyt0lQ=;
  b=SWXyBK5N6wLds3NbJ6+rIMT+0WQATWgLnkXuUNkaGuqn0tyzVi0UZpHC
   Tcih2nxF8Ng+2uzpxaxycRAabhohisYue3AYqg6YjjZqvK0NNe0+vL3Fm
   1c3c19UvyoouGneV1jO5SLCpPIMlFM2VRCuBBDa2F/xjrKOTtaG/KkVlb
   3MeoUQx8ulkXI+o+t3l4WJmPLArYXXAM7Aq7bieHuNczGQBvr9TJjxEAJ
   aHPDfC4ZKBS2BubzGxS1wujU6E2G6h6lmhAcTEIvQha5ooPerrfJxH/B7
   VQPasvkpYU2JJK8tFWMZY+hD+tw68u+DzgHlilR9sMSzfkClyRG94ZYVs
   Q==;
X-CSE-ConnectionGUID: ituovnhsRHuFGDZt7BE/RQ==
X-CSE-MsgGUID: Bi3fG1VXTJ6rJnMeM5rOXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43140839"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="43140839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:55:59 -0800
X-CSE-ConnectionGUID: xUmgCvOtQPu1G8awtLHHhQ==
X-CSE-MsgGUID: N0N5ZunhRDqy/TD1ppUlAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="116084153"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 15:55:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfpFL-000wEV-0C;
	Wed, 05 Feb 2025 23:55:55 +0000
Date: Thu, 6 Feb 2025 07:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 drivers/gpu/drm/mediatek/mtk_dp.c:2982:28: error: no member named
 'usage_count' in 'struct dev_pm_info'
Message-ID: <202502060751.0NxnnscK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 044955e3eece16d9c50e1a693c197e4193399d72 [204/204] CHROMIUM: drm/mediatek: add eDP driver for mt8196
config: x86_64-buildonly-randconfig-003-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060751.0NxnnscK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060751.0NxnnscK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060751.0NxnnscK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp.c:2982:28: error: no member named 'usage_count' in 'struct dev_pm_info'
    2982 |                  atomic_read(&dev->power.usage_count));
         |                               ~~~~~~~~~~ ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:3136:37: error: no member named 'usage_count' in 'struct dev_pm_info'
    3136 |                 __func__, atomic_read(&dev->power.usage_count));
         |                                        ~~~~~~~~~~ ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   2 errors generated.


vim +2982 drivers/gpu/drm/mediatek/mtk_dp.c

  2973	
  2974	static int mtk_drm_dp_notifier(struct notifier_block *notifier,
  2975				       unsigned long pm_event, void *unused)
  2976	{
  2977		struct mtk_dp *mtk_dp = container_of(notifier, struct mtk_dp, nb);
  2978		struct device *dev = mtk_dp->dev;
  2979	
  2980		dev_dbg(mtk_dp->dev, "%s pm_event %lu dev %s usage_count %d\n",
  2981			 __func__, pm_event, dev_name(dev),
> 2982			 atomic_read(&dev->power.usage_count));
  2983	
  2984		switch (pm_event) {
  2985		case PM_SUSPEND_PREPARE:
  2986			mtk_dp_suspend(dev);
  2987			return NOTIFY_OK;
  2988		case PM_POST_SUSPEND:
  2989			mtk_dp_resume(dev);
  2990			return NOTIFY_OK;
  2991		}
  2992		return NOTIFY_DONE;
  2993	}
  2994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

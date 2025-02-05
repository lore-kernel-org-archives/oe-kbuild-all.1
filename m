Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC922144A7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 23:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799100; cv=none; b=mvrloxC88zuB3Qxriea7Yx+lkxXPj3IXoLiofyjv5HrcMUKJ9TDuamr6aQTb1aigWhWEQJfxYEwo3KqGBFmU69Q+LuFUkW5O8PEFOh5m4ZbA95kuyGC0L7Q/aBJpH+BHsBZkO/dOr2yNb4w/Kyo//I6KOfY97AumagGdS1A1CQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799100; c=relaxed/simple;
	bh=xBM48YRM7l1B82ztCE8w9C+zTAP5InjELmcTe5b3cCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLo427Peg9sSTfJhUaFJh7uhWtlxwMx8fEKfDBfXKoEiZxpz6KT2WQw5KexgryaRXnBecsAL3ILf2G/zD4NamM0B0UJUXT3WVoQ/81kW0VBssDM5MHv9DHP7Q7hompmHa21eIxNN2malnlfzM5Xyx52kPfd0i9Ahjt18VJnAEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNYmjBsg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNYmjBsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738799097; x=1770335097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xBM48YRM7l1B82ztCE8w9C+zTAP5InjELmcTe5b3cCI=;
  b=GNYmjBsgF70Z5XZVDWcKo9f+Ob7fMIZM2KXNpjBnn1LpheE/ktvdhwWV
   HXgTRm0WZNsxvNYUvrBIwl6LNWExdjHcoXUdLYoQgSIYz+Efn+KKr5PcI
   iY8xgqA/Bs98IIdjGyXJksEJmw5f/jphc5a0GxEkJifF++V23FyEIvKV3
   xDYI0rO/4l0i60xEFTOxqWIcP4sreBAgcHDP6OS84NUE0HQuoxVfWo968
   LYJuQbyLF20039lqtRn+s3sfjnkYDtaihDDy8jvZHvJxyQoXVfI/37tcU
   emuzVn1WALeZ0CrpWcDx/V2vBbjavxL5B80C72GtO0l+A3bSi3E9hEJmr
   g==;
X-CSE-ConnectionGUID: VsUMMF9gRnCS3lZGe/Pdgw==
X-CSE-MsgGUID: UbTaCpiNR4WY4oUk1cCOZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61860142"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="61860142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:44:57 -0800
X-CSE-ConnectionGUID: aktZLzfrRaCkM+hGpAHr4w==
X-CSE-MsgGUID: qcgFuaJwQzCqU4ftvreMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="141924350"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 15:44:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfp4f-000wE7-1n;
	Wed, 05 Feb 2025 23:44:53 +0000
Date: Thu, 6 Feb 2025 07:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 drivers/gpu/drm/mediatek/mtk_dp.c:2982:41: error: 'struct dev_pm_info' has
 no member named 'usage_count'
Message-ID: <202502060734.3kJZy0EI-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060734.3kJZy0EI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060734.3kJZy0EI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060734.3kJZy0EI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/drm/display/drm_dp_aux_bus.h:13,
                    from drivers/gpu/drm/mediatek/mtk_dp.c:7:
   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_drm_dp_notifier':
>> drivers/gpu/drm/mediatek/mtk_dp.c:2982:41: error: 'struct dev_pm_info' has no member named 'usage_count'
    2982 |                  atomic_read(&dev->power.usage_count));
         |                                         ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:2980:9: note: in expansion of macro 'dev_dbg'
    2980 |         dev_dbg(mtk_dp->dev, "%s pm_event %lu dev %s usage_count %d\n",
         |         ^~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_probe':
   drivers/gpu/drm/mediatek/mtk_dp.c:3136:50: error: 'struct dev_pm_info' has no member named 'usage_count'
    3136 |                 __func__, atomic_read(&dev->power.usage_count));
         |                                                  ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:3135:9: note: in expansion of macro 'dev_dbg'
    3135 |         dev_dbg(dev, "%s power.usage_count %d\n",
         |         ^~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c: At top level:
>> drivers/gpu/drm/mediatek/mtk_dp.c:423:12: warning: 'mtk_dp_suspend' used but never defined
     423 | static int mtk_dp_suspend(struct device *dev);
         |            ^~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp.c:424:12: warning: 'mtk_dp_resume' used but never defined
     424 | static int mtk_dp_resume(struct device *dev);
         |            ^~~~~~~~~~~~~


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

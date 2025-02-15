Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3EC1DF98C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739643619; cv=none; b=omkO2JnUkZ+wrXp0e5RAhusLo8w6ZG/Mtwd4bCN0fKN2crKSXBkDZmHj4EZ/gGYzDStqc9LruHyoylSxGtOf+TFigaSuOX+mGmklVO7YdLSaUSQ4NPhRuW2I/3U9CC/UlEzroSdYQqIl5fDZEg+EeB52mgMBxjCkQnYnq6Q0d90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739643619; c=relaxed/simple;
	bh=19Ft6icgs0In5+Jwu3aOmIz864zy4VOBuffE2yVtXmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDGzIpRlueedVETDwZm/sN/RR2P2MgM0ys2BW76Kg+Zu04j1lq7dyX3g4y0xj7u1ztli0eeHSwvpP6UQjWr33BpIZUWaEzOnaCRSh4K0Lz1gGeXwfGcpeYJWFkCSUfvJ2FBbFClRfLaFcRcB8F+zY+WRDuBhxOxN9GbektnAZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I68OX9Gp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I68OX9Gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739643618; x=1771179618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19Ft6icgs0In5+Jwu3aOmIz864zy4VOBuffE2yVtXmg=;
  b=I68OX9GpSGCpZpGnpcTU8qrAGfJ0xa6bBLfKCGCcVEdDl3e/TbmdD7pf
   H/4nf+Rf2eAKohvojYyQAAreq+5xeMjqC7MLWuwFKl0OslUx4q1a78CrE
   WnYE96uqZjxiXd9C+5VMiVWyIed/NBeAjVv8OORMIVk1feykOQtcGabAI
   J/9x+AjaVMuueuvGd4/hznZrAFiaJa0vjX+ejNfReolk4cFLYvdUzxVIp
   Vbd1R4VvieqRHAcfa49MYLLyRPLYGmGK9sq5suUkxYNbOyTwhdJGXZU9Z
   NNARzKtPnruSh2+Bir8P/KfCVv7cpfDY+Ou8OJ43aSQtOAe5m+y6/Vb3q
   w==;
X-CSE-ConnectionGUID: KlpwwzCqTraJrfeJJJI9gg==
X-CSE-MsgGUID: qqE0SlG0SxKBN71gDKIn2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40245668"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40245668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 10:20:17 -0800
X-CSE-ConnectionGUID: 9Nr18/BXR/OkuTLm9Nsb1A==
X-CSE-MsgGUID: Uw2EVSjyQQySWKGBnNN6bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113612654"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Feb 2025 10:20:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjMly-001B4Z-14;
	Sat, 15 Feb 2025 18:20:14 +0000
Date: Sun, 16 Feb 2025 02:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 0/5]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:5319:62: error: no member named
 'usage_count' in 'struct dev_pm_info'
Message-ID: <202502160226.NJ8NFcmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0d96e807079196f870dcef51ecf4bd53fb5472c1
commit: 8fd26707ff2ec98f3a31cafc54c74a1399171b24 [0/5] CHROMIUM: drm/mediatek: Add dp and dp_intf base
config: x86_64-buildonly-randconfig-002-20250215 (https://download.01.org/0day-ci/archive/20250216/202502160226.NJ8NFcmf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160226.NJ8NFcmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160226.NJ8NFcmf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dp_v2.c:8:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3370:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3370 |         u8 data;
         |            ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4285:36: warning: variable 'state' set but not used [-Wunused-but-set-variable]
    4285 |         struct drm_dp_mst_topology_state *state;
         |                                           ^
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:5319:62: error: no member named 'usage_count' in 'struct dev_pm_info'
    5319 |                 __func__, pm_event, dev_name(dev), atomic_read(&dev->power.usage_count),
         |                                                                 ~~~~~~~~~~ ^
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                        ^~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5324:3: error: call to undeclared function 'mtk_dp_suspend_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5324 |                 mtk_dp_suspend_v2(dev);
         |                 ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5327:3: error: call to undeclared function 'mtk_dp_resume_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5327 |                 mtk_dp_resume_v2(dev);
         |                 ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5327:3: note: did you mean 'mtk_dp_read_v2'?
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:315:5: note: 'mtk_dp_read_v2' declared here
     315 | u32 mtk_dp_read_v2(struct mtk_dp *mtk_dp, u32 offset)
         |     ^
   6 warnings and 3 errors generated.


vim +5319 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  5311	
  5312	static int mtk_drm_dp_notifier_v2(struct notifier_block *notifier,
  5313				       unsigned long pm_event, void *unused)
  5314	{
  5315		struct mtk_dp *mtk_dp = container_of(notifier, struct mtk_dp, notifier);
  5316		struct device *dev = mtk_dp->dev;
  5317	
  5318		dev_dbg(mtk_dp->dev, "%s pm_event %lu dev %s usage_count %d nb priority %d\n",
> 5319			__func__, pm_event, dev_name(dev), atomic_read(&dev->power.usage_count),
  5320			notifier->priority);
  5321	
  5322		switch (pm_event) {
  5323		case PM_SUSPEND_PREPARE:
  5324			mtk_dp_suspend_v2(dev);
  5325			return NOTIFY_OK;
  5326		case PM_POST_SUSPEND:
  5327			mtk_dp_resume_v2(dev);
  5328			return NOTIFY_OK;
  5329		}
  5330		return NOTIFY_DONE;
  5331	}
  5332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

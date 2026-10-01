Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088D1A6822
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898117; cv=none; b=YpDMuWEsuTo+yHcDVwsWjOlCFNGoOXV5kpMYykC4r1J/jdpdVmcGnDh+L3CcvU0BsduvWWw7IvUn8KiV/BkaWpkwtF88i8UViu7l11bqHKrVo/FuWpVnWuaD/bFPuV1s059p8FBPHFusLHba5D8AkhQr2qBEB0RKRb3yRMVQO60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898117; c=relaxed/simple;
	bh=uLnKFTJd8u5IG11NVGwvcQHL8/wRHeUpUvKoG9QuzJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wt5t0SKmmLwEhA9RWulE4dmYtFq/nUU2DWQrhI7/MEmPXs8oR5KsJ1eRkGoK1UjTNdds71srj70iCIS2f6We2PwrSxU8iwSuwqRH8ZG9bH6pZji7HuD1cIoRoJqW7e389NZNg7pW3wLY1QciHQsYKvEc33oWMBGEqfbSHJNXlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0oekfID; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0oekfID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790898115; x=1822434115;
  h=date:from:to:cc:subject:message-id;
  bh=uLnKFTJd8u5IG11NVGwvcQHL8/wRHeUpUvKoG9QuzJI=;
  b=d0oekfID/ci3AkjIHXWXpfW2HDdLNob9WObv74aDYnWdiM72d+GL+omF
   ptqZZHXDO0khuYLCLg918FGVZh7ofKJ+U+yhWtM3t61+eACW+fYsb21ha
   VfBqT2DmtDJbBJ4E7uwokt0bxKL5OVx1WfaeMyQO7VmWpzJkiAZF+jB46
   +IQWqxjNP97cPa1dg1dJ+4nA99dtPBOH7Ge/Nl/hgbSicwoAAbuaYeWfR
   UmbqXEvHYisyYzaBUWm+BNiB0qIVhXjjsx1k1IaKtepZjiLBAE4kCXmr2
   NkVxd6BpLchoRQZDGhDzs4Gjz6zw21VbtrpZwMoWPfSie29ts8ZJ7x4db
   A==;
X-CSE-ConnectionGUID: Id/3Y2pTQ2aSwH+PoTnoDA==
X-CSE-MsgGUID: fzoVpxXuRjGIXOHcJnk1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113453767"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="113453767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:41:55 -0700
X-CSE-ConnectionGUID: Khrg0gtVTGaaQB3XTHpLww==
X-CSE-MsgGUID: zk9E43D9Spewx90npa+bjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="272538107"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2026 16:41:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQPP-000000000HP-2q1x;
	Thu, 01 Oct 2026 23:41:51 +0000
Date: Fri, 02 Oct 2026 01:41:35 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 10/10]
 include/linux/p3s/mm.h:114:43: error: 'PMD_SIZE' undeclared; did you mean
 'EMSGSIZE'?
Message-ID: <202610020107.yZV5Lb3i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   691ade648ef6da4e746c0857a492d9b9cc1a5780
commit: 04fec2a54c421adc87f0b57f4d1ade2397f8f4ec [10/10] ANDROID: P3S: mm: Add per-MM page shift field and query APIs
config: arm-randconfig-r2307-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020107.yZV5Lb3i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020107.yZV5Lb3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020107.yZV5Lb3i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/p3s.h:6,
                    from include/linux/mm_types.h:1872,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/p3s/mm.h: In function 'mm_pmd_size':
>> include/linux/p3s/mm.h:114:43: error: 'PMD_SIZE' undeclared (first use in this function); did you mean 'EMSGSIZE'?
     return mm_is_p3s_4k(mm) ? PMD_SIZE_4KB : PMD_SIZE;
                                              ^~~~~~~~
                                              EMSGSIZE
   include/linux/p3s/mm.h:114:43: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/p3s/mm.h: In function 'mm_pgdir_size':
>> include/linux/p3s/mm.h:119:45: error: 'PGDIR_SIZE' undeclared (first use in this function); did you mean 'PGDIR_SIZE_4KB'?
     return mm_is_p3s_4k(mm) ? PGDIR_SIZE_4KB : PGDIR_SIZE;
                                                ^~~~~~~~~~
                                                PGDIR_SIZE_4KB
   make[3]: *** [scripts/Makefile.build:186: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=4153897143
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1313: prepare0] Error 2 shuffle=4153897143
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:266: __sub-make] Error 2 shuffle=4153897143
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:266: __sub-make] Error 2 shuffle=4153897143
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]


vim +114 include/linux/p3s/mm.h

   111	
   112	static inline unsigned long mm_pmd_size(const struct mm_struct *mm)
   113	{
 > 114		return mm_is_p3s_4k(mm) ? PMD_SIZE_4KB : PMD_SIZE;
   115	}
   116	
   117	static inline unsigned long mm_pgdir_size(const struct mm_struct *mm)
   118	{
 > 119		return mm_is_p3s_4k(mm) ? PGDIR_SIZE_4KB : PGDIR_SIZE;
   120	}
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

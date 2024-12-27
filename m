Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B901F8676
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735328191; cv=none; b=Gugaf6A349NHnktVF/2S9pNi2/gkMHk2i8EMO0jBX3ZQXNMOW4i9zyMfZsGQF3ihyfDEiKFaFawD+tXBWwGkagrrHWjGa72GfX67ceay6Gf3lweePlG+9nMtR4ugEZ+6TTLdAb89dNWiBDKtw0NwXM1qlj6J4Vz4vb7fYWZl/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735328191; c=relaxed/simple;
	bh=uxo5c4AgF+xDyfAHZhKmyav2ea7DWrvM+yudH/u/bV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIFRWrjN44PtmZDr09UKtJ82zOI3CyrnuN98PPlrh2Q7tgd6MnQni4vTG6a1P7ek4YVOAuKuICuMSP598eKM7XXHGFq2tKPP1h42mwz7F1I1jBdmZ4FFrBPuzKK05C18jOPiZ6kzx0qT0MgFivoqAW8tzdzeA482QckGnzcGDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2nlkuVa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2nlkuVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735328189; x=1766864189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uxo5c4AgF+xDyfAHZhKmyav2ea7DWrvM+yudH/u/bV0=;
  b=R2nlkuVa8/lCfgo83I6hy82zNdpaNoBJmuR4CZ8UcTTQ04smTRCkF3vj
   FSgKLAko8LEFP5t2uIwE42tt+Qj4ZL8ukztW2+e/aCo8QbDgKkG5k/D2o
   xd0mBh2l1wWu9cyeJIOZrSbomhtICyZ8JzEJbcykR3yaNHQ0OGMIoe7uP
   1Gpf2Jy73rQ/sRRolYGi7Hml4uW3UTQg4QS8UKNUOv064ybxCWp4nsffg
   8wbc25cXj0taAUjaaHs3q/HVugLO5T2eoPWadhbRRQdahFmyoP3+VjVrh
   WrL76eUXmmVjK/cFd3gEPXfWAc6ZFSK6D0s/vdC7YXyJYEXVxRCP8tA0f
   w==;
X-CSE-ConnectionGUID: Nx3tDONZT6i5tqVWVERRww==
X-CSE-MsgGUID: O1o/Zr59SsOr3sXPJGrn0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35632952"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35632952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 11:36:29 -0800
X-CSE-ConnectionGUID: Z0+D55iCQxKNT3wAiLGdzg==
X-CSE-MsgGUID: JYUD5C1pRcquV8MfoB4y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="99975408"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2024 11:36:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRG8H-0003X4-1v;
	Fri, 27 Dec 2024 19:36:25 +0000
Date: Sat, 28 Dec 2024 03:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: Raymond Tan <raymond.tan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>,
	N Pandith <pandith.n@intel.com>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3]
 drivers/gpio/gpio-ehl-pse-plat.c:79:6: warning: no previous prototype for
 function 'ehl_pse_gpio_free'
Message-ID: <202412280338.BeOO6LY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 98f388dc83f17d579f5684c021040f02269a7ebe [3/3] mfd: intel-ehl-gpio: Introduce MFD framework to PSE GPIO/TGPIO
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241228/202412280338.BeOO6LY5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280338.BeOO6LY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280338.BeOO6LY5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-ehl-pse-plat.c:15:
   In file included from include/linux/pci.h:1620:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
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
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
>> drivers/gpio/gpio-ehl-pse-plat.c:79:6: warning: no previous prototype for function 'ehl_pse_gpio_free' [-Wmissing-prototypes]
      79 | void ehl_pse_gpio_free(struct gpio_chip *chip, unsigned int offset)
         |      ^
   drivers/gpio/gpio-ehl-pse-plat.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | void ehl_pse_gpio_free(struct gpio_chip *chip, unsigned int offset)
         | ^
         | static 
   drivers/gpio/gpio-ehl-pse-plat.c:378:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     378 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   drivers/gpio/gpio-ehl-pse-plat.c:382:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     382 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   drivers/gpio/gpio-ehl-pse-plat.c:364:16: warning: unused variable 'base' [-Wunused-variable]
     364 |         void __iomem *base;
         |                       ^~~~
   7 warnings and 2 errors generated.


vim +/ehl_pse_gpio_free +79 drivers/gpio/gpio-ehl-pse-plat.c

    78	
  > 79	void ehl_pse_gpio_free(struct gpio_chip *chip, unsigned int offset)
    80	{
    81		/* decrease runtime_usage counter */
    82		pm_runtime_put_sync(chip->parent);
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

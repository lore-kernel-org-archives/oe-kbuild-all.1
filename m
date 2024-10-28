Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B9E193067
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106839; cv=none; b=VhoS7/LXV+T048D2oolBd/yrhHdKU1LcPuU6GS3hQZbdyGfdO9fHcYjTi49ueSKw4P20T5a7j1UeCf24F5TLw09D2/n76HWAwDyIe5hNnrL4GpUBnRR4tHYAcYLlxENhNK9lxE8M9nh0uDIN/d+/+f2DvUtj/cKdFeftggiq6/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106839; c=relaxed/simple;
	bh=/hXA8faSUjfr8MiFC2AULdAywn+AfDIcc8Chkbnw+2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVGbyRZW1J8zeetlQR+kq1iajXtZH37ytlMnpEpgzxdi1FNLL7axRofcGpzfnPJ8YkKBIr0IrHYp2NVdlAbzUx9SEiiLQYNKMHnDZg8m2O4AsSdmYgjHV8Qt8kLCCxf5TgJI3nxtt1/uj4nN5htHMGyjZLy5Jfuq9yvb1Av0/dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7AM36nc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7AM36nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730106835; x=1761642835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hXA8faSUjfr8MiFC2AULdAywn+AfDIcc8Chkbnw+2Y=;
  b=T7AM36nc+KOtbbTnuxYbi59bCE7UqkIrzMI9LLvpGcPFYhobogUABNBe
   60soS1/d/7q37lLDiq4gnZJzIH7R/jn56kh+b2kTWIlZJN8PO6KjZL71L
   hSUHX0aUUti8rgA0kETPP0sJezmh9pzRBGBamp73iTFuf+PMvcNFlX3vF
   VnwaZ7zLR0Ps5hPMsfaM+K5O6sjK9fS2qQ05Kz5/oxr4//ZBuAkenqYU2
   V4cvIEAjsAdFuUAIPVgdcDwjIFXQKg946q57IRV4PzA4YRLrF8TSJ3ilz
   F7FcCcEQg3BR8LfgjMQMURv1JDRPxUnj7RV03+MCNuOjQc2zEp5qtEI+B
   w==;
X-CSE-ConnectionGUID: ECxK7RvrRAaHe4lEPwsSvQ==
X-CSE-MsgGUID: TSRTEndAQ3Cu5LWx+o4Yew==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33607016"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33607016"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:13:49 -0700
X-CSE-ConnectionGUID: qP8JEP4eQfiXXOmbNqEfZg==
X-CSE-MsgGUID: CNZZlbkAT8+/PUJfyFrbRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86130241"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 02:13:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Lon-000cFE-2y;
	Mon, 28 Oct 2024 09:13:45 +0000
Date: Mon, 28 Oct 2024 17:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 25/70]
 drivers/net/pcs/pcs-standalone.c:14:29: warning: unused variable
 'phylink_pcs_phy_ops'
Message-ID: <202410281743.HHhHvVTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   edb2a7a8be4be71a6502d19afd5b069f6d9fbacc
commit: e463a192fd60cc4effbb14a09282fd8232bad3d9 [25/70] net: pcs: add helper module for standalone drivers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241028/202410281743.HHhHvVTm-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281743.HHhHvVTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281743.HHhHvVTm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/pcs/pcs-standalone.c:8:
   In file included from include/linux/pcs/pcs-standalone.h:6:
   In file included from include/linux/phylink.h:4:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/pcs/pcs-standalone.c:14:29: warning: unused variable 'phylink_pcs_phy_ops' [-Wunused-const-variable]
      14 | static const struct phy_ops phylink_pcs_phy_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/phylink_pcs_phy_ops +14 drivers/net/pcs/pcs-standalone.c

    13	
  > 14	static const struct phy_ops phylink_pcs_phy_ops = {
    15		.owner = THIS_MODULE,
    16	};
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

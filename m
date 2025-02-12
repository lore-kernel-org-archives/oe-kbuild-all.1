Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A41FC7D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345482; cv=none; b=XfhKMkHdmezsAIoJiaV5eUiJ2L8xh9AQjq/OVkXrFztMhU7dFCaKCuGgVpV7iXpqL6jrSswYWddIFI71tCKTlCCqRouW2EU6vD4kMgK6LXWLO5KHXCWvvEnbiYsMXDawh8fC0kCMJ5tb9Gg1Y+SzAsZlCyjwmZ0dEQCxW3zzopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345482; c=relaxed/simple;
	bh=euyO2F9in+l6fdZ4vD1rWL64ohL0Bz7f5RhMyDkKHgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCq2bSuq3LI5uXBAJXlMvMBfzVn8OQjNXN8ATZoM/Qis/Jkbp7u2B3BMraC3XKlpzHItwjBLZHS8dTvoKKAqxJ9yR7/5wgimxXGMdMg/gZ8+9rjKK+f19e3eQviymxs33cS2r0qITwbFqCTCsgW+2g3MENFnAXxBWcsoYWQjFqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJQJwV/0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJQJwV/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739345480; x=1770881480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=euyO2F9in+l6fdZ4vD1rWL64ohL0Bz7f5RhMyDkKHgs=;
  b=nJQJwV/0/o67qHpnu5L2Hd/ggcEMDmPIN9P41U9kusLFRsKVRyXExDOd
   zDYBg7Rs5rJOs6ssDpdCO69IUTh5E+khjBEJj4QFL6ddAXrP9NVQBBSB3
   UX92h1YuM4AT1x/aZgwBq09TBglX797Q1UY1uBdOUhR6AY8xXuXjHz0Ni
   eYLjHZ9dGEnbXE2/gaAX0HAt4kupzIPFJe1yjFf2h1iVUP4bSJAwfykbI
   tf1OxynmQNdvv0dwdjzkxO1rXdI5eZPSuHXmRYzbdrPG10WFWKRl9pG25
   CDVnf6BDYBv93SJVhENiHO4ayLqkwZEwieqEbE4118z6p5CrN41glMnPA
   w==;
X-CSE-ConnectionGUID: RHusrYU0SYeRS+VtQJ8mZg==
X-CSE-MsgGUID: 6wG4GdnaTW+y0QoyJAvsEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62454989"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="62454989"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:31:17 -0800
X-CSE-ConnectionGUID: RFijOWxEToyPd8UCgMlQdQ==
X-CSE-MsgGUID: DKmkUxVqTcKzrv/KjY/Tpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117922629"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2025 23:31:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti7DF-0015I8-2G;
	Wed, 12 Feb 2025 07:31:13 +0000
Date: Wed, 12 Feb 2025 15:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2738/2738]
 include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough'
 not preceding a case label or default label
Message-ID: <202502121559.DteGFyD7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   83b361e2942e85c04f931c63e78bc54215a2db25
commit: 0695e18bbaebbfbe22b049104bbb9a4300a9f30c [2738/2738] mm: Add PMU based memory sampling abstract layer
config: arm64-randconfig-r054-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121559.DteGFyD7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121559.DteGFyD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121559.DteGFyD7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:65,
                    from <command-line>:
   drivers/arm/spe/spe.c: In function '__arm_spe_dev_probe':
>> include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough' not preceding a case label or default label
     221 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   drivers/arm/spe/spe.c:492:17: note: in expansion of macro 'fallthrough'
     492 |                 fallthrough;
         |                 ^~~~~~~~~~~
>> include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough' not preceding a case label or default label
     221 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   drivers/arm/spe/spe.c:514:17: note: in expansion of macro 'fallthrough'
     514 |                 fallthrough;
         |                 ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING
   Depends on [n]: ARM64 [=y] && !ARM_SPE_PMU [=y]
   Selected by [y]:
   - MEM_SAMPLING [=y] && ARM64 [=y]
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: AARCH32_EL0 [=n]
   Selected by [y]:
   - ARCH_MXC [=y] && COMPAT [=y]


vim +/fallthrough +221 include/linux/compiler_attributes.h

294f69e662d157 Joe Perches  2019-10-05  209  
294f69e662d157 Joe Perches  2019-10-05  210  /*
294f69e662d157 Joe Perches  2019-10-05  211   * Add the pseudo keyword 'fallthrough' so case statement blocks
294f69e662d157 Joe Perches  2019-10-05  212   * must end with any of these keywords:
294f69e662d157 Joe Perches  2019-10-05  213   *   break;
294f69e662d157 Joe Perches  2019-10-05  214   *   fallthrough;
294f69e662d157 Joe Perches  2019-10-05  215   *   goto <label>;
294f69e662d157 Joe Perches  2019-10-05  216   *   return [expression];
294f69e662d157 Joe Perches  2019-10-05  217   *
294f69e662d157 Joe Perches  2019-10-05  218   *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
294f69e662d157 Joe Perches  2019-10-05  219   */
294f69e662d157 Joe Perches  2019-10-05  220  #if __has_attribute(__fallthrough__)
294f69e662d157 Joe Perches  2019-10-05 @221  # define fallthrough                    __attribute__((__fallthrough__))
294f69e662d157 Joe Perches  2019-10-05  222  #else
294f69e662d157 Joe Perches  2019-10-05  223  # define fallthrough                    do {} while (0)  /* fallthrough */
a3f8a30f3f0079 Miguel Ojeda 2018-08-30  224  #endif
a3f8a30f3f0079 Miguel Ojeda 2018-08-30  225  

:::::: The code at line 221 was first introduced by commit
:::::: 294f69e662d1570703e9b56e95be37a9fd3afba5 compiler_attributes.h: Add 'fallthrough' pseudo keyword for switch/case use

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4972FB6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727542650; cv=none; b=PCnWNyi0buCfPr5902XCHpL4rD9ZXitEKCcjj3NRCzZ8yBlic+LqMT5EpDy9optOXdybawa3CiUk6xjJUrws7anCnN3j8tDrWtW3PGnlQEUNsBg/NeCKOeakygW/jV3wEDA9pRCG2FdkNPdoDv8HYdNEcViJ17x2Rg//LpPwKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727542650; c=relaxed/simple;
	bh=vokJ2zZZkg121YPBwyXKdsDgk6VB4eg9tRDNskAID1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1CWulIhvENBeG15jNdiaRzKz63G+BYw2Ro7Gk5Zbbupcklnae9ibTrOxAmhlENHCy4sjnL20U4wTgW7VeciLREUNZ5ehrAsEL+Qep20JKlOAR/8njGbLMEkcvwVzNbrHoj6WSJBCTPg1LuVyvV7WEkksL5TfAjcz22q+lQ7GHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtJCrOui; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtJCrOui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727542649; x=1759078649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vokJ2zZZkg121YPBwyXKdsDgk6VB4eg9tRDNskAID1M=;
  b=BtJCrOuiLQNHCUBGR1pBV49hZitl1rZlqVKnVO3BIEUsGMDp5meHqbbJ
   Y0gh8FZuVheHNluGN0W4PpbAqhYVFxPCiaIqDPzYfngEGoBFAXgvA+dT8
   TG6fzJCrEgKuKLQ3FK3l5s+UiaSjZ0Dwwxk5gF9mTLs6fbVjRH7BUzDeq
   uYpuKNzyWRj6LNaWC6YuqaaJmyk6hNjNYsLC8A9WXmcXlIpDgCqtq26jD
   1oxuwSUjS0BAlNPTH0Sb80jL4UX+7f2Cgu0L+cKobWg6O8qnPWh5GYIdP
   9fJzwnzO+8+9nafGILybi50JvLs8tZs4nGiCxQl3xMlOyMUH0+8vwA2Ez
   g==;
X-CSE-ConnectionGUID: AAM++jEJRres2HS6h5IC8A==
X-CSE-MsgGUID: vyL7OfKiRQi8FYaN828OJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30560882"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30560882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:57:26 -0700
X-CSE-ConnectionGUID: AbxjHc+YRpKPSrjLCnx8pA==
X-CSE-MsgGUID: LTadvmaRRHKj6xTb7YqueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103631450"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2024 09:57:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sual0-000NTF-1D;
	Sat, 28 Sep 2024 16:57:22 +0000
Date: Sun, 29 Sep 2024 00:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27588/30000]
 include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough'
 not preceding a case label or default label
Message-ID: <202409290030.UdfZl3fZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 0695e18bbaebbfbe22b049104bbb9a4300a9f30c [27588/30000] mm: Add PMU based memory sampling abstract layer
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290030.UdfZl3fZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290030.UdfZl3fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290030.UdfZl3fZ-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG
   Depends on [n]: NET [=n] && BPF_SYSCALL [=n]
   Selected by [y]:
   - SCHED_TASK_RELATIONSHIP [=y] && CGROUPS [=y] && NUMA_BALANCING [=y]


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

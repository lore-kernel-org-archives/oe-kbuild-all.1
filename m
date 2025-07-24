Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0E1E5B7A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753330349; cv=none; b=ABp5IdWfDS5KrArhRGDhw8cogIoNFJmeJ2I3pPwQ1RYEy3tY3fG0SabVLfrg8Sa8Rkh0eoDbKvlAcudYriRGKeRAtdmCMV5lwYBA6DKnP2uvRZOnKY51jJBfP/dLaqc5oUKD3XgMtkFxPzfZPQqUDeGh8xy0ra28ySFvMrbvNeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753330349; c=relaxed/simple;
	bh=XL3bgDmrhkYLb1nXwtzp8NNm+V0WWdrnI9Sg0rbMYww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s20VYLEwlIdFhc2me8Swefq7RNezxGmAHwRg145T35waz0TXF8ztaNos+wrVWQC7u+v0OzinhRee53T3ExGTJh1viOlfBl+LhBla6qiZh9Ww0oEvOlRmr5j43+XQDnw7F8CnFLTvjP5oe/iWjYuhZZA+7ZScFpJH5eZIZmeznXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxb1v7fe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxb1v7fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753330347; x=1784866347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XL3bgDmrhkYLb1nXwtzp8NNm+V0WWdrnI9Sg0rbMYww=;
  b=hxb1v7fe/ahCbZwKMlo0saqOwX/nNEe+fae7EWtLtqvaj+etSDNU8uQU
   1gLgwTP4XeIZmQJhEWZcAqHW78Tg5IoCVZTX5BNzfi7Ls0/VWrTEvPDEi
   V7mPRxV63iM0BTvs9/OPcyz5xy+dkeJt0gbv3JBgth0/YREWr8tnCGUsc
   UTZ1SLfwDhr+zZGmdhknrxkNyKlJZtt3Yk05aFufE5UDdHS4hzc7bWPBf
   cys+jyFzLmToKw6IFVvutLiA0fauaJ7yWT0eg/ETgIJRWITqQQXIT3udj
   6M1dtxrB/XBbPh0o9g/kyOJ230FJUj87DkQEke+mlaxVo0t59IomTs6ZA
   A==;
X-CSE-ConnectionGUID: 6HBBTityRn6oMmz9ADUSeQ==
X-CSE-MsgGUID: tWEk7JxeT0K3Sj4cjCeTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78165373"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="78165373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 21:12:27 -0700
X-CSE-ConnectionGUID: BP3TZj2oRICllLpZLD1lkw==
X-CSE-MsgGUID: G3tKTLmITgavShnx/FmADg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160336034"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jul 2025 21:12:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uenJg-000K47-0V;
	Thu, 24 Jul 2025 04:12:24 +0000
Date: Thu, 24 Jul 2025 12:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-6.16.0-rc5 62/77] kernel/sched/fair.c:90:50:
 error: 'CONFIG_MIN_BASE_SLICE_NS' undeclared here (not in a function)
Message-ID: <202507241259.ctbdYsc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-6.16.0-rc5
head:   8a7f181d5501fa73b17dcb76340908f033b61b88
commit: e9c2688b128a46792eb108d001cd0e56b247cf27 [62/77] linux6.15.y-bore5.9.6
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250724/202507241259.ctbdYsc2-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241259.ctbdYsc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241259.ctbdYsc2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:90:50: error: 'CONFIG_MIN_BASE_SLICE_NS' undeclared here (not in a function)
      90 | unsigned int sysctl_sched_min_base_slice       = CONFIG_MIN_BASE_SLICE_NS;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_MIN_BASE_SLICE_NS +90 kernel/sched/fair.c

    80	
    81	/*
    82	 * Minimal preemption granularity for CPU-bound tasks:
    83	 *
    84	 * BORE : base_slice = minimum multiple of nsecs_per_tick >= min_base_slice
    85	 * (default min_base_slice = 2000000 constant, units: nanoseconds)
    86	 * EEVDF: default 0.75 msec * (1 + ilog(ncpus)), units: nanoseconds
    87	 */
    88	#ifdef CONFIG_SCHED_BORE
    89	static const unsigned int nsecs_per_tick       = 1000000000ULL / HZ;
  > 90	unsigned int sysctl_sched_min_base_slice       = CONFIG_MIN_BASE_SLICE_NS;
    91	__read_mostly uint sysctl_sched_base_slice     = nsecs_per_tick;
    92	#else // !CONFIG_SCHED_BORE
    93	unsigned int sysctl_sched_base_slice			= 700000ULL;
    94	static unsigned int normalized_sysctl_sched_base_slice	= 700000ULL;
    95	#endif // CONFIG_SCHED_BORE
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

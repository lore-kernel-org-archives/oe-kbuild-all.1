Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF973845D3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658103; cv=none; b=Yc0h3HwqAqVfhIklwP8UWl3QRoRSIkSgkAYkt4HdstHqvCYWuqt8FgjO6OPXLUXByqxsG99X25xKq7e77R9XxK3gDPKWzmORVUAft1n1MwVOf6tC5Oxg4uoB1nUPUTgOB4ApfE6TSvac4MJK1OFLu8/oKyywvTBZVjS8jngB9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658103; c=relaxed/simple;
	bh=24ZiRbbnZ7RZ3joa+4q7RDQbXVCRdgGC3FgLfqg7+30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BGsxeLE6xe77lIpcfKwTqGEApb1mP0F34k0iKVaPfp5s/VMFV258RHYTNV1mDb6JE2iYvWx90MVu3m13ZcrY1twSCSaA/oJOb1+KqZXADxVAodW02Gyp104ogIjzt3EBuAewwIcCtgADMXs7rSN5tLZpozsJYqvWYL4XOG+TLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUCIYCSx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUCIYCSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772658098; x=1804194098;
  h=date:from:to:cc:subject:message-id;
  bh=24ZiRbbnZ7RZ3joa+4q7RDQbXVCRdgGC3FgLfqg7+30=;
  b=fUCIYCSxmlIgdbCI4KVQFMNpITMKVP/pOEI+rckGj2peE7pYWH3D0pBs
   tSo4BQuAeuvRXTQNrO2gw5HhDGvHoRGG5QIgDX3YeQFqIMUW+hMgmM5cR
   9INz3Vg8QXt+LGZSyNRDYdWZsx+UWYqePHyg/YuNRVFBKBx0hCACM9LXV
   v5sLmV4Z7KoXzQNmfrDbBE9+uT9AlSDezbtnOIeShmguMdaPCCI/W/o90
   RX3zJ6q4rg62VCN1MkMBNAfC9WlX7/vesckUXD0u3FXwO7QaIRI2gkmOA
   lh3zd4BzmLpJrLwNA6JfmOCwJeaAws8gscQGZHlazHr/i6fiF22uJcMyg
   w==;
X-CSE-ConnectionGUID: fa78ymL0QSeEJXWUPTWSzw==
X-CSE-MsgGUID: E9kS0GNrQPayCdN4y+d19g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73703311"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73703311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:01:32 -0800
X-CSE-ConnectionGUID: R3Ey9UBIT2iDtyQsmepVPQ==
X-CSE-MsgGUID: IJrbkZhxR8C9a7lkXqRRqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216762354"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 13:01:30 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxtLU-000000004V1-23Rj;
	Wed, 04 Mar 2026 21:01:28 +0000
Date: Thu, 05 Mar 2026 05:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 3/15]
 drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202603050431.u0SFtMGI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   f2fc589840b1a727d4318cd5e9fc99d23fb3a35c
commit: dfc4eb80c8c09275300ca735948399e8cc73c91f [3/15] hwspinlock: add helpers to retrieve core data
config: microblaze-randconfig-r121-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050431.u0SFtMGI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050431.u0SFtMGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050431.u0SFtMGI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse:     expected void [noderef] __iomem *addr
   drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse:     got void *
>> drivers/hwspinlock/sprd_hwspinlock.c:62:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/sprd_hwspinlock.c:62:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sprd_hwspinlock.c:62:55: sparse:     got void *
   drivers/hwspinlock/sprd_hwspinlock.c:128:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/sprd_hwspinlock.c:128:28: sparse:     expected void *priv
   drivers/hwspinlock/sprd_hwspinlock.c:128:28: sparse:     got void [noderef] __iomem *
--
>> drivers/hwspinlock/stm32_hwspinlock.c:30:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/stm32_hwspinlock.c:30:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:30:55: sparse:     got void *
   drivers/hwspinlock/stm32_hwspinlock.c:41:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/stm32_hwspinlock.c:41:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:41:55: sparse:     got void *
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     expected void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     got void [noderef] __iomem *
--
>> drivers/hwspinlock/omap_hwspinlock.c:40:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/omap_hwspinlock.c:40:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/omap_hwspinlock.c:40:55: sparse:     got void *
   drivers/hwspinlock/omap_hwspinlock.c:48:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/omap_hwspinlock.c:48:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/omap_hwspinlock.c:48:55: sparse:     got void *
   drivers/hwspinlock/omap_hwspinlock.c:120:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/omap_hwspinlock.c:120:36: sparse:     expected void *priv
   drivers/hwspinlock/omap_hwspinlock.c:120:36: sparse:     got void [noderef] __iomem *
--
>> drivers/hwspinlock/sun6i_hwspinlock.c:65:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:65:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sun6i_hwspinlock.c:65:55: sparse:     got void *
   drivers/hwspinlock/sun6i_hwspinlock.c:72:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:72:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sun6i_hwspinlock.c:72:55: sparse:     got void *
   drivers/hwspinlock/sun6i_hwspinlock.c:166:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:166:30: sparse:     expected void *priv
   drivers/hwspinlock/sun6i_hwspinlock.c:166:30: sparse:     got void [noderef] __iomem *

vim +44 drivers/hwspinlock/sprd_hwspinlock.c

    38	
    39	/* try to lock the hardware spinlock */
    40	static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
    41	{
    42		struct sprd_hwspinlock_dev *sprd_hwlock =
    43			dev_get_drvdata(hwspin_lock_get_dev(lock));
  > 44		void __iomem *addr = hwspin_lock_get_priv(lock);
    45		int user_id, lock_id;
    46	
    47		if (!readl(addr))
    48			return 1;
    49	
    50		lock_id = hwlock_to_id(lock);
    51		/* get the hardware spinlock master/user id */
    52		user_id = readl(sprd_hwlock->base + HWSPINLOCK_MASTERID(lock_id));
    53		dev_warn(sprd_hwlock->bank.dev,
    54			 "hwspinlock [%d] lock failed and master/user id = %d!\n",
    55			 lock_id, user_id);
    56		return 0;
    57	}
    58	
    59	/* unlock the hardware spinlock */
    60	static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
    61	{
  > 62		void __iomem *lock_addr = hwspin_lock_get_priv(lock);
    63	
    64		writel(HWSPINLOCK_NOTTAKEN, lock_addr);
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

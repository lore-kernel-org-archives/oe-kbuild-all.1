Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ACF3DE427
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945416; cv=none; b=PF5Ga4Oj2KaOFKPcFmR42kNkDgVd9daYK+WSWzeswE2o2A54sP09XwZBSKWMRTdxS91KcTz6qpgI8RTvPZ4uGaoQeGP+d6qr8qudY/qlQF9uW4fJ5Ii4Re1BbY8L2r5p6aSh+mPGAZJe685kP4NogFL1DValqWGhHKeXK54lLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945416; c=relaxed/simple;
	bh=AAtMcF0JjoWQne8dsNDExCP+y+d7uKu1pWfDQ6zFYkE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kPBz6wlwvn14QBrz1oORT/mEOjiUHIdR7wUb9Gd2gO5x9F+RFSxZAcEVdrog2fjEwrqyIDx++D5JadEKTh257/PJz3ghx4TrG5IQW4C2u7O5OAU2+Abo/74wY93H54zTXRxJbysQU0ezYeoGBYPw4KlvM4tKg2DEP2iifLhi/ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Po5riiI3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Po5riiI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774945414; x=1806481414;
  h=date:from:to:cc:subject:message-id;
  bh=AAtMcF0JjoWQne8dsNDExCP+y+d7uKu1pWfDQ6zFYkE=;
  b=Po5riiI3JQQwFci8jIZ61Sz5pdjpxlhL9lpGVk5M/zZJLyh9vMw0IpTl
   wrH4MBuUyrOOlAGAX9X1FnuJOFYIu3WXU2+65tEe4YXY1zowOgWs5+Bh2
   Wg5O9yp9hBHPHYMBb2jv9uCNzutc+hlNoq38WH6d+0zGfdyQOe5zq+nXA
   xgwwluwY6c60Rk+1UuhNURM6p2/5+63uB2E5yhFQhLil4+dFGEAKEUYxt
   NpjEr7RNezOoBYvGJziv7w2uTn/p+Dzy2Nt8JDutbs6l+eNACKKGp0LcB
   9CmSWN73Ey4hAZq301iWj1fi3q3Ga9dFYHoI144p6dXX77oEotw+wCLCV
   A==;
X-CSE-ConnectionGUID: UavioBNxQpqca452G/RHSg==
X-CSE-MsgGUID: hwInk3ecRKqaqjA09OeQtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93533769"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93533769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:23:32 -0700
X-CSE-ConnectionGUID: lM453xl2Q+CSlwVlm3zGaQ==
X-CSE-MsgGUID: gv96M34TQH+XZ6Ob9n5jRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230757659"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 01:23:30 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7UNk-000000002Pl-0WKK;
	Tue, 31 Mar 2026 08:23:28 +0000
Date: Tue, 31 Mar 2026 16:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/clocksource/arm_arch_timer_mmio.c:256:56: sparse: sparse: cast
 truncates bits from constant value (ffffffffffffff becomes ffffffff)
Message-ID: <202603311636.lI2BhPM0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   70d782f4da1aeb013fe0895d897d888b5d91754e
commit: 0f67b56d84b4c49adfd61f19f81f84ec613ab51a [2/2] clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver
config: arm-randconfig-r133-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311636.lI2BhPM0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311636.lI2BhPM0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311636.lI2BhPM0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/arm_arch_timer_mmio.c:256:56: sparse: sparse: cast truncates bits from constant value (ffffffffffffff becomes ffffffff)

vim +256 drivers/clocksource/arm_arch_timer_mmio.c

4891f01527bbbb Marc Zyngier 2025-08-14  238  
4891f01527bbbb Marc Zyngier 2025-08-14  239  static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
4891f01527bbbb Marc Zyngier 2025-08-14  240  {
4891f01527bbbb Marc Zyngier 2025-08-14  241  	at->evt = (struct clock_event_device) {
4891f01527bbbb Marc Zyngier 2025-08-14  242  		.features		   = (CLOCK_EVT_FEAT_ONESHOT |
4891f01527bbbb Marc Zyngier 2025-08-14  243  					      CLOCK_EVT_FEAT_DYNIRQ),
4891f01527bbbb Marc Zyngier 2025-08-14  244  		.name			   = "arch_mem_timer",
4891f01527bbbb Marc Zyngier 2025-08-14  245  		.rating			   = 400,
4891f01527bbbb Marc Zyngier 2025-08-14  246  		.cpumask		   = cpu_possible_mask,
4891f01527bbbb Marc Zyngier 2025-08-14  247  		.irq 			   = irq,
4891f01527bbbb Marc Zyngier 2025-08-14  248  		.set_next_event		   = arch_timer_mmio_set_next_event,
4891f01527bbbb Marc Zyngier 2025-08-14  249  		.set_state_oneshot_stopped = arch_timer_mmio_shutdown,
4891f01527bbbb Marc Zyngier 2025-08-14  250  		.set_state_shutdown	   = arch_timer_mmio_shutdown,
4891f01527bbbb Marc Zyngier 2025-08-14  251  	};
4891f01527bbbb Marc Zyngier 2025-08-14  252  
4891f01527bbbb Marc Zyngier 2025-08-14  253  	at->evt.set_state_shutdown(&at->evt);
4891f01527bbbb Marc Zyngier 2025-08-14  254  
4891f01527bbbb Marc Zyngier 2025-08-14  255  	clockevents_config_and_register(&at->evt, at->rate, 0xf,
4891f01527bbbb Marc Zyngier 2025-08-14 @256  					(unsigned long)CLOCKSOURCE_MASK(56));
4891f01527bbbb Marc Zyngier 2025-08-14  257  
4891f01527bbbb Marc Zyngier 2025-08-14  258  	enable_irq(at->evt.irq);
4891f01527bbbb Marc Zyngier 2025-08-14  259  }
4891f01527bbbb Marc Zyngier 2025-08-14  260  

:::::: The code at line 256 was first introduced by commit
:::::: 4891f01527bbbb0cf0e515c803ade67a17e247bb clocksource/drivers/arm_arch_timer: Add standalone MMIO driver

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

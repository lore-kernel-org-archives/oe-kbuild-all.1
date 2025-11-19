Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6235581F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555691; cv=none; b=eI8d1juhZr+bhNLJpKpMxgkIu1BxlnzogBwc7NuMlx872yRfCzKFOfd0YHL3nfmoVGTmxw3llNyQsHQOWHlhlMOTS0w1cJSzBMOe3sd9X6mfV0LAQbGuAtwX35IznhrjooiFbiVOn368vgkTgqkGCnC90ZaD6tLr5udZdYhxaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555691; c=relaxed/simple;
	bh=iP0th/Ivf2/tis71kTz1hzdFd59Z0ymqvykIAn3v5nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZFjfgF4B23m5xhvFQ6V/CSE6Kz5dHJLc2KuF3Vrg+z4nNf8PTgGoS/9ig8arLP57wbyXdEYcAnqVW9l5sHNRnIASBfIX+ozG1ELeDq65m6FPht80UN4Va7Y9h//rHm8AU5gj7iXMVQ71WiQ9jCv77K1uu8KYIR0+LKEHIksdNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKsD/rkb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKsD/rkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763555690; x=1795091690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iP0th/Ivf2/tis71kTz1hzdFd59Z0ymqvykIAn3v5nc=;
  b=CKsD/rkb9A/1v9/YuyUdhSqtVKQkDtX2jvM4CkD61WzQ27ENX1Z3tObo
   qG37hlxX6ngTr2z897t8K2VfKvNxDHZPyt+ORVLnhWHHHOyfyMn0n6NnZ
   BI8aFKBo9Dw016jtG1McNxyQNup9zaBal8y1tCawNsWU4YEVPKdbiy0bn
   DrCW5eFCfyGQ8LzXNb7P9QOi2sKyMXcu1bImZQT7hSBkXajul8TBhz6hb
   ucdboks7DuCDyES4fZwgqaZO++04WcC3UYxr2+lQHUOHLMLUa24uYwM0p
   kFRQF8Z72JFvl55nVzcWWDO0qClPwTLwnSPd6B7w9xK4hM/2LSSVk30Jx
   g==;
X-CSE-ConnectionGUID: eiwShCt/S3qAbDhc5Z2bpQ==
X-CSE-MsgGUID: nTHEuVS6Sce2tcnGRpetqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65751407"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65751407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:34:50 -0800
X-CSE-ConnectionGUID: qs2UXLbDThSnvllpcN/qSw==
X-CSE-MsgGUID: ywjHJ6cRR7iqsdsNPUL14g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228385527"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 04:34:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLhOU-0002sV-37;
	Wed, 19 Nov 2025 12:34:42 +0000
Date: Wed, 19 Nov 2025 20:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hao-Wen Ting <haowen.ting@realtek.com>, daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, jinn.cheng@realtek.com,
	edwardwu@realtek.com, phelic@realtek.com,
	shawn.huang724@realtek.com, haowen.ting@realtek.com,
	cy.huang@realtek.com, james.tai@realtek.com, cylee12@realtek.com,
	phinex@realtek.com, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stanley_chang@realtek.com
Subject: Re: [PATCH v3 2/2] clocksource: Add Realtek systimer as tick
 broadcast driver
Message-ID: <202511192029.jlDLXPI0-lkp@intel.com>
References: <20251117073408.428190-3-haowen.ting@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117073408.428190-3-haowen.ting@realtek.com>

Hi Hao-Wen,

kernel test robot noticed the following build errors:

[auto build test ERROR on 948b99877bf5a1cd58bee930e455b7574daba5c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Wen-Ting/dt-bindings-timer-Add-Realtek-SYSTIMER/20251117-153806
base:   948b99877bf5a1cd58bee930e455b7574daba5c3
patch link:    https://lore.kernel.org/r/20251117073408.428190-3-haowen.ting%40realtek.com
patch subject: [PATCH v3 2/2] clocksource: Add Realtek systimer as tick broadcast driver
config: arm-randconfig-001-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192029.jlDLXPI0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192029.jlDLXPI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511192029.jlDLXPI0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clocksource/timer-realtek.o: in function `rtk_syst_clkevt_next_ktime':
>> drivers/clocksource/timer-realtek.c:79: undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: drivers/clocksource/timer-realtek.c:86: undefined reference to `__aeabi_ldivmod'


vim +79 drivers/clocksource/timer-realtek.c

    71	
    72	static int rtk_syst_clkevt_next_ktime(ktime_t expires,
    73					      struct clock_event_device *clkevt)
    74	{
    75		u64 cmp_val;
    76		unsigned long flags;
    77		ktime_t now = ktime_get();
    78		s64 delta_ns = ktime_to_ns(ktime_sub(expires, now));
  > 79		u64 delta_us = delta_ns / 1000;
    80	
    81		pr_debug("delta_ns = %lld, clkevt.min_delta_ns = %llu\n",
    82			 delta_ns, clkevt->min_delta_ns);
    83	
    84		if (delta_ns <= (s64)clkevt->min_delta_ns) {
    85			delta_ns = clkevt->min_delta_ns;
  > 86			delta_us = delta_ns / 1000;
    87			pr_debug("Clamping delta_ns to min_delta_ns\n");
    88		}
    89	
    90		rtk_cmp_en_write(DSBL);
    91		local_irq_save(flags);
    92		cmp_val = rtk_ts64_read();
    93	
    94		/* Set CMP value to current timestamp plus delta_us */
    95		rtk_cmp_value_write(cmp_val + delta_us);
    96		rtk_cmp_en_write(ENBL);
    97		local_irq_restore(flags);
    98		return 0;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

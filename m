Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795820522;
	b=scWWpsjYy5luI+Bu7jdOl08h2brSTQdNg84ulSVlTzpUtzjoHtV+IIhiAbc6j2vNNyl4
	 ZPkpAeJJpB+JrEPXlj2KOi9ItvRi42egNGAF6/voNGoCTAq5anZXIMJK6Dp6pSDm1RC0h
	 AHYWFfw0uJPlwHhZbn+eVZCXbFBt0S0eYQu5aSfz3I9ikeI/GyxnEumeBjbStUJkYRwzJ
	 EWQWbK8P5okhE6ZCuTna412MPLPj9cdi20Msb1+wXQD2pIXMxEfll5ar+qDg5fJPUdu9f
	 V/o2o3bd7vu3ji8g50PachotTRJgiAoHPASIVc2mkuTrBPR9WkaOl8n/A8uLH9GXmbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795820522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=021OSiQjF4XLDoBkszo5Qhb4yjdSbq+kjEQ1vIAZUFg=;
	b=HzMTsy+nhvoht2eIb/Nd1HrnQPRU/t3BFSTVbL4uS6fogqmEzIP/ueHLo3GcnXCZ/PzB
	 cGGV9h51gnOnmBHxWUdBAF8zEVF5dReS/3qjg3RBer7fchj4nQfmdx8GFs3ur0F1NSiql
	 /SrN4vt57F/18R8Xe9xZMDC6mCpOCU0bN01IHJl1a8CKBLy2YDPPg3PfyfZlEU3AUlMtj
	 90ZKiQSpC2eL82h8ClewFGxxjYH5r8TowMZcTg5l5UgUL/5Q4mGwm2Naruu06042pG0Xu
	 Pby4o8sXmF685NZNhq9LWR+A7f21ZNt4O1YjjR9PaOQ9JzPPq6y0U8WQkcaAJZv4dyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OeSk4Hzd;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8423606A6AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 23:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8423606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OeSk4Hzd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795820515; x=1827356515;
  h=date:from:to:cc:subject:message-id;
  bh=WGUlCvg0JQLObjlctN1emUQVfr3aJ1qyV8NGRiBLURw=;
  b=OeSk4Hzd848VJe/1XdPiu4nSsE2fzEPLINpEhsTapcoZ3uDkm/ia/Bm0
   PruYYLbqOACxu28LQjbL/jJSL8Ywbj5uXVftT/TI/smUO3sXFsII2rFl7
   bGMBtQbFW/5zrIY19yHIQj92otcbA6fL/ixR24PcVEIOvKTog00nKRPsJ
   isNTT+0rPfxcpOyOwl4lSeEbZDRl17GXOUGMLx5maZXufwJnKI71T/lli
   giPL3uMwLjLtS40YwZmkFQmfmYe1QqyBnaLXMuYQBQVm2abBRSg/vBxZZ
   SkSvFcnF2cva+aGsxpxSsQZATfnz6muBX4Ew2Iqdy5+CZfP2rFqPF52DZ
   A==;
X-CSE-ConnectionGUID: zpC2di2XQdeQYyH77gF39Q==
X-CSE-MsgGUID: TQAhzr6nRfWU5LMTcDW72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4795052"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4795052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 15:01:54 -0800
X-CSE-ConnectionGUID: +VZ02whkSqSBMhRPSYL8/Q==
X-CSE-MsgGUID: BoFhlnFiTEebmZIaku3CKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12799979"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 15:01:53 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX4ww-000000000Nm-1UNw;
	Fri, 27 Nov 2026 23:01:50 +0000
Date: Sat, 28 Nov 2026 00:01:15 +0100
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>
Subject: [arm64:for-next/perf 1/2]
 include/clocksource/arm_arch_timer.h:113:13: warning:
 'read_sched_clock_is_arch_counter' defined but not used
Message-ID: <20261127235920.1xBAAn8s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
head:   caee2c799f896b49f5247db3b2c4bf3926b0738a
commit: 71c11e8be95d2e890b656c9de42459ecd234205c [1/2] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
config: parisc-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127235920.1xBAAn8s-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127235920.1xBAAn8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127235920.1xBAAn8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/rpmh-rsc.c:30:
>> include/clocksource/arm_arch_timer.h:113:13: warning: 'read_sched_clock_is_arch_counter' defined but not used [-Wunused-function]
     113 | static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/read_sched_clock_is_arch_counter +113 include/clocksource/arm_arch_timer.h

   112	
 > 113	static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
   114	{
   115		return false;
   116	}
   117	#endif
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

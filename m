Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CD15B97D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 23:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538910; cv=none; b=TmTOWaNIjdX6YULW81SGvZj7WpssHfXw/pCP5kUnbk3w9iyi5Knq5NAiTP5emU4SaCs0IEAim/pcuft9BGPEjh1LLfc6LBkbDAGKNJouPebaEx42XrmBHxTqoEl8RmLzoCn4GLYIua+5Fh41ZeFB3P+N3gTS0Qdd0KzItzZdWlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538910; c=relaxed/simple;
	bh=kUnCp58vJ6LgvTMCWx7MoSRPXSLzxF3Y56kkVKOxREc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkYfK+m9MYX3ClDIRw3danAUBUE8GrqujFnr6pM0txPY5288CPg+SADwrMA/1W4GVTAnPlqKqk3en/6K/3IVuYC0GbG4zthFezJkcn8OnLcZPuaEEA0ZIz6m13wI5PcTuddre3FBCyrmMWDR6R4DYsGoTSRPmZvpRq5I8gFY2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CctJxoBb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CctJxoBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731538908; x=1763074908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUnCp58vJ6LgvTMCWx7MoSRPXSLzxF3Y56kkVKOxREc=;
  b=CctJxoBb18X3I9EjdsDhGv7gHcFLUkdyu5pCdY7g0quPAMqsPaOLWtwA
   HjCc2HKxxuymQrHKsW2MW0aernQbcabJYImJ2/yetSXbX8WhQWcsr3Bkt
   /t2FTgrNS4TqZcF366bBNy4IST4byo/kKeFxcrpJPMyNCdlQh+QjBp12W
   l4GmlS6ZdYEzv17LNxfMiXRuvERUcnsqbu9NQCLN0/k2vDszpsxPXVwJW
   pTKmvLSMZlpuNwTp/TACC+HmDWISo9XHHnDrreg/5mpq4mxxwHAfgiTrK
   hDcZlWf5fFaZLdxwY5H/wD72cQwAIFT7QF9TAFuZg1+i2kRm6CMRkG6jc
   Q==;
X-CSE-ConnectionGUID: PoDdWFH1QCy9u3jtpeA0Pg==
X-CSE-MsgGUID: XXWhR/stS0aCiyPE9HNqtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35251436"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="35251436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 15:01:48 -0800
X-CSE-ConnectionGUID: DiJl+RvqSJK9umnBDZ8vSQ==
X-CSE-MsgGUID: rXoRE7qORqW0hPzUA/k71g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92936550"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2024 15:01:47 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMMq-0000pK-1f;
	Wed, 13 Nov 2024 23:01:44 +0000
Date: Thu, 14 Nov 2024 07:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 arch/arm64/kernel/watchdog_sdei.c:37:42: error: 'watchdog_thresh'
 undeclared; did you mean 'proc_watchdog_thresh'?
Message-ID: <202411140624.vSku6pi5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: e8cb8c21cc35fb408033a4ef28e4d3fc73a72854 [1291/1291] sdei_watchdog: set secure timer period base on 'watchdog_thresh'
config: arm64-randconfig-004-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140624.vSku6pi5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140624.vSku6pi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140624.vSku6pi5-lkp@intel.com/

Note: the openeuler/openEuler-1.0-LTS HEAD a81d020c58c2c6a55ebaf15846470a9ecb69bd1a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/watchdog_sdei.c:17:
   include/linux/nmi.h: In function 'touch_nmi_watchdog':
   include/linux/nmi.h:141:9: error: implicit declaration of function 'arch_touch_nmi_watchdog'; did you mean 'touch_nmi_watchdog'? [-Werror=implicit-function-declaration]
     141 |         arch_touch_nmi_watchdog();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         touch_nmi_watchdog
   arch/arm64/kernel/watchdog_sdei.c: In function 'watchdog_nmi_enable':
>> arch/arm64/kernel/watchdog_sdei.c:37:42: error: 'watchdog_thresh' undeclared (first use in this function); did you mean 'proc_watchdog_thresh'?
      37 |         sdei_api_set_secure_timer_period(watchdog_thresh);
         |                                          ^~~~~~~~~~~~~~~
         |                                          proc_watchdog_thresh
   arch/arm64/kernel/watchdog_sdei.c:37:42: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kernel/watchdog_sdei.c: In function 'sdei_watchdog_callback':
   arch/arm64/kernel/watchdog_sdei.c:65:9: error: implicit declaration of function 'watchdog_hardlockup_check' [-Werror=implicit-function-declaration]
      65 |         watchdog_hardlockup_check(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/watchdog_sdei.c: In function 'watchdog_nmi_probe':
   arch/arm64/kernel/watchdog_sdei.c:117:46: error: 'watchdog_thresh' undeclared (first use in this function); did you mean 'proc_watchdog_thresh'?
     117 |         if (sdei_api_set_secure_timer_period(watchdog_thresh)) {
         |                                              ^~~~~~~~~~~~~~~
         |                                              proc_watchdog_thresh
   cc1: some warnings being treated as errors


vim +37 arch/arm64/kernel/watchdog_sdei.c

    10	
    11	#include <asm/irq_regs.h>
    12	#include <asm/kvm_hyp.h>
    13	#include <asm/smp_plat.h>
    14	#include <asm/sdei.h>
    15	#include <asm/virt.h>
    16	#include <linux/arm_sdei.h>
  > 17	#include <linux/nmi.h>
    18	
    19	/* We use the secure physical timer as SDEI NMI watchdog timer */
    20	#define SDEI_NMI_WATCHDOG_HWIRQ		29
    21	
    22	static int sdei_watchdog_event_num;
    23	static bool disable_sdei_nmi_watchdog;
    24	static bool sdei_watchdog_registered;
    25	
    26	int watchdog_nmi_enable(unsigned int cpu)
    27	{
    28		int ret;
    29	
    30		if (!sdei_watchdog_registered)
    31			return -EINVAL;
    32	
    33	#ifdef CONFIG_HARDLOCKUP_CHECK_TIMESTAMP
    34		refresh_hld_last_timestamp();
    35	#endif
    36	
  > 37		sdei_api_set_secure_timer_period(watchdog_thresh);
    38	
    39		ret = sdei_api_event_enable(sdei_watchdog_event_num);
    40		if (ret) {
    41			pr_err("Enable NMI Watchdog failed on cpu%d\n",
    42					smp_processor_id());
    43			return ret;
    44		}
    45	
    46		return 0;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

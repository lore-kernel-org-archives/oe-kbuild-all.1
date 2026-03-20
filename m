Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377BA35E921
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036779; cv=none; b=nAHxRseGfeE6mTqBZ/yTXcE+F3xG55J+m8nKHZ6Uq4VrZMEoXbEM4xl68sV1Od+mpswbnAT4p1o6h+CPxz92CHBcGMVfvGeNYWNXu6SvWfj+uJQ4l2cQPECnTJmIbdx4WtOa7t/kda9GhKX/cmZuS/emb8515WJf/7qwmtwqipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036779; c=relaxed/simple;
	bh=jKADcLJiGMdNDeqw7xiMox6RN6S4repTJGkWSgXFe+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NJUDQIyisxDC9LkxvoGXf6NEWVKQn3jhmDRq/AhXvRGof+u1FHKAm3mdBdBr2U8hyd4S/y/w0VQlrhgs0ntBCbN5H6EX0zg7M6I1PdLOC/Jn6OD6djyysQu3CxYlIkttGMEdTQ2UGyQwFru1ZPAkYUVZtYkN4R8lER09Wy82u+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSztOwO9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSztOwO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774036778; x=1805572778;
  h=date:from:to:cc:subject:message-id;
  bh=jKADcLJiGMdNDeqw7xiMox6RN6S4repTJGkWSgXFe+c=;
  b=FSztOwO9Ek/uozHSBYtPXjFFlMdiNL0tPZ/TfOfEboS3roE1tSQmlslk
   uPykoom3u2GC2Tp2pg0a3sJJkDBDtfG6P+YRrdeNuUVz4aIBrkISg3YuA
   5taH5FO3eJLqmlwRLteUXnIllYDgSwYjL158+yZvydveeHFq72yk2WtPT
   iqGUe0WMYmTA0+RpwRJP1hUXErjr2+w702rwe0G3FwPZvIwvTDCIwbI3R
   UClU0qsD42d0GhhQ7CpVl5Gy2CqlPlJVjNbTrdZqjvTpuWfPoSULKJrg7
   YM2MZENNzOVxqZQh8yw+cPSkGmoS++EdpQJUAAJ37SjxTvj6U44PhVsVX
   g==;
X-CSE-ConnectionGUID: sdw50KO2Ssy4ju7brRU0Ew==
X-CSE-MsgGUID: +Wd9xX6ESkKT5W5WAuj7Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="78732131"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78732131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:59:37 -0700
X-CSE-ConnectionGUID: dXZzaPKGQhOxJQyZYZou5w==
X-CSE-MsgGUID: 4Rhh4VACSeice5N8VykZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218701270"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2026 12:59:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3g0L-0000000056P-3X6T;
	Fri, 20 Mar 2026 19:59:33 +0000
Date: Fri, 20 Mar 2026 20:58:48 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/14] arch/x86/kernel/irq.c:138:31:
 error: 'IRQ_COUNT_X86_POSTED_MSI' undeclared; did you mean
 'IRQ_COUNT_POSTED_INTR'?
Message-ID: <202603202021.j5wgUpyQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   9e85c64195f3479abcad77115c7d5626e6905546
commit: d5debb2dd149e388fe3fdc1660437d2362579d28 [4/14] x86/irq: Make irqstats array based
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260320/202603202021.j5wgUpyQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202021.j5wgUpyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202021.j5wgUpyQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/irq.c: In function 'irq_init_stats':
>> arch/x86/kernel/irq.c:138:31: error: 'IRQ_COUNT_X86_POSTED_MSI' undeclared (first use in this function); did you mean 'IRQ_COUNT_POSTED_INTR'?
     138 |                 irq_stat_info[IRQ_COUNT_X86_POSTED_MSI].skip_vector = 1;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
         |                               IRQ_COUNT_POSTED_INTR
   arch/x86/kernel/irq.c:138:31: note: each undeclared identifier is reported only once for each function it appears in


vim +138 arch/x86/kernel/irq.c

   123	
   124	void __init irq_init_stats(void)
   125	{
   126		struct irq_stat_info *info = irq_stat_info;
   127	
   128		for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
   129			if (info->skip_vector && test_bit(info->skip_vector, system_vectors))
   130				info->skip_vector = 0;
   131		}
   132	
   133		if (!x86_platform_ipi_callback)
   134			irq_stat_info[IRQ_COUNT_X86_PLATFORM_IPI].skip_vector = 1;
   135	
   136	#ifdef CONFIG_X86_POSTED_MSI
   137		if (!posted_msi_enabled())
 > 138			irq_stat_info[IRQ_COUNT_X86_POSTED_MSI].skip_vector = 1;
   139	#endif
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACC6025A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626123; cv=none; b=Bqh5OhCWmcjfTomO6U1HILBe/XjThmPD91d85Zjp1hop9gCSRcIBesHoEWg1jlZHebYkOPeKcDzQQBHAN+t4aycZxJaU5zrVapxB/CdL5krM+8mELhrveTGn84rNDYlnaXCWGBZQwfnlhrhx3FiOaTR2bd58zWv8LIhQR4xDLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626123; c=relaxed/simple;
	bh=BGY6qFyGTKQEy6kobEsiqgNX0p6KIoxNTTgRNaRWAWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6RiPy2c811BlzeZjvpR76tDmHbrfhcjODR1GVHbHOSkqAPU2H0Abr4hmceOXpxURNSHO60D7EQcMgVkfgLSKRY1k3YMInMK//2G+clKTP/PeuJIKiS6rdZ4b2Pefsh+NkBAXCiVPglizd3jUfNuoypeYSXXALrsKYpaJHvpeFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5mIJKTw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5mIJKTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709626122; x=1741162122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGY6qFyGTKQEy6kobEsiqgNX0p6KIoxNTTgRNaRWAWk=;
  b=e5mIJKTwtKHpKjU9/KyQ7hW3pQtl0sn2cqC7HPFIzk08v0Ul31aSaXSa
   wInh5L0/c3upB/ZncwVaBVrGWFGYx76AeFadwKyFGfsAwdJzyGAzOkQg1
   vyre31Ar1Qf6EWsYtS8FAyRpeTX27YIcUp8woBcJ83XRv5yzb4c/hAvRE
   enAOz6eKrZzIbFECpbDtYsUUer6nZU8TpG0sa1/BLpJOIsy2Hyo2S7Mo1
   yaR7ZhNwTENYlpHPnm37kdCMIbWqIvuZt0BJeOElxJvfMM/dFZbS3gukQ
   0m8ca5QPmefxpnlVxwX09Kcfy3NsjMgqfslW3qpokxe6/kHVqsRlcyiUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4284677"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4284677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9232862"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2024 00:08:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhPql-00038r-2m;
	Tue, 05 Mar 2024 08:08:35 +0000
Date: Tue, 5 Mar 2024 16:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27028/27434] mm/async_fork.c:48:19:
 error: 'copy_hugetlb_page_range' undeclared here (not in a function); did
 you mean 'copy_page_range'?
Message-ID: <202403051650.9bbyGpNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: ef9026d4b7e6ea91265f448867eb09595b346e06 [27028/27434] mm: async_fork: imporve the fork() by introducing the async fork
config: x86_64-buildonly-randconfig-005-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051650.9bbyGpNW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051650.9bbyGpNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051650.9bbyGpNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/asm-generic/bug.h:20,
                    from arch/x86/include/asm/bug.h:84,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from mm/async_fork.c:3:
>> mm/async_fork.c:48:19: error: 'copy_hugetlb_page_range' undeclared here (not in a function); did you mean 'copy_page_range'?
      48 | EXPORT_SYMBOL_GPL(copy_hugetlb_page_range);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:102:23: note: in definition of macro '___export_symbol_common'
     102 |         extern typeof(sym) sym;                                         \
         |                       ^~~
   include/linux/export.h:169:41: note: in expansion of macro '___EXPORT_SYMBOL'
     169 | #define __EXPORT_SYMBOL(sym,sec)        ___EXPORT_SYMBOL(sym,sec)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:180:41: note: in expansion of macro '__EXPORT_SYMBOL'
     180 | #define EXPORT_SYMBOL_GPL(sym)          __EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~~
   mm/async_fork.c:48:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      48 | EXPORT_SYMBOL_GPL(copy_hugetlb_page_range);
         | ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_VADDR [=y] && DAMON_PADDR [=n] && DEBUG_FS [=y]
   Selected by [y]:
   - DAMON [=y]


vim +48 mm/async_fork.c

     2	
   > 3	#include <linux/mm.h>
     4	#include <linux/mm_inline.h>
     5	#include <linux/sched/mm.h>
     6	#include <linux/wait.h>
     7	#include <linux/sched/signal.h>
     8	#include <linux/spinlock.h>
     9	#include <asm/pgalloc.h>
    10	#include <linux/mmu_notifier.h>
    11	#include <linux/hugetlb.h>
    12	
    13	DEFINE_STATIC_KEY_FALSE(async_fork_enabled_key);
    14	
    15	/* async fork in staging, 0 means the module is not loaded yet. */
    16	atomic_t async_fork_staging;
    17	EXPORT_SYMBOL_GPL(async_fork_staging);
    18	
    19	struct async_fork_ops dummy_async_fork_ops = {0};
    20	EXPORT_SYMBOL_GPL(dummy_async_fork_ops);
    21	
    22	struct async_fork_ops *async_fork_ops = &dummy_async_fork_ops;
    23	EXPORT_SYMBOL_GPL(async_fork_ops);
    24	
    25	int async_fork_task(struct task_struct *p)
    26	{
    27		struct mem_cgroup *task_memcg;
    28		int async_fork = 0;
    29	
    30		if (likely(!async_fork_enabled()) || mem_cgroup_disabled())
    31			return 0;
    32	
    33		rcu_read_lock();
    34		task_memcg = mem_cgroup_from_task(p);
    35		if (task_memcg)
    36			async_fork = task_memcg->async_fork;
    37		rcu_read_unlock();
    38	
    39		if (!async_fork)
    40			return 0;
    41	
    42		return atomic_inc_not_zero(&async_fork_staging);
    43	}
    44	
    45	EXPORT_SYMBOL_GPL(init_mm);
    46	
    47	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  > 48	EXPORT_SYMBOL_GPL(copy_hugetlb_page_range);
    49	EXPORT_SYMBOL_GPL(copy_huge_pmd);
    50	EXPORT_SYMBOL_GPL(copy_huge_pud);
    51	#endif
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

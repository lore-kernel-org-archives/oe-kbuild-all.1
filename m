Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A25345758
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757947860; cv=none; b=VQLfPflAXD164pZMQ5/4TI89TRTe4I5sy67aP59iRNNnEMWak8kog35Qz1M/6Yiocger7ABhIiO07j9LADwgwTm/jsVlImdC2GptplHMs+YHQT7P4yqPo9dwNH8zjjfH/iENiMey2j3mftlXGTbEFIGGfrhBc+lRBwg4Cdmgxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757947860; c=relaxed/simple;
	bh=iIZ5DSiVVplj6AM5E8ejwH0d1F+Sl4ouOFvd9n5rdOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prsdk9tde6LQhHHjaBh8cX79JEcwyBs1e8ZoapyR5NQgnM/kyjzd+rbkWqL+Q3Pkj7CTPSQNCOUOa3a6yqf3e14mLSVWtTOg/6UpIJg/GRDTSO2s9/lQMi2I61SjFLRxyo/KntaTFPndEboE/ylqCc0QckepYOo9B+FSACsDM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQcEeSdR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQcEeSdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757947858; x=1789483858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iIZ5DSiVVplj6AM5E8ejwH0d1F+Sl4ouOFvd9n5rdOU=;
  b=KQcEeSdRwYpQJh3w2cUVvMwSDI1FJLNSHMrDJwfWm+qQLUTCv+ZbSJOX
   Wr2xCghgaibLbjHX29t/bW844XV78BjA2x+81Dp2nYS2kl0kh4TKoh9NU
   z1qF7CkDvZ1I9/5rnesYzFtguc7GX0htBDbYyFpv36A5bFn5LOMTo9BbJ
   TPDcjdBNj1qjKxwPTU+Vo2r8M45S8l2UPufnpuHi0NX4QcfgAhPmFDCls
   TE1RHtbdaQgVZ9AgicDWql8b5+i8O1MTFrS1ze4WFOBhipcmgZ0BcEwf6
   6LmiQfV9Ico0uUw7XD+nPwnY7ivCzS6Yk8gMJ/2ythgqSVvT6sK/UJ3Eh
   g==;
X-CSE-ConnectionGUID: 5OBmF7HjSdGJI9GhWyh0MQ==
X-CSE-MsgGUID: aHgP1iQUQ5uIy2rr8TMS4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60277359"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60277359"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:46:41 -0700
X-CSE-ConnectionGUID: B0HgGquYQ12++wP+tnBdZQ==
X-CSE-MsgGUID: EwTQ6MRtQNCRH6VERRqnOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174581809"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2025 07:46:40 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyATV-0000KL-2q;
	Mon, 15 Sep 2025 14:46:37 +0000
Date: Mon, 15 Sep 2025 22:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1782/1782] mm/page_alloc.c:3005:
 warning: Function parameter or member 'mt' not described in
 '__putback_isolated_page'
Message-ID: <202509152248.Glnloqtx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8975e9a49fdd2f6402cc5fe68bc08d3c2b7a35a5
commit: 91bac2310ae7eca9d9869222c96fcc3d02851eea [1782/1782] mm: add function __putback_isolated_page
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250915/202509152248.Glnloqtx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509152248.Glnloqtx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509152248.Glnloqtx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from '__build_all_zonelists' at mm/page_alloc.c:5529:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function '__build_all_zonelists':
   mm/page_alloc.c:5527:32: note: object 'lock' of size 4
    5527 |         static DEFINE_SPINLOCK(lock);
         |                                ^~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'adjust_managed_page_count' at mm/page_alloc.c:7188:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'adjust_managed_page_count':
   mm/page_alloc.c:127:24: note: object 'managed_page_count_lock' of size 4
     127 | static DEFINE_SPINLOCK(managed_page_count_lock);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'adjust_managed_page_count' at mm/page_alloc.c:7188:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'adjust_managed_page_count':
   mm/page_alloc.c:127:24: note: object 'managed_page_count_lock' of size 4
     127 | static DEFINE_SPINLOCK(managed_page_count_lock);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'setup_per_zone_wmarks' at mm/page_alloc.c:7504:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'setup_per_zone_wmarks':
   mm/page_alloc.c:7502:32: note: object 'lock' of size 4
    7502 |         static DEFINE_SPINLOCK(lock);
         |                                ^~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'setup_per_zone_wmarks' at mm/page_alloc.c:7504:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'setup_per_zone_wmarks':
   mm/page_alloc.c:7502:32: note: object 'lock' of size 4
    7502 |         static DEFINE_SPINLOCK(lock);
         |                                ^~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
>> mm/page_alloc.c:3005: warning: Function parameter or member 'mt' not described in '__putback_isolated_page'


vim +3005 mm/page_alloc.c

  2995	
  2996	/**
  2997	 * __putback_isolated_page - Return a now-isolated page back where we got it
  2998	 * @page: Page that was isolated
  2999	 * @order: Order of the isolated page
  3000	 *
  3001	 * This function is meant to return a page pulled from the free lists via
  3002	 * __isolate_free_page back to the free lists they were pulled from.
  3003	 */
  3004	void __putback_isolated_page(struct page *page, unsigned int order, int mt)
> 3005	{
  3006		struct zone *zone = page_zone(page);
  3007	
  3008		/* zone lock should be held when this function is called */
  3009		lockdep_assert_held(&zone->lock);
  3010	
  3011		/* Return isolated page to tail of freelist. */
  3012		__free_one_page(page, page_to_pfn(page), zone, order, mt);
  3013	}
  3014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

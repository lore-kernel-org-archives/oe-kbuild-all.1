Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5626FA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191481; cv=none; b=s6jsLfry60qdYLD+X83e3rT6siqXSlKzfQMgwjPEpY2RuzzXgEyxgjEiSMP4+JTMSEJeKFKLw/OJQen7WO3uJgi39++IxIpVn3mMjXRbM6Gxe/ebJmRdTScd48G/H/gYDeiSlO95pv9drOEkNwgiwjWkME23NGX/9NeBvekCcvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191481; c=relaxed/simple;
	bh=ddlnMWOX2Z6O5OiojJBuSQ2zKROBYKQSVYiHprhSSNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQis8PMTa52aCZYKWzaqJ1xGiwhrqla+sUedVsH52rcOjHmu7hyMThwqa0DiB9KAqDxMExHnd6I+n4vyo9EALO6i+MPx39UDNOYVPaHW9hIGTKjaHdI/Lr9AduSG5RQ1ieXg0SSZw/lB7TOH+R45C+LWsMjJIlIH2JY7j64tLMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnAbSs86; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnAbSs86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749191479; x=1780727479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddlnMWOX2Z6O5OiojJBuSQ2zKROBYKQSVYiHprhSSNA=;
  b=GnAbSs86KLIq1KDOkP4M8qyBjvJZaldII5SDLI/L8MrVlGCg/0OqGpzS
   231Iag8SqN3eUX8W0FNipo4KmqCz8HFmPW/GPwCHHrdncIP4SPcyc7+7o
   oMi1f7ICyncU9Rl9DiKNWGkLEW4l0bODptrUgNM2THAt6fMHqdHaN7WyE
   Bm41RnoOtWr7yC3/gp4oQ1c8MkjoxrUPqJOz5VRSlURBHYrnIoHxYuTCd
   s00XAeNBjuXqczeCDOQqoFe6pot0iBpJuD2ciaiaJWO32Vr7bckYpq8Gd
   MMtdqnROnPCwVZtxcdm1HSwIjnx5lLs27S3roQn3yGEv1Gu73KGlv2UmF
   A==;
X-CSE-ConnectionGUID: USgIUUPYSUKnDIUwDki2Ww==
X-CSE-MsgGUID: m0mVdJ8pRwCoZGXiPnGjLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62729283"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="62729283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 23:31:18 -0700
X-CSE-ConnectionGUID: Wa/AGC9mRMeP8qYHzvsqBw==
X-CSE-MsgGUID: 34zu8F4vSn2XzbhRyKaqPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146099958"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2025 23:31:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNQbj-0004nF-0D;
	Fri, 06 Jun 2025 06:31:15 +0000
Date: Fri, 6 Jun 2025 14:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1659/1659] mm/page_alloc.c:3005:
 warning: Function parameter or member 'mt' not described in
 '__putback_isolated_page'
Message-ID: <202506061449.nBm6oAvj-lkp@intel.com>
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
head:   89f3a2595f2e3f14f976811d203bd8f55ff4eada
commit: 91bac2310ae7eca9d9869222c96fcc3d02851eea [1659/1659] mm: add function __putback_isolated_page
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250606/202506061449.nBm6oAvj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061449.nBm6oAvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061449.nBm6oAvj-lkp@intel.com/

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

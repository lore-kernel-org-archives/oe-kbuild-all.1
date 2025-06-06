Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5824EF6B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198330; cv=none; b=qJcjCqlkhQSSPSNmkZL+CgY1QMaLZoObz580+fYpxpLNhYXVxTfpO7L9WwTSXGHkXSGFDMPax01fdgIfRNJpe+za8MqxV86iptANN2nDp56E3PcY1ArqEQW5CHHi/GOgWzneIoWOvsKiVzTV8GoO16q031zHzwLqPhAeRl6/raE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198330; c=relaxed/simple;
	bh=wxWTSdsebXWUDAD1YGXqD/r0wLYlS3J8r+wiJMp/498=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ht3pUFTCU14rNTRCuTptCwnrKAbaCNAXkDiV982VYRxG0EeE9VixdL3haRhzJojXhDNljWVs1Ki5WBMhO7O+jb0lz2QLJbKePJNHC2BPUfc4XWwBN/16mkQnx5Qr34dj9lzoyNE4wMDi2a6t1u97/oc4ayJEeOpB2khkS44jAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ4+E+Lk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ4+E+Lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749198328; x=1780734328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxWTSdsebXWUDAD1YGXqD/r0wLYlS3J8r+wiJMp/498=;
  b=cZ4+E+Lk9GvYVnjNG5k8lJaBVCx1bqOPZwjdxTjc+h+0XQ1G4VQHCPSg
   6dfY1NLZnGZtShkGNqqc2vmtXT68bHlR1G89vGKAQoQioG6gLvmraotNH
   Mpp9xo9Xlg6sd4iKbbknejw3Bf5wJRZmDvXYBvklR1E2owGQKkeC0ZzXe
   q+F5w0t6nEq6APZaYepbf7mY3OP9BmhTOXeaSkvdEVhziDhYPlryhXdy/
   G2LT7Y4KYb2rIZrHvLiqkIfE7Fep5kJDNYOX14eaJICh+oytO957owIOr
   UbKm1rymhcSePStI6ZV/PVMxOccm1MFcyGpdBKVsNrrV+OpJF0LFe8eCQ
   g==;
X-CSE-ConnectionGUID: xflrF7tYRbS+7xMx4dlruA==
X-CSE-MsgGUID: 7j5TFuyqSkSvkCM1muslEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61609541"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="61609541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 01:25:27 -0700
X-CSE-ConnectionGUID: LVmomkYORUevn/fNDlczYg==
X-CSE-MsgGUID: 6c0g+ZysSJylwGWFR1SysQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="145662292"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2025 01:25:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNSOB-0004qf-2O;
	Fri, 06 Jun 2025 08:25:23 +0000
Date: Fri, 6 Jun 2025 16:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1659/1659] mm/vmalloc.c:217:23:
 warning: variable 'start' set but not used
Message-ID: <202506061633.Zsp5yfyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   89f3a2595f2e3f14f976811d203bd8f55ff4eada
commit: 3eb01faed2ebb254019a3bb72ce3bdf4d0a9be74 [1659/1659] mm/vmalloc: add vmap_range_noflush variant
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250606/202506061633.Zsp5yfyi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061633.Zsp5yfyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061633.Zsp5yfyi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmalloc.c: In function 'vmap_range_noflush':
>> mm/vmalloc.c:217:23: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     217 |         unsigned long start;
         |                       ^~~~~
   mm/vmalloc.c: At top level:
   mm/vmalloc.c:1417:6: warning: no previous prototype for 'set_iounmap_nonlazy' [-Wmissing-prototypes]
    1417 | void set_iounmap_nonlazy(void)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/vmalloc.h:5,
                    from mm/vmalloc.c:11:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'find_vmap_area' at mm/vmalloc.c:1519:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82:
   mm/vmalloc.c: In function 'find_vmap_area':
   mm/vmalloc.c:557:24: note: object 'vmap_area_lock' of size 4
     557 | static DEFINE_SPINLOCK(vmap_area_lock);
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'find_vmap_area' at mm/vmalloc.c:1519:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'find_vmap_area':
   mm/vmalloc.c:557:24: note: object 'vmap_area_lock' of size 4
     557 | static DEFINE_SPINLOCK(vmap_area_lock);
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'setup_vmalloc_vm' at mm/vmalloc.c:2111:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'setup_vmalloc_vm':
   mm/vmalloc.c:557:24: note: object 'vmap_area_lock' of size 4
     557 | static DEFINE_SPINLOCK(vmap_area_lock);
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'setup_vmalloc_vm' at mm/vmalloc.c:2111:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'setup_vmalloc_vm':
   mm/vmalloc.c:557:24: note: object 'vmap_area_lock' of size 4
     557 | static DEFINE_SPINLOCK(vmap_area_lock);
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,


vim +/start +217 mm/vmalloc.c

004cface9c1c0b Nicholas Piggin 2021-10-29  211  
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  212  static int vmap_range_noflush(unsigned long addr, unsigned long end,
004cface9c1c0b Nicholas Piggin 2021-10-29  213  			phys_addr_t phys_addr, pgprot_t prot,
004cface9c1c0b Nicholas Piggin 2021-10-29  214  			unsigned int max_page_shift)
004cface9c1c0b Nicholas Piggin 2021-10-29  215  {
004cface9c1c0b Nicholas Piggin 2021-10-29  216  	pgd_t *pgd;
004cface9c1c0b Nicholas Piggin 2021-10-29 @217  	unsigned long start;
004cface9c1c0b Nicholas Piggin 2021-10-29  218  	unsigned long next;
004cface9c1c0b Nicholas Piggin 2021-10-29  219  	int err;
004cface9c1c0b Nicholas Piggin 2021-10-29  220  
004cface9c1c0b Nicholas Piggin 2021-10-29  221  	might_sleep();
004cface9c1c0b Nicholas Piggin 2021-10-29  222  	BUG_ON(addr >= end);
004cface9c1c0b Nicholas Piggin 2021-10-29  223  
004cface9c1c0b Nicholas Piggin 2021-10-29  224  	start = addr;
004cface9c1c0b Nicholas Piggin 2021-10-29  225  	pgd = pgd_offset_k(addr);
004cface9c1c0b Nicholas Piggin 2021-10-29  226  	do {
004cface9c1c0b Nicholas Piggin 2021-10-29  227  		next = pgd_addr_end(addr, end);
004cface9c1c0b Nicholas Piggin 2021-10-29  228  		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, max_page_shift);
004cface9c1c0b Nicholas Piggin 2021-10-29  229  		if (err)
004cface9c1c0b Nicholas Piggin 2021-10-29  230  			break;
004cface9c1c0b Nicholas Piggin 2021-10-29  231  	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
004cface9c1c0b Nicholas Piggin 2021-10-29  232  
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  233  	return err;
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  234  }
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  235  

:::::: The code at line 217 was first introduced by commit
:::::: 004cface9c1c0b6351473934a4ce452193e05b07 mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8724438B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 03:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761448724; cv=none; b=fXLH90Z5SGH77p210yif38r8HhAJzaOrHJeJY/Dnog1xAfHz1ZSqTQ7S2hb0vNd/wV6sNTIK75qqVjyyJAZ1cxLAbMW9WdOiQiw00t0DI0PnKdmXyqjng5xXWfPl0ISYiB3Whk4RhCI66ifufTrAmsOjYLtpfvV73ICIg3va5MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761448724; c=relaxed/simple;
	bh=X9q3QPtiSjuhHnVo6LbOk78XQc4zDYgM/Al72/mEMcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHmKhCNZkm9EyaBKU2uHpldUVWAH7HIbezgpyEzIuTGIf9JJwBoXKZOPkPVOq7OJU8O9+3yOQQQ9xvlRmh0RGs/BCLuAzBQjkNz6m9QlWfuvKN9RmZI9aqIrBoLRXpA2NVVq5Za3+S3XTKRL2h7oB4fMlW8qccNHSn4MIvFxdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWKC2qwG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWKC2qwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761448722; x=1792984722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X9q3QPtiSjuhHnVo6LbOk78XQc4zDYgM/Al72/mEMcs=;
  b=MWKC2qwGwUIba2syCAFRlRE4DSMMYcd+Ty6oyZkuugECpI6uN1flttrM
   HZa6YFTrXnRs7BMOyVizVQCPUDSbFb5jZHEmNaTOMSmCfdYIybfJyviyC
   DjMpW2CDMW0py7pZNlhgYEglvUs0Ck1uDfZpLQ156eZrr+8EXhOCTiLXm
   uJDSozZFG1Yws6YLp97Erv4IySPGv7ToZwT80SBwi7dOkW5JEkrZ482Wr
   RCT69WbivtEjBiqvwY0VH+anIuQTvsmvH44uYam0Almld4SKDDFXIWEhf
   HZsuLKh6sCaUDGXSeES07NFiS9cs8L3cCZ8x3s/ZNAJyokQrfEP/0DxyB
   Q==;
X-CSE-ConnectionGUID: 5JJRewUoSXK7+uK+jNfwFg==
X-CSE-MsgGUID: miwrYcb3SaCslmd4sP8qbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66185903"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="66185903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 20:18:42 -0700
X-CSE-ConnectionGUID: 3ur6ww3eTBOCT5XJOPReYw==
X-CSE-MsgGUID: JpenYL6lSLSYQSvuLNg+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="189127594"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2025 20:18:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCrH8-000Fqr-0q;
	Sun, 26 Oct 2025 03:18:35 +0000
Date: Sun, 26 Oct 2025 11:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755]
 include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used
Message-ID: <202510261133.NBo7iUqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ee55f6a88c1f70120d9cec8244c5cd10f0c4dce9
commit: 1811840c2cdebd0820818392a8217ffbd1be5c67 [1755/1755] mm/sharepool: Fix sharepool node id invalid when using sp_alloc
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251026/202510261133.NBo7iUqV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261133.NBo7iUqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261133.NBo7iUqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/shmem_fs.h:7,
                    from mm/filemap.c:37:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
--
   In file included from mm/oom_kill.c:35:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:6,
                    from include/linux/oom.h:6,
                    from mm/oom_kill.c:20:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'wake_oom_reaper' at mm/oom_kill.c:738:2,
       inlined from 'wake_oom_reaper' at mm/oom_kill.c:730:13:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/sched/signal.h:8:
   mm/oom_kill.c: In function 'wake_oom_reaper':
   mm/oom_kill.c:584:24: note: object 'oom_reaper_lock' of size 4
     584 | static DEFINE_SPINLOCK(oom_reaper_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'wake_oom_reaper' at mm/oom_kill.c:738:2,
       inlined from 'wake_oom_reaper' at mm/oom_kill.c:730:13:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/oom_kill.c: In function 'wake_oom_reaper':
   mm/oom_kill.c:584:24: note: object 'oom_reaper_lock' of size 4
     584 | static DEFINE_SPINLOCK(oom_reaper_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'oom_reaper' at mm/oom_kill.c:716:3:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/oom_kill.c: In function 'oom_reaper':
   mm/oom_kill.c:584:24: note: object 'oom_reaper_lock' of size 4
     584 | static DEFINE_SPINLOCK(oom_reaper_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'oom_reaper' at mm/oom_kill.c:716:3:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/oom_kill.c: In function 'oom_reaper':
   mm/oom_kill.c:584:24: note: object 'oom_reaper_lock' of size 4
     584 | static DEFINE_SPINLOCK(oom_reaper_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
--
    7495 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7497:9: note: in expansion of macro 'adj_init_size'
    7497 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7497:9: note: in expansion of macro 'adj_init_size'
    7497 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7497:9: note: in expansion of macro 'adj_init_size'
    7497 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7497:9: note: in expansion of macro 'adj_init_size'
    7497 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7498:9: note: in expansion of macro 'adj_init_size'
    7498 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7498:9: note: in expansion of macro 'adj_init_size'
    7498 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7498:9: note: in expansion of macro 'adj_init_size'
    7498 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7498:9: note: in expansion of macro 'adj_init_size'
    7498 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7499:9: note: in expansion of macro 'adj_init_size'
    7499 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7499:9: note: in expansion of macro 'adj_init_size'
    7499 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7499:9: note: in expansion of macro 'adj_init_size'
    7499 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7499:9: note: in expansion of macro 'adj_init_size'
    7499 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7500:9: note: in expansion of macro 'adj_init_size'
    7500 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:27: note: use '&_sdata[0] <= &__start_rodata[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7500:9: note: in expansion of macro 'adj_init_size'
    7500 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: warning: comparison between two arrays [-Warray-compare]
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7500:9: note: in expansion of macro 'adj_init_size'
    7500 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7491:41: note: use '&__start_rodata[0] < &_edata[0]' to compare the addresses
    7491 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7500:9: note: in expansion of macro 'adj_init_size'
    7500 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   In file included from mm/page_alloc.c:43:
   include/linux/mempolicy.h: At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:10,
                    from mm/page_alloc.c:18:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from '__build_all_zonelists' at mm/page_alloc.c:5730:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82,
                    from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:11:
   mm/page_alloc.c: In function '__build_all_zonelists':
   mm/page_alloc.c:5728:32: note: object 'lock' of size 4
    5728 |         static DEFINE_SPINLOCK(lock);
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
       inlined from '__build_all_zonelists' at mm/page_alloc.c:5730:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function '__build_all_zonelists':
   mm/page_alloc.c:5728:32: note: object 'lock' of size 4
    5728 |         static DEFINE_SPINLOCK(lock);
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
       inlined from 'adjust_managed_page_count' at mm/page_alloc.c:7414:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'adjust_managed_page_count':
   mm/page_alloc.c:166:24: note: object 'managed_page_count_lock' of size 4
     166 | static DEFINE_SPINLOCK(managed_page_count_lock);
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
       inlined from 'adjust_managed_page_count' at mm/page_alloc.c:7414:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'adjust_managed_page_count':
   mm/page_alloc.c:166:24: note: object 'managed_page_count_lock' of size 4
     166 | static DEFINE_SPINLOCK(managed_page_count_lock);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
..


vim +/__do_mbind +329 include/linux/mempolicy.h

   328	
 > 329	static long __do_mbind(unsigned long start, unsigned long len,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

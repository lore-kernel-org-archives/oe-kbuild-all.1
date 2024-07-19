Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C2810F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350203; cv=none; b=q8/NOf9G+gEWeGFWyLwIWx/sROVsdNWFYmNpDigmONa9xqRhaEIZ7P63s1PnCsHO3/NfBrlf5fNDWnW3DjyP/32bjsIDvxDTOPdO5PSyBc0D3l+GScPPowyH7D9Wp1HPQJHW2IZGvQwODLLnoC1ZWxiHiMPT8S46Hs8Tz6uiQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350203; c=relaxed/simple;
	bh=0IDYL7nV5Fb0X7//Ucyn+SBLsG0oq0FQ0Z8c3d5TxAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pd4um7vY1605gRAQd9G+HpBiWsG36WM9gYEF2UJBxtwuRdDbG9BlI9CjuJ6cHZzC6b0sqZq/qYFnd7DUD5vAuaK1mxxu1LAijI+HXlAgSJKYJcdhs28tj3wlPNXoZog3Z3xjGBYxo+xVcTz9Ka+4SjOSS70ICvk1zTAf/Aoh7KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaGA3QNg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaGA3QNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721350201; x=1752886201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IDYL7nV5Fb0X7//Ucyn+SBLsG0oq0FQ0Z8c3d5TxAI=;
  b=RaGA3QNg361Kpwr65nosEH5VUCE77hZkKXNVsEUAzbL8rD4BArt2HUAQ
   YowB6x7cKaMtCQG4oUI2aw22xc0hqDYrohgshQ3NmvUQatZmbppA2ZFsd
   ZZLH4avCgJqG44Ub6RGEfru/C0OZyI0hHG1hxjTwM9Wn3TpVUak4IqqqC
   gtqEN+oKdr0Pe9/d1YaneGxvSfOqwypq0Mab8y5HRoms3YZ0GRkiM22Bw
   0HOxvmNcRpK+DoDnGorIaQHKIktnF5eMfY/kpXYdfKynI01DWVMxavuaG
   DNfMgAZyxYwPPKkoJbEPmnSZFe2F6ERdh7lKRp/tX4q6xCTeyCbmGQxHe
   w==;
X-CSE-ConnectionGUID: 7Sx66m8KThWKkyZPK2piUw==
X-CSE-MsgGUID: 0xliOsviTte4+8mXJMksSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18759509"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="18759509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 17:49:58 -0700
X-CSE-ConnectionGUID: qEt0MtHtSfKU46msejrCNg==
X-CSE-MsgGUID: RQ0Yv5C6QeWZKEa0ZFSkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="81989073"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2024 17:49:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUbop-000hhz-00;
	Fri, 19 Jul 2024 00:49:55 +0000
Date: Fri, 19 Jul 2024 08:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] arch/s390/include/asm/mmu.h:10:9:
 error: unknown type name 'spinlock_t'; did you mean 'raw_spinlock_t'?
Message-ID: <202407190808.JQxnSpCs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   9be426f361841aaa9cccbbf3b4d6c0996761a83e
commit: 2a551f2f3fc68829c9cbd56a5c4fbf95a17b3fa2 [4/6] mm: memcg: merge multiple page_counters into a single structure
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240719/202407190808.JQxnSpCs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407190808.JQxnSpCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407190808.JQxnSpCs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/page_counter.h:8,
                    from mm/page_counter.c:8:
>> arch/s390/include/asm/mmu.h:10:9: error: unknown type name 'spinlock_t'; did you mean 'raw_spinlock_t'?
      10 |         spinlock_t lock;
         |         ^~~~~~~~~~
         |         raw_spinlock_t
--
   In file included from include/linux/page_counter.h:8,
                    from mm/memcontrol.c:28:
>> arch/s390/include/asm/mmu.h:10:9: error: unknown type name 'spinlock_t'; did you mean 'raw_spinlock_t'?
      10 |         spinlock_t lock;
         |         ^~~~~~~~~~
         |         raw_spinlock_t
   In file included from arch/s390/include/asm/mmu_context.h:14,
                    from arch/s390/include/asm/elf.h:173,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from mm/memcontrol.c:29:
   arch/s390/include/asm/tlbflush.h: In function '__tlb_flush_mm_lazy':
>> arch/s390/include/asm/tlbflush.h:82:19: error: passing argument 1 of 'spin_lock' from incompatible pointer type [-Wincompatible-pointer-types]
      82 |         spin_lock(&mm->context.lock);
         |                   ^~~~~~~~~~~~~~~~~
         |                   |
         |                   int *
   In file included from include/linux/sched.h:2143,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13:
   include/linux/spinlock.h:349:51: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'int *'
     349 | static __always_inline void spin_lock(spinlock_t *lock)
         |                                       ~~~~~~~~~~~~^~~~
>> arch/s390/include/asm/tlbflush.h:87:21: error: passing argument 1 of 'spin_unlock' from incompatible pointer type [-Wincompatible-pointer-types]
      87 |         spin_unlock(&mm->context.lock);
         |                     ^~~~~~~~~~~~~~~~~
         |                     |
         |                     int *
   include/linux/spinlock.h:389:53: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'int *'
     389 | static __always_inline void spin_unlock(spinlock_t *lock)
         |                                         ~~~~~~~~~~~~^~~~
   arch/s390/include/asm/mmu_context.h: In function 'init_new_context':
>> arch/s390/include/asm/mmu_context.h:24:24: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Wincompatible-pointer-types]
      24 |         spin_lock_init(&mm->context.lock);
         |                        ^~~~~~~~~~~~~~~~~
         |                        |
         |                        int *
   include/linux/spinlock.h:335:45: note: in definition of macro 'spin_lock_init'
     335 |         __raw_spin_lock_init(spinlock_check(lock),              \
         |                                             ^~~~
   include/linux/spinlock.h:324:67: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'int *'
     324 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                                       ~~~~~~~~~~~~^~~~


vim +10 arch/s390/include/asm/mmu.h

1e3cab2f2fbca2 arch/s390/include/asm/mmu.h Heiko Carstens     2012-03-30   8  
146e4b3c8b9207 include/asm-s390/mmu.h      Martin Schwidefsky 2008-02-09   9  typedef struct {
60f07c8ec5fae0 arch/s390/include/asm/mmu.h Martin Schwidefsky 2017-08-17 @10  	spinlock_t lock;
1b948d6caec4f2 arch/s390/include/asm/mmu.h Martin Schwidefsky 2014-04-03  11  	cpumask_t cpu_attach_mask;
64f31d5802af11 arch/s390/include/asm/mmu.h Martin Schwidefsky 2016-05-25  12  	atomic_t flush_count;
050eef364ad700 arch/s390/include/asm/mmu.h Martin Schwidefsky 2010-08-24  13  	unsigned int flush_mm;
e5992f2e6c3829 arch/s390/include/asm/mmu.h Martin Schwidefsky 2011-07-24  14  	struct list_head gmap_list;
44b6cc8130e80e arch/s390/include/asm/mmu.h Martin Schwidefsky 2016-06-13  15  	unsigned long gmap_asce;
723cacbd9dc795 arch/s390/include/asm/mmu.h Gerald Schaefer    2016-04-15  16  	unsigned long asce;
6252d702c5311c include/asm-s390/mmu.h      Martin Schwidefsky 2008-02-09  17  	unsigned long asce_limit;
b020632e40c3ed arch/s390/include/asm/mmu.h Martin Schwidefsky 2008-12-25  18  	unsigned long vdso_base;
214d9bbcd3a672 arch/s390/include/asm/mmu.h Claudio Imbrenda   2020-01-21  19  	/* The mmu context belongs to a secure guest. */
07fbdf7f934795 arch/s390/include/asm/mmu.h Claudio Imbrenda   2022-06-28  20  	atomic_t protected_count;
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  21  	/*
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  22  	 * The following bitfields need a down_write on the mm
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  23  	 * semaphore when they are written to. As they are only
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  24  	 * written once, they can be read without a lock.
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  25  	 *
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  26  	 * The mmu context allocates 4K page tables.
df88f3181f1056 arch/s390/include/asm/mmu.h Janosch Frank      2018-08-30  27  	 */
0b46e0a3ec0d7a arch/s390/include/asm/mmu.h Martin Schwidefsky 2015-04-15  28  	unsigned int alloc_pgste:1;
0b46e0a3ec0d7a arch/s390/include/asm/mmu.h Martin Schwidefsky 2015-04-15  29  	/* The mmu context uses extended page tables. */
b2fa47e6bf5148 arch/s390/include/asm/mmu.h Martin Schwidefsky 2011-05-23  30  	unsigned int has_pgste:1;
65eef33550f68e arch/s390/include/asm/mmu.h Dominik Dingel     2014-01-14  31  	/* The mmu context uses storage keys. */
55531b7431db78 arch/s390/include/asm/mmu.h Janosch Frank      2018-02-15  32  	unsigned int uses_skeys:1;
c9f0a2b87f9e95 arch/s390/include/asm/mmu.h Janosch Frank      2018-02-16  33  	/* The mmu context uses CMM. */
c9f0a2b87f9e95 arch/s390/include/asm/mmu.h Janosch Frank      2018-02-16  34  	unsigned int uses_cmm:1;
06201e00ee3e4b arch/s390/include/asm/mmu.h David Hildenbrand  2024-04-11  35  	/*
06201e00ee3e4b arch/s390/include/asm/mmu.h David Hildenbrand  2024-04-11  36  	 * The mmu context allows COW-sharing of memory pages (KSM, zeropage).
06201e00ee3e4b arch/s390/include/asm/mmu.h David Hildenbrand  2024-04-11  37  	 * Note that COW-sharing during fork() is currently always allowed.
06201e00ee3e4b arch/s390/include/asm/mmu.h David Hildenbrand  2024-04-11  38  	 */
06201e00ee3e4b arch/s390/include/asm/mmu.h David Hildenbrand  2024-04-11  39  	unsigned int allow_cow_sharing:1;
a9e00d8349c98e arch/s390/include/asm/mmu.h Janosch Frank      2018-07-13  40  	/* The gmaps associated with this context are allowed to use huge pages. */
a9e00d8349c98e arch/s390/include/asm/mmu.h Janosch Frank      2018-07-13  41  	unsigned int allow_gmap_hpage_1m:1;
146e4b3c8b9207 include/asm-s390/mmu.h      Martin Schwidefsky 2008-02-09  42  } mm_context_t;
^1da177e4c3f41 include/asm-s390/mmu.h      Linus Torvalds     2005-04-16  43  

:::::: The code at line 10 was first introduced by commit
:::::: 60f07c8ec5fae06c23e9fd7bab67dabce92b3414 s390/mm: fix race on mm->context.flush_mm

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

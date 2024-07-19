Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD710F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 00:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350200; cv=none; b=Uo3ViTtyVPEI+pYyU4Pm6OgUH1u5hofn7u2O5f79tM9i2JxKDute+mIAiW9G035VPw+sw61yZTVSiNaguaF2TUwJJjGorzaSLjUnFTV2CVXzU0R5jC5a+OFYy61rozG3AmM01zlPTMp4JzdDoVVzx77vq+RRgIQebDLirQ9rk94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350200; c=relaxed/simple;
	bh=IUkUmfvKuf1Y0pmg11mCctYA67pO+7W1eBAWtLRqu0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kuCC/VzulESnrK+/KyXLDnO5KzWak+hEUpE30nrM+Au9qo40nI9g5elUfoUTj7WKgSbkelYmJ2SA9cNhkdPrVxkKWtRECAcuLw21ItE2vHBdPTorKUI1R0rB7uv7BxXpyo58rTDD1X0FNw9PQaeoeJlWBSJuNjlhJNZNudjWPsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZqI0/rg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZqI0/rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721350199; x=1752886199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUkUmfvKuf1Y0pmg11mCctYA67pO+7W1eBAWtLRqu0w=;
  b=WZqI0/rgA+Z7FvoKyziOzc0TZWPs8PyaNT1S1CsC7rHDP7DwcJz9wwjb
   JoiVbrbyz6L0ktZRPEgt+swPUI1xmvBOw9exRc0nnNChXhgbaFC9ceK34
   /oyCZCkDeit3a32ov2y4a2iPU3EWfmS5BbDuhc7K7ABtbgtCTOca8ko3i
   6cuC3poR0gJGHccsD7xU9RpcIhvzTvX/P5V/FbjKENv8C00nbZXeUpYMD
   IsjaluY3RNJY5Bl0+WVh5XMt635vhOxCIz4/k50KjAojqNqCiwu3nhGvc
   RMC+nx639tePE4okIg+qKObWSBezsgJ6TyDx6d9L31HBPYM60ifcRuXnH
   w==;
X-CSE-ConnectionGUID: dGuB2d7LTdCFN0sGYUfdIA==
X-CSE-MsgGUID: 8C2HhMVvQYSDcI/q1lzGFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18759505"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="18759505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 17:49:58 -0700
X-CSE-ConnectionGUID: fBSlZVlbTYuw585YQdRwDg==
X-CSE-MsgGUID: KUl3QqKLRYSRjcjdnP2oyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="81989071"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2024 17:49:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUboo-000hhw-3A;
	Fri, 19 Jul 2024 00:49:54 +0000
Date: Fri, 19 Jul 2024 08:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6]
 arch/sparc/include/asm/mmu_64.h:108:9: error: unknown type name
 'spinlock_t'; did you mean 'clock_t'?
Message-ID: <202407190855.BDnSRqdz-lkp@intel.com>
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
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240719/202407190855.BDnSRqdz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407190855.BDnSRqdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407190855.BDnSRqdz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/mmu.h:5,
                    from include/linux/page_counter.h:8,
                    from mm/page_counter.c:8:
>> arch/sparc/include/asm/mmu_64.h:108:9: error: unknown type name 'spinlock_t'; did you mean 'clock_t'?
     108 |         spinlock_t              lock;
         |         ^~~~~~~~~~
         |         clock_t
   arch/sparc/include/asm/mmu_64.h:117:9: error: unknown type name 'spinlock_t'; did you mean 'clock_t'?
     117 |         spinlock_t              tag_lock;
         |         ^~~~~~~~~~
         |         clock_t
--
   In file included from arch/sparc/include/asm/mmu.h:5,
                    from include/linux/page_counter.h:8,
                    from mm/memcontrol.c:28:
>> arch/sparc/include/asm/mmu_64.h:108:9: error: unknown type name 'spinlock_t'; did you mean 'clock_t'?
     108 |         spinlock_t              lock;
         |         ^~~~~~~~~~
         |         clock_t
   arch/sparc/include/asm/mmu_64.h:117:9: error: unknown type name 'spinlock_t'; did you mean 'clock_t'?
     117 |         spinlock_t              tag_lock;
         |         ^~~~~~~~~~
         |         clock_t
   In file included from include/linux/sched.h:2143,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from mm/memcontrol.c:29:
   arch/sparc/include/asm/mmu_context_64.h: In function 'switch_mm':
>> arch/sparc/include/asm/mmu_context_64.h:89:27: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Wincompatible-pointer-types]
      89 |         spin_lock_irqsave(&mm->context.lock, flags);
         |                           ^~~~~~~~~~~~~~~~~
         |                           |
         |                           int *
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   arch/sparc/include/asm/mmu_context_64.h:89:9: note: in expansion of macro 'spin_lock_irqsave'
      89 |         spin_lock_irqsave(&mm->context.lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:324:67: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'int *'
     324 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                                       ~~~~~~~~~~~~^~~~
   In file included from arch/sparc/include/asm/mmu_context.h:5,
                    from arch/sparc/include/asm/tlbflush_64.h:5,
                    from arch/sparc/include/asm/tlbflush.h:5,
                    from arch/sparc/include/asm/pgtable_64.h:89,
                    from arch/sparc/include/asm/pgtable.h:5,
                    from arch/sparc/include/asm/uaccess_64.h:14,
                    from arch/sparc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/cgroup.h:17:
>> arch/sparc/include/asm/mmu_context_64.h:135:32: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Wincompatible-pointer-types]
     135 |         spin_unlock_irqrestore(&mm->context.lock, flags);
         |                                ^~~~~~~~~~~~~~~~~
         |                                |
         |                                int *
   include/linux/spinlock.h:404:64: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'int *'
     404 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^~~~


vim +108 arch/sparc/include/asm/mmu_64.h

74a04967482faa arch/sparc/include/asm/mmu_64.h Khalid Aziz           2018-02-23  106  
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17  107  typedef struct {
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17 @108  	spinlock_t		lock;
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17  109  	unsigned long		sparc64_ctx_val;
af1b1a9b36b8f9 arch/sparc/include/asm/mmu_64.h Mike Kravetz          2016-07-15  110  	unsigned long		hugetlb_pte_count;
af1b1a9b36b8f9 arch/sparc/include/asm/mmu_64.h Mike Kravetz          2016-07-15  111  	unsigned long		thp_pte_count;
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17  112  	struct tsb_config	tsb_block[MM_NUM_TSBS];
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17  113  	struct hv_tsb_descr	tsb_descr[MM_NUM_TSBS];
9a08862a5d2e26 arch/sparc/include/asm/mmu_64.h Nagarathnam Muthusamy 2017-09-21  114  	void			*vdso;
74a04967482faa arch/sparc/include/asm/mmu_64.h Khalid Aziz           2018-02-23  115  	bool			adi;
74a04967482faa arch/sparc/include/asm/mmu_64.h Khalid Aziz           2018-02-23  116  	tag_storage_desc_t	*tag_store;
74a04967482faa arch/sparc/include/asm/mmu_64.h Khalid Aziz           2018-02-23  117  	spinlock_t		tag_lock;
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17  118  } mm_context_t;
f5e706ad886b6a include/asm-sparc/mmu_64.h      Sam Ravnborg          2008-07-17  119  

:::::: The code at line 108 was first introduced by commit
:::::: f5e706ad886b6a5eb59637830110b09ccebf01c5 sparc: join the remaining header files

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC42D541B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755116106; cv=none; b=Norr84I4tGIr5CFMkFrc1mj0PkqvoFcxYXOW2huRRGX9JetUMfM3cEtIJbgUCRo6xt0bwvQbpsIWq/ghyhDLZhSo30+r97ONjGsP0pr95GyeyOuW0MpeCe9VTN3wrTpv/pFrBuExUJ68J8AoI/1WX5tYqHp3GHed+ZmSh2RMJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755116106; c=relaxed/simple;
	bh=LZrTawuyAxoCi3sunafl5DYLrYFuXSMQtkSuKXK3J0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8KlNTgp9FCTzddnVKxOlvZobl1aXxPrLidRBvLmL0QnVkHk3glmlGhtftu9m5fAMY5JDCzun4Bx4Xt3CNTcJHGaRXVZHin4Nbz4gnMvVuHLNIQsOdc1DLfJu7/kovSnrBNIweM5fPzYE3JK1TEkgX/wucSKraCOTJ8FGeuLJHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cO8Xsz9k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cO8Xsz9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755116104; x=1786652104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZrTawuyAxoCi3sunafl5DYLrYFuXSMQtkSuKXK3J0E=;
  b=cO8Xsz9klUZYmLO0fNgRRFAr/M19/Dh28jwZXuYZrfBEfATJFWVWqAnd
   8ufYQAA9LGP7irOPQb90db4b/ONZZpYzFoEu0vbR/gpZm3BvAKsOVqpe6
   zbJL9mA16fZ/IF4/FO7ggdYLM7dOr8F0GhJGr5lFWSHP52Ep0g7BB7Z12
   0XEhuMnknZ4cCZbX88StjnWLY1zz+WT0kGL6yfd847V2f3yN4XGrDe8bi
   2RtW08HxRZp4X0wqDBXyq0I/zp4HSUik5kk68+tEvvuguLkHUuaSnO+Pz
   yC5rwEEzzlrqqIbXHcTIwg4KTf7Z/lpi57INTDdgVVdzjsD5iQpQswiyh
   g==;
X-CSE-ConnectionGUID: nEdctPOaQ5mf2uUQRBh/LQ==
X-CSE-MsgGUID: tkje7o9LT5i8f3VtzBLRHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61229373"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="61229373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 13:15:03 -0700
X-CSE-ConnectionGUID: aA/KHlyVSZyI1IVPOy/MkQ==
X-CSE-MsgGUID: V5U8Y83UQmm423ODEWHPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197553698"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2025 13:15:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umHsA-000AI4-1o;
	Wed, 13 Aug 2025 20:14:58 +0000
Date: Thu, 14 Aug 2025 04:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-new 127/137] include/linux/mm.h:752:21: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
Message-ID: <202508140415.9qC6aHiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   694c8e78f486b09137ee3efadae044d01aba971b
commit: ead30cde4eab3fd4d3b40cd0a303d0dd2388556c [127/137] mm: update fork mm->flags initialisation to use bitmap
config: microblaze-randconfig-r131-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140415.9qC6aHiR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508140415.9qC6aHiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140415.9qC6aHiR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1607:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1607:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1607:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1616:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1616:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1616:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1617:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1617:36: sparse:     expected void const *
   kernel/fork.c:1617:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1618:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1618:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1618:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1997:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1997:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1997:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2001:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2001:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2001:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2335:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct *register [addressable] [toplevel] current @@
   kernel/fork.c:2335:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2335:32: sparse:     got struct task_struct *register [addressable] [toplevel] current
   kernel/fork.c:2344:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2344:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2344:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2393:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2393:54: sparse:     expected struct list_head *head
   kernel/fork.c:2393:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2413:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2413:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2413:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2435:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2435:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2435:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2463:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2463:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2463:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2494:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2494:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2494:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2496:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2496:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2496:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2939:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2939:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2939:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3022:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3022:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3022:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file (through include/linux/pagemap.h, include/linux/mempolicy.h):
>> include/linux/mm.h:752:21: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected unsigned long *dst @@     got unsigned long [noderef] * @@
   include/linux/mm.h:752:21: sparse:     expected unsigned long *dst
   include/linux/mm.h:752:21: sparse:     got unsigned long [noderef] *
   kernel/fork.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
   include/linux/mm_types.h:1248:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1248:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1248:33: sparse:     got unsigned long [noderef] *
   include/linux/mm_types.h:1248:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1248:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1248:33: sparse:     got unsigned long [noderef] *
   kernel/fork.c:1712:9: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1851:36: sparse: sparse: context imbalance in 'pidfd_prepare' - different lock contexts for basic block
   kernel/fork.c:2047:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/microblaze/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2391:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2392:59: sparse: sparse: dereference of noderef expression

vim +752 include/linux/mm.h

34e1a4ccaed274 Lorenzo Stoakes 2025-08-12  749  
34e1a4ccaed274 Lorenzo Stoakes 2025-08-12  750  static inline void mm_flags_clear_all(struct mm_struct *mm)
34e1a4ccaed274 Lorenzo Stoakes 2025-08-12  751  {
34e1a4ccaed274 Lorenzo Stoakes 2025-08-12 @752  	bitmap_zero(ACCESS_PRIVATE(&mm->_flags, __mm_flags), NUM_MM_FLAG_BITS);
34e1a4ccaed274 Lorenzo Stoakes 2025-08-12  753  }
34e1a4ccaed274 Lorenzo Stoakes 2025-08-12  754  

:::::: The code at line 752 was first introduced by commit
:::::: 34e1a4ccaed27416e7c6cd5ec43d9f3f41bf107b mm: add bitmap mm->flags field

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

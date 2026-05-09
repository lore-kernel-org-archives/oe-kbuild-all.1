Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E60B19D092
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294627; cv=none; b=m/85ccZPmg1gIEJE86T/dnLAiiIoiyprJiYI4CdE22cjIhPRrkikct+2NhsCA7amEotG7R33/YlgyDTJer3OdfWN+50mUot52QfcTCAHCu8FWatgLA4sNyks6VKS1ak4ZJkuwsyGX9L7W2O15hIjP5kDGjnjonOfjgF/YQFAqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294627; c=relaxed/simple;
	bh=ZBtf1q9Pk1RaHxN+M+o+lhD/Fm/D3mRKMPvCwn3nGLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA7QfSVXiIuVOozgQ8Vmbzqd5iMtW7+M143u770JHQk1AaR5T3s3ZG6L4cpW2NdQQ6y/SKJPRA/2zBjYw2dBj1lgEswUD0XShSYeOeNy+/Cn8qm10eYOhGkGmwaEDYOleBn3xCaboxEOYxbJVPd8E3O2MPCyXfvnqyxrQ90kHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBSqijEB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBSqijEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778294625; x=1809830625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBtf1q9Pk1RaHxN+M+o+lhD/Fm/D3mRKMPvCwn3nGLc=;
  b=CBSqijEBHHi/J0WuJjRmCpEo7H3EZupCda+EL01mMWWI84ApC3mx0k+1
   yvqtzJ4IVkhbbZGgnUF6cmtNIzBjDqSgX8zPwcyRFrIiDf4QYF87AZMA7
   WvUVnnVLr/O2vNBKY9j9UTTZMYHUie713Z32ubzvI3Pd2Pdpl4luGw3e7
   Gsa8/OtkvYh5hyuC0rK0vKaabZdtYK2kaBKZ2h6wAF79KRA36X2tWvrUp
   it8F4/VlwvmEe3I1VG/6vTq0uA7Bm07qXExOaVLQVIqpv9q6Z2uuC+XlY
   xSxz6qG04l1JCEGoFTQ9wrGp8Yv6KgPm2QeO3k8ccwrCHMQEEgNGUfdoZ
   Q==;
X-CSE-ConnectionGUID: YyEct5vQS3m8+otCWlnygg==
X-CSE-MsgGUID: DQzq3j0LR+WXhTcoirQ3+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89859479"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="89859479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 19:43:45 -0700
X-CSE-ConnectionGUID: +7DfvVD9QHWMOcTF/YVNxQ==
X-CSE-MsgGUID: MWTume3TQ2yum3JTFvy+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232417546"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2026 19:43:43 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLXfI-000000000bl-2HXh;
	Sat, 09 May 2026 02:43:40 +0000
Date: Sat, 9 May 2026 10:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Guilhem Massol <guilhem.massol85@gmail.com>, kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guilhem Massol <guilhem.massol85@gmail.com>
Subject: Re: [PATCH] string: Use __restrict__ according to ISO/IEC 9899:TC3
Message-ID: <202605091039.FFdxv5Qe-lkp@intel.com>
References: <20260503131245.13868-1-guilhem.massol85@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503131245.13868-1-guilhem.massol85@gmail.com>

Hi Guilhem,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/hardening]
[also build test WARNING on linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guilhem-Massol/string-Use-__restrict__-according-to-ISO-IEC-9899-TC3/20260505-025614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20260503131245.13868-1-guilhem.massol85%40gmail.com
patch subject: [PATCH] string: Use __restrict__ according to ISO/IEC 9899:TC3
config: microblaze-randconfig-r123-20260509 (https://download.01.org/0day-ci/archive/20260509/202605091039.FFdxv5Qe-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091039.FFdxv5Qe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091039.FFdxv5Qe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1051:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:1051:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:1051:19: sparse:     got struct task_struct *p
   kernel/fork.c:1650:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1650:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1650:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1659:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1659:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1659:31: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1660:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *restrict @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1660:36: sparse:     expected void const *restrict
   kernel/fork.c:1660:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1661:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1661:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1661:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2041:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2041:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2041:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2045:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2045:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2045:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2381:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct *register [addressable] [toplevel] current @@
   kernel/fork.c:2381:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2381:32: sparse:     got struct task_struct *register [addressable] [toplevel] current
   kernel/fork.c:2390:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2390:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2390:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2439:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2439:54: sparse:     expected struct list_head *head
   kernel/fork.c:2439:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2459:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2459:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2459:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2481:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2481:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2481:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2510:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2510:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2510:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2543:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2543:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2543:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2545:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2545:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2545:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2984:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2984:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2984:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3067:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3067:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3067:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1759:9: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2091:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/microblaze/include/generated/uapi/asm/bpf_perf_event.h, include/uapi/linux/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2437:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2438:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:1043:23: sparse:    struct task_struct *
--
>> drivers/mtd/nand/onenand/onenand_base.c:779:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *restrict @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:34: sparse:     expected void const *restrict
   drivers/mtd/nand/onenand/onenand_base.c:779:34: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *restrict @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:34: sparse:     expected void const *restrict
   drivers/mtd/nand/onenand/onenand_base.c:817:34: sparse:     got void [noderef] __iomem *
>> drivers/mtd/nand/onenand/onenand_base.c:860:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *restrict @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:26: sparse:     expected void *restrict
   drivers/mtd/nand/onenand/onenand_base.c:860:26: sparse:     got void [noderef] __iomem *

vim +1660 kernel/fork.c

a016f3389c0660 JANAK DESAI        2006-02-07  1644  
04ff48239f46e8 Simon Schuster     2025-09-01  1645  static int copy_sighand(u64 clone_flags, struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1646  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1647  	struct sighand_struct *sig;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1648  
60348802e9cb13 Zhaolei            2009-01-06  1649  	if (clone_flags & CLONE_SIGHAND) {
d036bda7d0e726 Elena Reshetova    2019-01-18  1650  		refcount_inc(&current->sighand->count);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1651  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1652  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1653  	sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
0c282b068eb26d Madhuparna Bhowmik 2020-01-27  1654  	RCU_INIT_POINTER(tsk->sighand, sig);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1655  	if (!sig)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1656  		return -ENOMEM;
9d7fb04276481c Peter Zijlstra     2015-06-30  1657  
d036bda7d0e726 Elena Reshetova    2019-01-18  1658  	refcount_set(&sig->count, 1);
06e62a46bbba20 Jann Horn          2018-08-21  1659  	spin_lock_irq(&current->sighand->siglock);
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1660  	memcpy(sig->action, current->sighand->action, sizeof(sig->action));
06e62a46bbba20 Jann Horn          2018-08-21  1661  	spin_unlock_irq(&current->sighand->siglock);
b612e5df4587c9 Christian Brauner  2019-10-14  1662  
b612e5df4587c9 Christian Brauner  2019-10-14  1663  	/* Reset all signal handler not set to SIG_IGN to SIG_DFL. */
b612e5df4587c9 Christian Brauner  2019-10-14  1664  	if (clone_flags & CLONE_CLEAR_SIGHAND)
b612e5df4587c9 Christian Brauner  2019-10-14  1665  		flush_signal_handlers(tsk, 0);
b612e5df4587c9 Christian Brauner  2019-10-14  1666  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1667  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1668  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1669  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

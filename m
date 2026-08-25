Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB42EEE90
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787627652; cv=none; b=p5Gi6ao/JX7VAXBzDmuAwxQ/XGVIaoOQg4DqYkNi3eMGFcozJxs74jTxHQ0lxDaIeQPMxh3goDwCyN+6r2rW1gqk7pHkGdMFb4ZOkTLi3SG38IS04HUDtZePxG/Vpo84JhwPz1lD6ycXznKmrFrSIufdMk9tTB2jOnh/zrA3FJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787627652; c=relaxed/simple;
	bh=dOoRRytKS5NuTcf3ujPgNkg9+oAbmAcERQJqTXtsJ34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iAYCP/oekimzniT/N5ZZOFXBMrKFguZFNOGKNE2ld1gMvZqZ3O3pVBZcI6nI01e0z1axi+NthibTTjFAhvzWoJ5WCm0S/05KUYx2Mjspa0IAQw6Rze5+wVhSEdHr5D0WJfxNDCYpNdqn7194JnVTY24riaUtck8yzTrfMT4vsHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzJk9rVL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzJk9rVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787627651; x=1819163651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dOoRRytKS5NuTcf3ujPgNkg9+oAbmAcERQJqTXtsJ34=;
  b=dzJk9rVLmJIefAQwY4zOJ/ip11E87MtR8AlPTdta+YOxqRg0X75iUhGQ
   AZxnV07h20OwlGqXoMEiCX4J7AU9faf9diBp8f0roL4fiy2SmgmAhQ3np
   v/2tB/Bt+6BnOPsBNZzdvhmslcvL9O7kjzaNhsPWNpXiuKLlS5OYljRwR
   I0IlqlPAEmuZFl2L0iAqKGYkzIriur7ceSvel9vz3m9n1kp1lUfamwzHv
   o9SSVc0j9o+dCsdR3XNomigkHoJ4/NEkIEJ52v0Zy7lgQuy3o5l4dJrvY
   ytqZ9S25ikCQ+DqzS3wlu+HC+ImJAa8L69Ibe2PpQX52BO6Q6Ap2YOQ8L
   A==;
X-CSE-ConnectionGUID: s9Kg/iZHRYWkH5F6vRg0vQ==
X-CSE-MsgGUID: ywR+wJj9ROaaXN9x7lZq/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98763571"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="98763571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 20:14:10 -0700
X-CSE-ConnectionGUID: PUdlGmmlSh2eNL09wbURqA==
X-CSE-MsgGUID: NDcYrHmnQOib0ZcqoH4/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="305405809"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2026 20:14:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyhby-000000004rt-17Zy;
	Tue, 25 Aug 2026 03:14:06 +0000
Date: Tue, 25 Aug 2026 11:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 6/14] kernel/locking/lockdep.c:6754:39:
 error: 'lockdep_trace_pool' undeclared; did you mean 'lockdep_trace_stats'?
Message-ID: <202608251159.XhiTMQKp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: 4e4680605a52c4e4bf0f7c6b0cf1455d0b26f4ed [6/14] locking/lockdep: Convert lock graph and radix tables to dynamic pools
config: riscv-randconfig-001-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251159.XhiTMQKp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251159.XhiTMQKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251159.XhiTMQKp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/riscv/include/asm/bug.h:90,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/current.h:13,
                    from include/linux/mutex.h:14,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c: In function 'lockdep_boot_report':
   kernel/locking/lockdep.c:6754:24: error: 'stack_trace' undeclared (first use in this function); did you mean 'lock_trace'?
    6754 |                 sizeof(stack_trace) - lockdep_trace_pool.remaining,
         |                        ^~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6751:9: note: in expansion of macro 'pr_info'
    6751 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~
   kernel/locking/lockdep.c:6754:24: note: each undeclared identifier is reported only once for each function it appears in
    6754 |                 sizeof(stack_trace) - lockdep_trace_pool.remaining,
         |                        ^~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6751:9: note: in expansion of macro 'pr_info'
    6751 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~
>> kernel/locking/lockdep.c:6754:39: error: 'lockdep_trace_pool' undeclared (first use in this function); did you mean 'lockdep_trace_stats'?
    6754 |                 sizeof(stack_trace) - lockdep_trace_pool.remaining,
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6751:9: note: in expansion of macro 'pr_info'
    6751 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~
   kernel/locking/lockdep.c:6755:32: error: 'BOOTSTRAP_STACK_TRACE_ENTRIES' undeclared (first use in this function); did you mean 'BOOTSTRAP_STACK_TRACE_CAP'?
    6755 |                 (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6751:9: note: in expansion of macro 'pr_info'
    6751 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~


vim +6754 kernel/locking/lockdep.c

  6748	
  6749	static int __init lockdep_boot_report(void)
  6750	{
> 6751		pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
  6752			min_t(unsigned long, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES),
  6753			BOOTSTRAP_LOCKDEP_ENTRIES,
> 6754			sizeof(stack_trace) - lockdep_trace_pool.remaining,
  6755			(unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
  6756		return 0;
  6757	}
  6758	core_initcall(lockdep_boot_report);
  6759	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

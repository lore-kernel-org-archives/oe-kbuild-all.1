Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7815234
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741585304; cv=none; b=MVenfDgPiG30gM+DWmGr7zgjReBaylQcJv0GwS+pZD+oTM5JW67LVWSb5f5r/4qo5cCWPl3vVg8HX4IhsrE8ZwIy8QvtEnDZOKknG1HiabhXoRWLrT9DJXPuqV396GmAQHDn8PkZRyfYPbF6M8JtzvJE/mdB9m+ZUMTZznuP6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741585304; c=relaxed/simple;
	bh=rlxd+fWqo4TE8MnjOUcAxD0MqtA+i3itzTtDJOwHgQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rruBEJsc+MmfSIGQimOOzqV1iKjwSfwtDHgSSvZ1a7NsOrshHJZId5iXGR/9sw/4+ECRYT1yI841VpHKWLy4SSC9fgTvd3Cg3a1z3365ZiR6c+HfcOLywjDGXszerF3GumO57ms99oYbzuby0K4kik3n/NSnfFlCFGbBf98E8LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFpUCKOE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFpUCKOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741585301; x=1773121301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlxd+fWqo4TE8MnjOUcAxD0MqtA+i3itzTtDJOwHgQU=;
  b=WFpUCKOEBRxXnZQJiz7T+Ef9DQl2qAdsWmBdc9QZjPExDcswHESY032V
   ME13MShRE6zBPIuBJ2iEcb6XsSxjcb7JkuDLrsKkEJpZ3aou6ygopLRjU
   VUQC2V+zURFaNLpZa+w2w3rHeXSdW1vmYtb553GiInu8C2PGn7q+VECL0
   RtxXAeAzWSpOrhlSFzpYMkRCtBnOd/pjBC61ymN+0yz+IlUKaYnpZmwv3
   +M4GWxpybRHJ8ZYDVJhp4HNSD4LIXRxlFJtjXHvUXlS57yWY/jtlVsw3R
   SZblaW7gXg0S8QAvhfEieGHvzKQbHCqWfw/tsy0keZSnhT4hmPiMg6Asa
   w==;
X-CSE-ConnectionGUID: fqCtkd9yRRKnPRjedHpxuw==
X-CSE-MsgGUID: YVowgusYTKivkcEEnjSDhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42676875"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42676875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 22:41:41 -0700
X-CSE-ConnectionGUID: uP7jUlZRQGyL7cSabsZ8mg==
X-CSE-MsgGUID: kPmYRobAT9q+yCRNZMe2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119735069"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2025 22:41:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trVtR-0003qC-1O;
	Mon, 10 Mar 2025 05:41:37 +0000
Date: Mon, 10 Mar 2025 13:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 460/9634] kernel/sched/ext_idle.c:115:24: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202503101321.WcGYNUia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrea,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 337d1b354a297155579dea970fff9dd10ed32f77 [460/9634] sched_ext: Move built-in idle CPU selection policy to a separate file
config: sparc-randconfig-r113-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101321.WcGYNUia-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250310/202503101321.WcGYNUia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101321.WcGYNUia-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:1262:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1262:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1362:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1362:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1362:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1672:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1672:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1672:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1672:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1672:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1672:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1761:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1761:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1761:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2580:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2580:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2580:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2244:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2244:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2244:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2245:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2245:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2245:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2320:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2320:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2320:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2880:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2880:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2880:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2882:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2882:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2882:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2884:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2884:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2884:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3069:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3069:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3069:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3118:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:1635:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1767:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1767:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1767:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:2208:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2208:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2208:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2218:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2218:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2218:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3058:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3058:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3058:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4888:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4888:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4888:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5611:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5611:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5611:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6890:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6890:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6890:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext_idle.c:115:24: sparse: sparse: Using plain integer as NULL pointer
>> kernel/sched/ext_idle.c:530:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2299:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2299:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2299:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2299:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2488:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2488:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2488:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2299:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2299:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2488:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2488:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2488:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1288:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1699:15: sparse: sparse: dereference of noderef expression

vim +115 kernel/sched/ext_idle.c

   104	
   105	/*
   106	 * Return the cpumask representing the LLC domain of @cpu (or NULL if the LLC
   107	 * domain is not defined).
   108	 */
   109	static struct cpumask *llc_span(s32 cpu)
   110	{
   111		struct sched_domain *sd;
   112	
   113		sd = rcu_dereference(per_cpu(sd_llc, cpu));
   114		if (!sd)
 > 115			return 0;
   116	
   117		return sched_domain_span(sd);
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

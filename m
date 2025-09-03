Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58524CEEA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756924840; cv=none; b=dj2v9IWaG70TWl5EWTr55E8oB2UpSvADGEyv1ciPcqVhHvvrwbCmQEADE+I6RYgAUdyAa04HDzzOwhopzWPk+pnrrfnC2X1m/Zp1nmzteQS/3OxTROl7B1r7n2Dm3NpLXCsn9oLMwf3xU3yaDylKyadVJ4mL6o4hznpgc4tQVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756924840; c=relaxed/simple;
	bh=l03R1ST4ZEsyh+/syKbc6prxLEvAl9nTc0Dn2dWzgj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLGZjtn3zFwe9c774rWUNJl7wJpqayWNdRT4fyg4YU4LUx/0bq0jJ8pHXyH85fC7/Ndl9CegUmflX9C+3OpkXQ3YZPOnnXa8izL3/nVZNPY63lh0P5P+kDGOXp8QQfjmu2tpDIlayqxxor6YWXQGEiE1pKcd+wrj+Nj5Ze8ItuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1YAZgfy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1YAZgfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756924839; x=1788460839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l03R1ST4ZEsyh+/syKbc6prxLEvAl9nTc0Dn2dWzgj4=;
  b=L1YAZgfyN3KLjXyqomJSxZWKCscIaHaWl5tXHIlpWeB3D3WeiE0P9HtM
   vS+quF4ASUbPTy/0bTA3jDs6nXEzZfxwNGBahaJ8XhoBWj7iJQvbXOSLN
   pt155eKqDPqPl0xEFALC8lz9YiRPfD1wrxWHlLM7LHtGJ9/koQDU+lGXS
   Pd320FRQq4zmbT+nQ4Sy92O+xWeM+EveDvKop8xL9iGI+g1PZqQR53ypt
   hE8wsVd4VlcxWBD5RIM2hcouUSuEQ/K3eLJr1OTu08odmDzo6uVX2eY9X
   HvkYHYYMIY6bq5oRrqJRBQ1QgHtMUhHskJ5w+DhHuhvWyJVgYlA/vO86h
   g==;
X-CSE-ConnectionGUID: mt0n/OsjTt2VpeSOz8WVqw==
X-CSE-MsgGUID: 5rzUkq+kRzyaweosmamdMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69862266"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="69862266"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 11:40:37 -0700
X-CSE-ConnectionGUID: hWOD3uz6QPCui2a681Ph7w==
X-CSE-MsgGUID: u8aD0jOVS+CibjNatu6xXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="170921064"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Sep 2025 11:40:36 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utsPJ-0004Jf-1j;
	Wed, 03 Sep 2025 18:40:33 +0000
Date: Thu, 4 Sep 2025 02:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-hier-prototype 14/14] kernel/sched/core.c:4808:16:
 error: too many arguments to function 'scx_fork'
Message-ID: <202509040251.3nQybkRA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/74/7443f4ccb9e360cd50e991db81d27e3514f1be65-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-hier-prototype
head:   7443f4ccb9e360cd50e991db81d27e3514f1be65
commit: 7443f4ccb9e360cd50e991db81d27e3514f1be65 [14/14] scx_hier: WIP
config: sparc-randconfig-r071-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040251.3nQybkRA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040251.3nQybkRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040251.3nQybkRA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:88,
                    from include/linux/percpu.h:12,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:14,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   include/linux/sched/ext.h:220:42: warning: 'struct task_sturct' declared inside parameter list will not be visible outside of this definition or declaration
     220 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_cgroup_fork':
>> kernel/sched/core.c:4808:16: error: too many arguments to function 'scx_fork'
    4808 |         return scx_fork(p, kargs);
         |                ^~~~~~~~
   In file included from kernel/sched/sched.h:3875,
                    from kernel/sched/core.c:89:
   kernel/sched/ext.h:47:19: note: declared here
      47 | static inline int scx_fork(struct task_struct *p) { return 0; }
         |                   ^~~~~~~~


vim +/scx_fork +4808 kernel/sched/core.c

  4779	
  4780	int sched_cgroup_fork(struct task_struct *p, struct kernel_clone_args *kargs)
  4781	{
  4782		unsigned long flags;
  4783	
  4784		/*
  4785		 * Because we're not yet on the pid-hash, p->pi_lock isn't strictly
  4786		 * required yet, but lockdep gets upset if rules are violated.
  4787		 */
  4788		raw_spin_lock_irqsave(&p->pi_lock, flags);
  4789	#ifdef CONFIG_CGROUP_SCHED
  4790		if (1) {
  4791			struct task_group *tg;
  4792			tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
  4793					  struct task_group, css);
  4794			tg = autogroup_task_group(p, tg);
  4795			p->sched_task_group = tg;
  4796		}
  4797	#endif
  4798		rseq_migrate(p);
  4799		/*
  4800		 * We're setting the CPU for the first time, we don't migrate,
  4801		 * so use __set_task_cpu().
  4802		 */
  4803		__set_task_cpu(p, smp_processor_id());
  4804		if (p->sched_class->task_fork)
  4805			p->sched_class->task_fork(p);
  4806		raw_spin_unlock_irqrestore(&p->pi_lock, flags);
  4807	
> 4808		return scx_fork(p, kargs);
  4809	}
  4810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

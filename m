Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38D2F83B6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756291358; cv=none; b=a+Nch6rVvcisruaN9DXtJAPacmYUO2S0I5IJfUMLL1LJqGytgr0NTtF1Ss2BmuIjpDZRDvKmUpOUMiTRR5VKUMdoNN1jrX0UNFgjBMo0ZQ28balTnsmKkDSFLjiVYDWcLgZFzziu5UmqkL6qlw6wlZAzXcJm6AzR5PA+Eiot7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756291358; c=relaxed/simple;
	bh=cSJwRbi6F2xyti/H4qoyQiPHihqckj2vtaXI38BLgNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tnrg8+gSXm2H0QGXexv0z3ZStfjQu4gLk6+nqxW41oN0+vz6Z5EVezq/BnyyXuiD3q1vvqrJ51hHuzzCsTf7rK2mtkiLPKogknBHzq8cms/4sx9WH6YsTqgDmihZrCDvGVRojLuEz9osqlFYljW60fppeTUVnrpYviXwxRMcoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIjugH7l; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIjugH7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756291356; x=1787827356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSJwRbi6F2xyti/H4qoyQiPHihqckj2vtaXI38BLgNE=;
  b=lIjugH7lRSkdM1QkiADJ9pJoIcaZkiFPAaA9WMrVuwtadRtaCfGPnS6c
   Ou99EEEl776gL7w4Kq2203M8hjaE9yaqB5jJiy8oPGdI35eu71HsxjdzC
   LFbuu1iD1B1NQWkHTG8FLn9S2n5tytgy+hK/F5o1aBOIwICZQsE9U+6iv
   R4knM1nm0It9QFJ15LKkyijzzv1bo5NROW2fX2alwEQI6BGGSC8s7NLF7
   C3lTvzOnTQPw57hNgEgQ9CVocViIH8c8u+mNSjFmKBEOtdTD4mpMq4SJC
   Jw8zcLYXl1ZEVAEdqeMpSSSxw2ZttOH2udyIh5hGHXRaCUNNTsQUU0OIl
   g==;
X-CSE-ConnectionGUID: g8upQYZwQwiTeHymiIVnfA==
X-CSE-MsgGUID: CGdVMFJoRAmYTzAFnLCWAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58690601"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58690601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:42:36 -0700
X-CSE-ConnectionGUID: pxxHyCiUTTerS6xBH/a4Lw==
X-CSE-MsgGUID: fUkN+950T7qLtJAT1QCsmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="206980211"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Aug 2025 03:42:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urDbs-000SsJ-1R;
	Wed, 27 Aug 2025 10:42:32 +0000
Date: Wed, 27 Aug 2025 18:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3164/3164] kernel/sched/fair.c:9944:43: error:
 incomplete definition of type 'struct task_group'
Message-ID: <202508271837.ae2GMAYR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2631a43115d05f216c64dbf901afa2b4bfdf13f5
commit: 433c0b72564239cf3086f563d5ca32a10e4ffd3f [3164/3164] sched/fair: Count the number of tasks marked as steal_task on cfs_rq
config: x86_64-randconfig-104-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271837.ae2GMAYR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271837.ae2GMAYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271837.ae2GMAYR-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:4483:31: error: implicit declaration of function 'is_tg_steal' [-Werror,-Wimplicit-function-declaration]
    4483 |         return group_steal_used() && is_tg_steal(steal_task);
         |                                      ^
   kernel/sched/fair.c:6013:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6013 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^
   kernel/sched/fair.c:6013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6013 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         | ^
         | static 
   kernel/sched/fair.c:9944:29: error: implicit declaration of function 'is_tg_steal' [-Werror,-Wimplicit-function-declaration]
    9944 |         if (group_steal_used() && !is_tg_steal(tg->steal_task))
         |                                    ^
>> kernel/sched/fair.c:9944:43: error: incomplete definition of type 'struct task_group'
    9944 |         if (group_steal_used() && !is_tg_steal(tg->steal_task))
         |                                                ~~^
   include/linux/sched.h:69:8: note: forward declaration of 'struct task_group'
      69 | struct task_group;
         |        ^
   kernel/sched/fair.c:13961:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    13961 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13961 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:13963:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    13963 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:13963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13963 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:13968:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    13968 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13968:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13968 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:13970:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    13970 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13970:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13970 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   5 warnings and 3 errors generated.


vim +9944 kernel/sched/fair.c

  9929	
  9930	#ifdef CONFIG_SCHED_STEAL
  9931	/*
  9932	 * Return true if task @p can migrate from @rq to @dst_rq in the same LLC.
  9933	 * No need to test for co-locality, and no need to test task_hot(), as sharing
  9934	 * LLC provides cache warmth at that level.
  9935	 */
  9936	static bool
  9937	can_migrate_task_llc(struct task_struct *p, struct rq *rq, struct rq *dst_rq)
  9938	{
  9939		int dst_cpu = dst_rq->cpu;
  9940		struct task_group *tg = task_group(p);
  9941	
  9942		lockdep_assert_rq_held(rq);
  9943	
> 9944		if (group_steal_used() && !is_tg_steal(tg->steal_task))
  9945			return false;
  9946	
  9947		if (throttled_lb_pair(tg, cpu_of(rq), dst_cpu))
  9948			return false;
  9949	
  9950		if (!cpumask_test_cpu(dst_cpu, p->cpus_ptr)) {
  9951			schedstat_inc(p->se.statistics.nr_failed_migrations_affine);
  9952			return false;
  9953		}
  9954	
  9955		if (task_running(rq, p)) {
  9956			schedstat_inc(p->se.statistics.nr_failed_migrations_running);
  9957			return false;
  9958		}
  9959	
  9960		return true;
  9961	}
  9962	#endif
  9963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

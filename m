Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2352D6E67
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316301; cv=none; b=i5O5dGLYnnflpGqOXUlM3GEz2iDRLaYjU6l3hWmSBN3QkWr/RS/Z5c8hy3mAu/kPCI2ha6XxPYQAbEotsFV+jGZ0qgxHSyZSFoP9caJg+IVXEfoLkucgCNc6AMM9lP3zi8Vnk10c4gW2dIDs8TeJN4c9Wamsl6TicBjbeZaXDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316301; c=relaxed/simple;
	bh=X0wfeZbVTUaNHvAbL4TXLp1hO3CgG1w+65HUZcKpLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqW8E7BKQmoQWC51BdMLNmh06HfyX8TQjbZ1spYgXQN3FYmgdowmCDMPo5bxO2Eb1RWit+2lVWIScFi4cEDqo/+9oNj3Aa3tXmeALdfAEEv89rgkawvhPKSBMSM+FDmH1KrYW8OLPx/3or8CgEz6GtlBN3cSIfM687KU+EH4q0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyDIG7FF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyDIG7FF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768316300; x=1799852300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X0wfeZbVTUaNHvAbL4TXLp1hO3CgG1w+65HUZcKpLEY=;
  b=WyDIG7FFJLCvvTFk30thX9lpNeTHWrqNsZWlA0tm2dlSzSw69UJYRuyx
   UCCYnmBFGvsCxpE/Oiyc3jnjlopE8mch46Zu/rXJUuvc8qZhr0v6MIZ/e
   NbZ8IGMxf+9Jj9pXuxc5/IbeOQhkK6Xf6eurekXekAzzXv9Q+WzRoTIkH
   XpMDgQeL+KdnexapeukYTP5IHOdSbvh7xiqEcfA5tfffvyDSHMXJI102X
   v9Cqzqx9Upn2lci3OyKBk2PN2t/nLYmy5NztwZEKmy2zCJQUdOTy7byyU
   rHufgD/CYnR3S8+UstK4JqFlEgYQjsSKR+mWFq4tbMnqFbAUG5WtpeE37
   A==;
X-CSE-ConnectionGUID: cuIWf4KmSUu95xaXP1w74Q==
X-CSE-MsgGUID: sAOpRBFeRKCbGUFKHDd92A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69334078"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69334078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:58:20 -0800
X-CSE-ConnectionGUID: PknLjzv0TiuB+J9cZ8PEqQ==
X-CSE-MsgGUID: Qrdmmo/wRmq94bBMwjgvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235658198"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 06:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffqY-00000000ExW-3PcX;
	Tue, 13 Jan 2026 14:58:14 +0000
Date: Tue, 13 Jan 2026 22:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Rosalie Fang <rosaliefang@google.com>
Subject: Re: [PATCH] perf/core: Fix slow perf_event_task_exit() with LBR
 callstacks
Message-ID: <202601132200.HPQCccpc-lkp@intel.com>
References: <20260112165157.1919624-1-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165157.1919624-1-namhyung@kernel.org>

Hi Namhyung,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.19-rc5 next-20260113]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/perf-core-Fix-slow-perf_event_task_exit-with-LBR-callstacks/20260113-005301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260112165157.1919624-1-namhyung%40kernel.org
patch subject: [PATCH] perf/core: Fix slow perf_event_task_exit() with LBR callstacks
config: riscv-randconfig-r111-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132200.HPQCccpc-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132200.HPQCccpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132200.HPQCccpc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1486:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1486:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1486:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1499:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1499:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1499:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3669:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3669:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3669:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3673:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3673:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3673:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3674:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3674:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3674:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3727:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3727:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3727:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3728:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3728:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3728:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4111:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4111:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4111:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4519:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4519:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4519:15: sparse:    struct perf_event_context *
   kernel/events/core.c:5008:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5008:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:5008:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6651:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6651:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6651:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5283:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
   kernel/events/core.c:5283:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu *__new @@     got struct perf_ctx_data *[assigned] cd @@
>> kernel/events/core.c:5283:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/events/core.c:5294:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
   kernel/events/core.c:5294:37: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/events/core.c:6166:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:6402:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6402:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6402:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6526:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6526:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6526:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6559:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6559:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6559:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6672:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6672:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6672:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6688:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6688:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6688:14: sparse:    struct perf_buffer *
   kernel/events/core.c:8667:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8667:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8667:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8755:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8755:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8755:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8859:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8859:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8859:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8861:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8861:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8861:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9597:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9597:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9597:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10792:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10792:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10792:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10831:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10831:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10831:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:14213:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14213:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14213:9: sparse:    struct perf_event_context *
   kernel/events/core.c:14733:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14733:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:14733:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:184:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:200:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1533:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:3009:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4982:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   kernel/events/core.c:10645:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10645:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10645:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10665:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10665:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10665:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10781:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10781:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10781:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10781:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10781:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10781:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10781:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10781:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10781:16: sparse:    struct swevent_hlist *

vim +/__rcu +5283 kernel/events/core.c

  5271	
  5272	static int
  5273	attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
  5274			     bool global)
  5275	{
  5276		struct perf_ctx_data *cd, *old = NULL;
  5277	
  5278		cd = alloc_perf_ctx_data(ctx_cache, global);
  5279		if (!cd)
  5280			return -ENOMEM;
  5281	
  5282		for (;;) {
> 5283			if (try_cmpxchg(&task->perf_ctx_data, &old, cd)) {
  5284				if (old)
  5285					perf_free_ctx_data_rcu(old);
  5286				/*
  5287				 * Above try_cmpxchg() pairs with try_cmpxchg() from
  5288				 * detach_task_ctx_data() such that
  5289				 * if we race with perf_event_exit_task(), we must
  5290				 * observe PF_EXITING.
  5291				 */
  5292				if (task->flags & PF_EXITING) {
  5293					/* detach_task_ctx_data() may free it already */
  5294					if (try_cmpxchg(&task->perf_ctx_data, &cd, NULL))
  5295						perf_free_ctx_data_rcu(cd);
  5296				}
  5297				return 0;
  5298			}
  5299	
  5300			if (!old) {
  5301				/*
  5302				 * After seeing a dead @old, we raced with
  5303				 * removal and lost, try again to install @cd.
  5304				 */
  5305				continue;
  5306			}
  5307	
  5308			if (refcount_inc_not_zero(&old->refcount)) {
  5309				free_perf_ctx_data(cd); /* unused */
  5310				return 0;
  5311			}
  5312	
  5313			/*
  5314			 * @old is a dead object, refcount==0 is stable, try and
  5315			 * replace it with @cd.
  5316			 */
  5317		}
  5318		return 0;
  5319	}
  5320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

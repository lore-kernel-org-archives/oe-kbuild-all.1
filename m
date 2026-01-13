Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407521D3C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 00:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263890; cv=none; b=ATWqE0Pg0q48IjGvSe7n1zgfvgLrMmrCxtUoXYEjL8X8elrp2E5vgeWQlWHDwE898xFJo+bY5yg/LsOo/vI483zeHwoDMLEecxJIePM2B2E64zvyCiQ4HliHbyN08+1QqVUU/SBIG7jbcXo8AiHdUUeWggwbyKFeKMa7+kj73Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263890; c=relaxed/simple;
	bh=1BltHRTsR0X+uukcCyfIVs3uRqt8TDOPa1szpQSBpxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw9pEpoTL6LJU+UP2u6KIJu08r4j9sdw1CgU4JK8w4uArE06J1lapkT8DgjdtcUhoLAuxWj0un+w0B0vMzPw4/pwGcjhNjKxyR+YAPwH91hnwkMxH1pO06m6X5omt4vMPLHwsTp0IW3k1KWAZPq/OaCMPCFRIHuQ3xhSrMTDkro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdXkS9il; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdXkS9il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768263887; x=1799799887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1BltHRTsR0X+uukcCyfIVs3uRqt8TDOPa1szpQSBpxE=;
  b=HdXkS9ilPpO3fFOuL1sFgXOrTG5CK4Z3EQaGdoc4C2ebZBt9AdeNcBAD
   q6QcWxvC243Kq0CJoS39/LOLLtFkTAKZOuOwHsBxyCMMtQn+MBfz0K49t
   zF78S8axeXf6xbNd5/VE7e09z6S47iZimljloyrZglgo/qGrDPLZ9Z2Ns
   z9t+Z6a5w2zyVAZ8E8zoioQmMW8uwRZktYGhvAmeB9dkrQn9lRosUMr9K
   6IlD+/D9TLQaRTf4QqDMF19FMnR/4YMRfxYx3EX+WFwKxdgxkGfAmAq1p
   JgqPMwRrZnfLc9h5SB/P45rGAk35/fvl8bGGfBTmgL7KoVNoe2JVRMoaT
   w==;
X-CSE-ConnectionGUID: cxHROo1vRLyO7Tev5WMqkw==
X-CSE-MsgGUID: 9EoWjLnWT66DkPSuM7LpaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69457319"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69457319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 16:24:46 -0800
X-CSE-ConnectionGUID: Z7kgkq23RPeedzUQdbIpfA==
X-CSE-MsgGUID: q2OiVmbbSJSO8pbCMjto5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204043097"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2026 16:24:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfSDB-00000000E1k-1cRR;
	Tue, 13 Jan 2026 00:24:41 +0000
Date: Tue, 13 Jan 2026 08:24:12 +0800
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
Message-ID: <202601130832.k1P5IrSS-lkp@intel.com>
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
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.19-rc5 next-20260109]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/perf-core-Fix-slow-perf_event_task_exit-with-LBR-callstacks/20260113-005301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260112165157.1919624-1-namhyung%40kernel.org
patch subject: [PATCH] perf/core: Fix slow perf_event_task_exit() with LBR callstacks
config: hexagon-randconfig-r122-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130832.k1P5IrSS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130832.k1P5IrSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130832.k1P5IrSS-lkp@intel.com/

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
>> kernel/events/core.c:5283:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
>> kernel/events/core.c:5283:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu *__new @@     got struct perf_ctx_data *[assigned] cd @@
   kernel/events/core.c:5294:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
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
   kernel/events/core.c:11106:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11106:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:11106:23: sparse:    struct perf_event_context *
   kernel/events/core.c:14213:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14213:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14213:9: sparse:    struct perf_event_context *
   kernel/events/core.c:14733:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14733:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:14733:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:184:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:200:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
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

vim +5283 kernel/events/core.c

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

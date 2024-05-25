Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2F4AEF8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716662214; cv=none; b=q3Fubjt8L4OKZ+FNIEK7antQ1/NeQUHzMpkDZTy/yCVRNYNWB0vf2UewTlfDfkhkC+GKFI9C6GBO5MEU/ExUEQU4RT69iz5BY1mTIXrQSnR/268zNUFkmmJAaW0ZjZqDz01UlsSWkvuVGE5CvQTdXKwXXNWvX4BJ61kfg+9h4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716662214; c=relaxed/simple;
	bh=os2zGkdcHtdyVJnb3GlBNJLPJ4cwgcHwlDi5M8vW0Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hs8BWzDErzqq2vKrmlFdr7i1IJ4c+EVrEUE2o7SUPOdysy1V+3J3rhOWG9WEhupYE0KKaIQe+osmUiOoVN9rIP5hBi3eoRgKszZ5IlPrG65hNltYcGyZgiVLQ6c2ipke9T8wubIkuTHQCAl9WMKmxL88c/Ayc1rWgvDdAlPKkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTkdZTTi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTkdZTTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716662212; x=1748198212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=os2zGkdcHtdyVJnb3GlBNJLPJ4cwgcHwlDi5M8vW0Z4=;
  b=FTkdZTTihQQL0c54/A1P2XEeujWe8i7bpqeCQuZNe67WYORBQMSwDBt9
   7qOtwFxABj50JikR5Sw++aX9+6jS86IYEY+SvR8j3lLdF2rg0bZwy2FRq
   OzVpuAg33TTkrPEIcz2dfX2Cud4GEgRJtLagj9wUo1txzeXmltUtPyHN7
   Ct1KlGJQtF13w907i6KmcZdeP6Hu6D2AeRyClBhidQ6yZ0hpR9TK1N3He
   eD1xSISoGPidFSwKH9Sfe/OS/t3e83HyaoauI8vYv1dSQaZRLGraKExXa
   KWlF1nikKV8/1Q8Co+T3tTG2kW8BJ8mQ5pGlcPPQfiiV0GoFiLZLNiskg
   w==;
X-CSE-ConnectionGUID: sqBFYrrDQRKRN1tSph32+Q==
X-CSE-MsgGUID: McB4eBpBRBapYUqunAOu9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="23625017"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="23625017"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 11:36:51 -0700
X-CSE-ConnectionGUID: epCn3wVzTAi63AaVF0m3pA==
X-CSE-MsgGUID: FUlX+QO3QZypEW5FHESdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="71745894"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 May 2024 11:36:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAwG8-0007JR-01;
	Sat, 25 May 2024 18:36:48 +0000
Date: Sun, 26 May 2024 02:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] kernel/fork.c:2815:9: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202405260231.7T9eV6xI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 745009dc796e56fc87e911138d801679ecd3576e [2/2] test
config: i386-buildonly-randconfig-002-20240526 (https://download.01.org/0day-ci/archive/20240526/202405260231.7T9eV6xI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260231.7T9eV6xI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260231.7T9eV6xI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c: In function 'kernel_clone':
   kernel/fork.c:2815:11: error: implicit declaration of function 'klp_shadow_get_or_alloc' [-Werror=implicit-function-declaration]
     newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
              ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/fork.c:2815:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
            ^
   cc1: some warnings being treated as errors


vim +2815 kernel/fork.c

  2756	
  2757	/*
  2758	 *  Ok, this is the main fork-routine.
  2759	 *
  2760	 * It copies the process, and if successful kick-starts
  2761	 * it and waits for it to finish using the VM if required.
  2762	 *
  2763	 * args->exit_signal is expected to be checked for sanity by the caller.
  2764	 */
  2765	#include <linux/livepatch.h>
  2766	pid_t kernel_clone(struct kernel_clone_args *args)
  2767	{
  2768		u64 clone_flags = args->flags;
  2769		struct completion vfork;
  2770		struct pid *pid;
  2771		struct task_struct *p;
  2772		int trace = 0;
  2773		pid_t nr;
  2774		int *newpid;
  2775		static int ctr = 0;
  2776	
  2777		/*
  2778		 * For legacy clone() calls, CLONE_PIDFD uses the parent_tid argument
  2779		 * to return the pidfd. Hence, CLONE_PIDFD and CLONE_PARENT_SETTID are
  2780		 * mutually exclusive. With clone3() CLONE_PIDFD has grown a separate
  2781		 * field in struct clone_args and it still doesn't make sense to have
  2782		 * them both point at the same memory location. Performing this check
  2783		 * here has the advantage that we don't need to have a separate helper
  2784		 * to check for legacy clone().
  2785		 */
  2786		if ((clone_flags & CLONE_PIDFD) &&
  2787		    (clone_flags & CLONE_PARENT_SETTID) &&
  2788		    (args->pidfd == args->parent_tid))
  2789			return -EINVAL;
  2790	
  2791		/*
  2792		 * Determine whether and which event to report to ptracer.  When
  2793		 * called from kernel_thread or CLONE_UNTRACED is explicitly
  2794		 * requested, no event is reported; otherwise, report if the event
  2795		 * for the type of forking is enabled.
  2796		 */
  2797		if (!(clone_flags & CLONE_UNTRACED)) {
  2798			if (clone_flags & CLONE_VFORK)
  2799				trace = PTRACE_EVENT_VFORK;
  2800			else if (args->exit_signal != SIGCHLD)
  2801				trace = PTRACE_EVENT_CLONE;
  2802			else
  2803				trace = PTRACE_EVENT_FORK;
  2804	
  2805			if (likely(!ptrace_event_enabled(current, trace)))
  2806				trace = 0;
  2807		}
  2808	
  2809		p = copy_process(NULL, trace, NUMA_NO_NODE, args);
  2810		add_latent_entropy();
  2811	
  2812		if (IS_ERR(p))
  2813			return PTR_ERR(p);
  2814	
> 2815		newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
  2816						 NULL, NULL);
  2817		if (newpid)
  2818			*newpid = ctr++;
  2819	
  2820		/*
  2821		 * Do this prior waking up the new thread - the thread pointer
  2822		 * might get invalid after that point, if the thread exits quickly.
  2823		 */
  2824		trace_sched_process_fork(current, p);
  2825	
  2826		pid = get_task_pid(p, PIDTYPE_PID);
  2827		nr = pid_vnr(pid);
  2828	
  2829		if (clone_flags & CLONE_PARENT_SETTID)
  2830			put_user(nr, args->parent_tid);
  2831	
  2832		if (clone_flags & CLONE_VFORK) {
  2833			p->vfork_done = &vfork;
  2834			init_completion(&vfork);
  2835			get_task_struct(p);
  2836		}
  2837	
  2838		if (IS_ENABLED(CONFIG_LRU_GEN_WALKS_MMU) && !(clone_flags & CLONE_VM)) {
  2839			/* lock the task to synchronize with memcg migration */
  2840			task_lock(p);
  2841			lru_gen_add_mm(p->mm);
  2842			task_unlock(p);
  2843		}
  2844	
  2845		wake_up_new_task(p);
  2846	
  2847		/* forking complete and child started to run, tell ptracer */
  2848		if (unlikely(trace))
  2849			ptrace_event_pid(trace, pid);
  2850	
  2851		if (clone_flags & CLONE_VFORK) {
  2852			if (!wait_for_vfork_done(p, &vfork))
  2853				ptrace_event_pid(PTRACE_EVENT_VFORK_DONE, pid);
  2854		}
  2855	
  2856		put_pid(pid);
  2857		return nr;
  2858	}
  2859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

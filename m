Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3355D344DBB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322721; cv=none; b=Kid2gr7sQwGuMCeQZNVzZ/sQUbTpQ8Ry8zCcqTeenFTuOhxSnDmqZQyman1rILrzSfLFBVp78mGW5iKzKKr28daRF8cPtNrjJLpUyb/BGIQekj6WC/8fxQYrIkZPpitsDDR2pWiALAxm7rAXilZamMxwQ8/r1MSGGegrVu9HCYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322721; c=relaxed/simple;
	bh=8EA62UK9JhHAGEyADmCTqmkvjv4ldzfsdkLJwq81dd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krLTqM76s9RiL7ZCgYArWef7gmnOhguCHlX9Xu0Nu7HUW5tKeke8d8GBuedVc67wQtuKJ+hfhvMThBl79qv7Z+mdrKOgdqP8Q4Pg0hX4ylhg3DUnlCRZItfZOtxXS5OqCqbKh0g359IQDzBUyfzyQ74tyeVqp+KQDmW3MmFpi94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSHQfUWC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSHQfUWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773322717; x=1804858717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8EA62UK9JhHAGEyADmCTqmkvjv4ldzfsdkLJwq81dd8=;
  b=mSHQfUWCpPQYUQzIoGDhqP4aHWUOFq77fX5tP7vxIMpc8/8Otr/DHspA
   7zoBadbpuX4xt2UNRWhntKGCpWtP29gwga2aJJ/jnhb0xWgmZX974xxKH
   Rg2kdiG+OCvg3X/HtQn+Q4EJtON+965b+Zl2Qm5+fgBXZSRiLI6fkW7/o
   Z5hR/DUKZHL25TCurd3jCUa/xCy7dH65jECDGJvYlBZ/APj7az/irMPqG
   2a8YxM1ElaQPUS5v0bKCwW34EhuAgFu3mP4zPTVRZflUpMiAv0N3wahqG
   Kv4aNXrABA+/PtrRmOl78hARN8Y51DlOy5Bft6dX4woQpejvfJxi18LYI
   w==;
X-CSE-ConnectionGUID: WAvDRSm6RAuSctQnRmtR/g==
X-CSE-MsgGUID: IKpMJCO6TWGlRyjaLCMIdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73602284"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="73602284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 06:38:36 -0700
X-CSE-ConnectionGUID: m7NQvCz4QHOzKI87XT+4eA==
X-CSE-MsgGUID: YkcqDk3PTMOw3SdjpLljxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="243848277"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2026 06:38:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0gFA-000000002WF-3y87;
	Thu, 12 Mar 2026 13:38:28 +0000
Date: Thu, 12 Mar 2026 21:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Chen Yu <yu.c.chen@intel.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v4 2/9] sched/topology: Extract "imb_numa_nr" calculation
 into a separate helper
Message-ID: <202603122149.xyvcIkPY-lkp@intel.com>
References: <20260312044434.1974-3-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312044434.1974-3-kprateek.nayak@amd.com>

Hi Prateek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 54a66e431eeacf23e1dc47cb3507f2d0c068aaf0]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/sched-topology-Compute-sd_weight-considering-cpuset-partitions/20260312-125021
base:   54a66e431eeacf23e1dc47cb3507f2d0c068aaf0
patch link:    https://lore.kernel.org/r/20260312044434.1974-3-kprateek.nayak%40amd.com
patch subject: [PATCH v4 2/9] sched/topology: Extract "imb_numa_nr" calculation into a separate helper
config: nios2-randconfig-r131-20260312 (https://download.01.org/0day-ci/archive/20260312/202603122149.xyvcIkPY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603122149.xyvcIkPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603122149.xyvcIkPY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:730:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:730:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:730:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:1069:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1069:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1069:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:1069:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1069:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1069:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/stats.c:136:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/stats.c:136:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/stats.c:136:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:116:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:116:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:116:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:135:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:135:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:135:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:158:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:158:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:158:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:469:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:469:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:469:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:644:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:644:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:644:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:729:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:729:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:729:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:737:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:737:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:737:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:750:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:750:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:750:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:755:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:755:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:755:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:776:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:776:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:776:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:938:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:938:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:938:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:967:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:967:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:967:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1013:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1013:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1013:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1015:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1015:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1015:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1023:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1023:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1023:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1025:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1025:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1025:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1095:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1095:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1095:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1199:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1199:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1199:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1337:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1337:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1337:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1683:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1683:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1683:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2478:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2478:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2478:31: sparse:     got struct sched_domain *sd
>> kernel/sched/topology.c:2606:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2606:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2606:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
>> kernel/sched/topology.c:2608:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2608:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2608:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2613:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2613:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2613:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2618:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2618:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2618:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2667:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2667:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2667:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2686:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2686:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2686:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2701:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2701:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2701:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2367:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2367:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2367:25: sparse:    struct task_struct *

vim +2606 kernel/sched/topology.c

  2553	
  2554	/*
  2555	 * Calculate an allowed NUMA imbalance such that LLCs do not get
  2556	 * imbalanced.
  2557	 */
  2558	static void adjust_numa_imbalance(struct sched_domain *sd_llc)
  2559	{
  2560		struct sched_domain *parent;
  2561		unsigned int imb_span = 1;
  2562		unsigned int imb = 0;
  2563		unsigned int nr_llcs;
  2564	
  2565		WARN_ON(!(sd_llc->flags & SD_SHARE_LLC));
  2566		WARN_ON(!sd_llc->parent);
  2567	
  2568		/*
  2569		 * For a single LLC per node, allow an
  2570		 * imbalance up to 12.5% of the node. This is
  2571		 * arbitrary cutoff based two factors -- SMT and
  2572		 * memory channels. For SMT-2, the intent is to
  2573		 * avoid premature sharing of HT resources but
  2574		 * SMT-4 or SMT-8 *may* benefit from a different
  2575		 * cutoff. For memory channels, this is a very
  2576		 * rough estimate of how many channels may be
  2577		 * active and is based on recent CPUs with
  2578		 * many cores.
  2579		 *
  2580		 * For multiple LLCs, allow an imbalance
  2581		 * until multiple tasks would share an LLC
  2582		 * on one node while LLCs on another node
  2583		 * remain idle. This assumes that there are
  2584		 * enough logical CPUs per LLC to avoid SMT
  2585		 * factors and that there is a correlation
  2586		 * between LLCs and memory channels.
  2587		 */
  2588		nr_llcs = sd_llc->parent->span_weight / sd_llc->span_weight;
  2589		if (nr_llcs == 1)
  2590			imb = sd_llc->parent->span_weight >> 3;
  2591		else
  2592			imb = nr_llcs;
  2593	
  2594		imb = max(1U, imb);
  2595		sd_llc->parent->imb_numa_nr = imb;
  2596	
  2597		/*
  2598		 * Set span based on the first NUMA domain.
  2599		 *
  2600		 * NUMA systems always add a NODE domain before
  2601		 * iterating the NUMA domains. Since this is before
  2602		 * degeneration, start from sd_llc's parent's
  2603		 * parent which is the lowest an SD_NUMA domain can
  2604		 * be relative to sd_llc.
  2605		 */
> 2606		parent = sd_llc->parent->parent;
  2607		while (parent && !(parent->flags & SD_NUMA))
> 2608			parent = parent->parent;
  2609	
  2610		imb_span = parent ? parent->span_weight : sd_llc->parent->span_weight;
  2611	
  2612		/* Update the upper remainder of the topology */
  2613		parent = sd_llc->parent;
  2614		while (parent) {
  2615			int factor = max(1U, (parent->span_weight / imb_span));
  2616	
  2617			parent->imb_numa_nr = imb * factor;
  2618			parent = parent->parent;
  2619		}
  2620	}
  2621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

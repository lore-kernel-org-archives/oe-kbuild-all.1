Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FB3BF688
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091695; cv=none; b=jdwsJidbhmnWhic7f7qyfvPpgzUekrv+7CaEM8lec5KbDG+vF+U9fySVh0in+sk3gPxXbFITrDn1DnDsOWoZcFfLuhyxqTOB/q24TRI7DKNGANDIrJUWpQ7fMyML2BoZiI9+fad36c1jHlypfeJUQXpSBYcPNb6VNjzuUhCoNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091695; c=relaxed/simple;
	bh=OvAvZzCyAWmrPrmvGdDegVIMB1Bw6Wm1IINEvpyT534=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NNkChiR9v6kBaugaYjl/vPkRjpSzszhw1LRzrQbuwM6P39cvbsOaR/ORv0sDEyoO8oau9OxvFboz9Jsh3ZIHh5hh8+lJZeQJZqNSLPR38dHPyk4rSMmsJj4r1Hr2qoYD6mnhRJPj6PlRmmgKK0L3v0JG/y3N4XgIuonPWm67ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Va18HO5Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Va18HO5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776091692; x=1807627692;
  h=date:from:to:cc:subject:message-id;
  bh=OvAvZzCyAWmrPrmvGdDegVIMB1Bw6Wm1IINEvpyT534=;
  b=Va18HO5YhRRCM9KIGd6RO+h1dFuNh+xriSB1IljVWXKzyryAPtCfJXBa
   pX/CZyfrHbNFdL0vgtQi0MM0JAzuE2UTMC70sYI7C/xA+Aysc1/bNAzbR
   5omFWVSKKF25irjdVPffkW9rL0QNr1sIrdUOhLtPC6UAmQTYXm9xQf47A
   X8rb1muEspqRWFphL18nngFuocvcjp1qDBTiktuc7C48udJP5mkPzanrW
   EyFExMTCwmEtCIM7/8NeYpJrfelykqZi8HmxltNGWQv6rPIBNHKNQnp3i
   02apCfxX6FkGFgxbDz8Bw0SGzEeMb9fJADcuq5st0oRj4t6cxAeIg8rMx
   g==;
X-CSE-ConnectionGUID: U0GeYzvEQWyschPt+D1ZTA==
X-CSE-MsgGUID: s7MSMaJbS8+86OPbCiUOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87731519"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="87731519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 07:48:12 -0700
X-CSE-ConnectionGUID: wPmIVBFNQsagjPvclFRnBQ==
X-CSE-MsgGUID: A5WHy2WNTFagqMq2NChe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="260244584"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Apr 2026 07:48:09 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCIa6-000000000ax-0z1i;
	Mon, 13 Apr 2026 14:48:06 +0000
Date: Mon, 13 Apr 2026 22:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: [tip:sched/core 2/14] kernel/sched/topology.c:2604:16:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202604132237.KvYYVxjN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Prateek,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   78cde54ea5f03398f1cf6656de2472068f6da966
commit: 5a7b576b3ec1acc2694c5b58f80cd1d44a11b2c1 [2/14] sched/topology: Extract "imb_numa_nr" calculation into a separate helper
config: um-randconfig-r132-20260413 (https://download.01.org/0day-ci/archive/20260413/202604132237.KvYYVxjN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132237.KvYYVxjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132237.KvYYVxjN-lkp@intel.com/

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
   kernel/sched/topology.c:1692:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1692:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1692:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2476:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2476:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2476:31: sparse:     got struct sched_domain *sd
>> kernel/sched/topology.c:2604:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2604:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2604:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
>> kernel/sched/topology.c:2606:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2606:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2606:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2611:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2611:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2611:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2616:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2616:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2616:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2665:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2665:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2665:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2684:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2684:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2684:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2699:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2699:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2699:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2367:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2367:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2367:25: sparse:    struct task_struct *

vim +2604 kernel/sched/topology.c

  2551	
  2552	/*
  2553	 * Calculate an allowed NUMA imbalance such that LLCs do not get
  2554	 * imbalanced.
  2555	 */
  2556	static void adjust_numa_imbalance(struct sched_domain *sd_llc)
  2557	{
  2558		struct sched_domain *parent;
  2559		unsigned int imb_span = 1;
  2560		unsigned int imb = 0;
  2561		unsigned int nr_llcs;
  2562	
  2563		WARN_ON(!(sd_llc->flags & SD_SHARE_LLC));
  2564		WARN_ON(!sd_llc->parent);
  2565	
  2566		/*
  2567		 * For a single LLC per node, allow an
  2568		 * imbalance up to 12.5% of the node. This is
  2569		 * arbitrary cutoff based two factors -- SMT and
  2570		 * memory channels. For SMT-2, the intent is to
  2571		 * avoid premature sharing of HT resources but
  2572		 * SMT-4 or SMT-8 *may* benefit from a different
  2573		 * cutoff. For memory channels, this is a very
  2574		 * rough estimate of how many channels may be
  2575		 * active and is based on recent CPUs with
  2576		 * many cores.
  2577		 *
  2578		 * For multiple LLCs, allow an imbalance
  2579		 * until multiple tasks would share an LLC
  2580		 * on one node while LLCs on another node
  2581		 * remain idle. This assumes that there are
  2582		 * enough logical CPUs per LLC to avoid SMT
  2583		 * factors and that there is a correlation
  2584		 * between LLCs and memory channels.
  2585		 */
  2586		nr_llcs = sd_llc->parent->span_weight / sd_llc->span_weight;
  2587		if (nr_llcs == 1)
  2588			imb = sd_llc->parent->span_weight >> 3;
  2589		else
  2590			imb = nr_llcs;
  2591	
  2592		imb = max(1U, imb);
  2593		sd_llc->parent->imb_numa_nr = imb;
  2594	
  2595		/*
  2596		 * Set span based on the first NUMA domain.
  2597		 *
  2598		 * NUMA systems always add a NODE domain before
  2599		 * iterating the NUMA domains. Since this is before
  2600		 * degeneration, start from sd_llc's parent's
  2601		 * parent which is the lowest an SD_NUMA domain can
  2602		 * be relative to sd_llc.
  2603		 */
> 2604		parent = sd_llc->parent->parent;
  2605		while (parent && !(parent->flags & SD_NUMA))
> 2606			parent = parent->parent;
  2607	
  2608		imb_span = parent ? parent->span_weight : sd_llc->parent->span_weight;
  2609	
  2610		/* Update the upper remainder of the topology */
  2611		parent = sd_llc->parent;
  2612		while (parent) {
  2613			int factor = max(1U, (parent->span_weight / imb_span));
  2614	
  2615			parent->imb_numa_nr = imb * factor;
  2616			parent = parent->parent;
  2617		}
  2618	}
  2619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

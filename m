Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C023DC4DE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956395; cv=none; b=pZqsWpgEMYKUBjR6MfyWzovzCRONl952tDIjAvZcy1zikGRLlKYTzRZUVuftfpaH3p2alIleosoRD5a4t9ePnr2NmMwq7liACQ1cOtWFBsLkQVwlD4qKVsYz69slxQYdLds84Wscp42MMToMGug953KpLeYfdulCc+uqmKZEY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956395; c=relaxed/simple;
	bh=LN0Eko+t3U2+DLosQLawVpODT5Yff93+AORnz5lVuYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0++E4BUCs+3brNCrCR9kK8y81ogCQ2iTcUge9T/V4PyByGbLVKJu4eOhdAhWuIKs7EUHruFKMz3WGyqAby5z8UL7/nO9jlKHMoNwHLJmjw79qOntWwvP5aMBVqSFqRLTIB9int4i1J896MDF5eu8ctkWtRppNBmA4hCdT7og9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKAVcIr2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKAVcIr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790956392; x=1822492392;
  h=date:from:to:cc:subject:message-id;
  bh=LN0Eko+t3U2+DLosQLawVpODT5Yff93+AORnz5lVuYE=;
  b=GKAVcIr2s10KhxDpg2XFrif3klhh+tBDhgNwX3upQFDNwExzz3pMBwRz
   xlfB4CtSwIzRB2uxUW00NuW4cr6m8YokOv2mcIaAcvoM3ZRpbIxJtInOj
   zuDTSQyB+1N3lvpRBPuR6yTdMV/5q0cJWrgnsfm5x2jaF4mCcBTrDlEla
   +47xvR05jhyLGFwmWnwfPxKlLYmh8qk2oRK4nvPz1SuR1KWKZMb1yj24n
   9yVZzuqd4y9Pjl1sVVsENNsP7GytztZD4VtERLSrfm77GWYGtrSPEq7PJ
   f7HCFgbJLfAg7c3KVO6gDAPQwPgtd5PlnYDsxi9+J07P08BDUA3gq9+Bf
   g==;
X-CSE-ConnectionGUID: btdzj55GRhax0QvW7yNFng==
X-CSE-MsgGUID: ELHPVMukRL+6dOFiU88zxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91745263"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91745263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:53:10 -0700
X-CSE-ConnectionGUID: igCPw7CVSPez5BVobImTtg==
X-CSE-MsgGUID: O+zGA4pST3qUv9AYVEdw0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274930172"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2026 08:53:08 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCfZK-000000000eY-3Afg;
	Fri, 02 Oct 2026 15:53:06 +0000
Date: Fri, 02 Oct 2026 17:52:10 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 47/49] kernel/sched/psi.c:1743:17:
 sparse: sparse: symbol 'bpf_psi_total' was not declared. Should it be static?
Message-ID: <202610021733.EeeBI3cf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: 280ac9dc2846a4a9c68adefea007239b3642d07f [47/49] bpf: Add bpf_psi_total() to read a cgroup's stall time
config: um-randconfig-r2307-20261001 (https://download.01.org/0day-ci/archive/20261002/202610021733.EeeBI3cf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021733.EeeBI3cf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021733.EeeBI3cf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/topology.c:118:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:118:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:118:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:137:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:137:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:137:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:160:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:160:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:160:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:470:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:470:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:470:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:654:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:654:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:654:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:753:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:753:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:753:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:775:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:775:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:775:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:788:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:788:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:788:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:793:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:793:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:793:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:826:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:826:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:826:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:1069:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1069:38: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1069:38: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1076:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1076:21: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1076:21: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1223:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1223:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1223:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1252:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1252:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1252:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1298:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1298:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1298:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1300:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1300:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1300:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1308:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1308:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1308:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1310:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1310:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1310:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1380:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1380:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1380:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1484:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1484:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1484:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1620:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1620:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1620:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1877:52: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1877:52: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1877:52: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1987:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1987:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1987:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2791:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2791:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2791:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2919:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2919:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2919:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
   kernel/sched/topology.c:2921:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2921:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2921:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2926:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2926:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2926:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2931:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2931:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2931:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3008:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd_asym @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3008:25: sparse:     expected struct sched_domain *[assigned] sd_asym
   kernel/sched/topology.c:3008:25: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3143:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3143:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3143:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3165:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3165:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3165:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3191:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3191:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3191:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3444:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3444:44: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3444:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/psi.c:1743:17: sparse: sparse: symbol 'bpf_psi_total' was not declared. Should it be static?
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/autogroup.c:10:28: sparse: sparse: symbol 'sysctl_sched_autogroup_enabled' was not declared. Should it be static?
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2489:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:25: sparse:    struct task_struct *

vim +/bpf_psi_total +1743 kernel/sched/psi.c

  1729	
  1730	/**
  1731	 * bpf_psi_total - Read a cgroup's cumulative pressure stall time
  1732	 * @cgrp: the cgroup; the root cgroup reads the system-wide group
  1733	 * @state: the state to read, for example PSI_MEM_SOME or PSI_MEM_FULL
  1734	 *
  1735	 * Collects the per-CPU stall times first, so the result is as fresh as a
  1736	 * read of the cgroup's pressure files, whose total= field it matches. The
  1737	 * periodic aggregator alone updates the group total only every two seconds,
  1738	 * which is too coarse for a control loop that ticks faster than that.
  1739	 *
  1740	 * Return: the stall time in nanoseconds, or U64_MAX if PSI is disabled, the
  1741	 * cgroup has no PSI group, or @state is not a per-group state.
  1742	 */
> 1743	__bpf_kfunc u64 bpf_psi_total(struct cgroup *cgrp, enum psi_states state)
  1744	{
  1745		struct psi_group *group;
  1746		u64 total;
  1747	
  1748		if (static_branch_likely(&psi_disabled))
  1749			return U64_MAX;
  1750		if ((unsigned int)state >= PSI_NONIDLE)
  1751			return U64_MAX;
  1752	
  1753		group = cgroup_psi(cgrp);
  1754		if (!group)
  1755			return U64_MAX;
  1756	
  1757		mutex_lock(&group->avgs_lock);
  1758		collect_percpu_times(group, PSI_AVGS, NULL);
  1759		total = group->total[PSI_AVGS][state];
  1760		mutex_unlock(&group->avgs_lock);
  1761	
  1762		return total;
  1763	}
  1764	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

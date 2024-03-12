Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CFE14372E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710279624; cv=none; b=mm7ec65iY9MGaKOGKtBPhiwNrSdIROtNNxPBgmCm+a8o4QOt/QwkCT8XtV6Oom66tPKmP9ox9p4T0xMfVLH0ifK7D+Sa/RNiD4fpDRuiYpM7tgBK5FOl4KNvxQAIVqUONIIDhovXHWxfrX972cCBhnXMzBabOkHE4AfWboWREMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710279624; c=relaxed/simple;
	bh=IWw53xTnLymI3uJj6rfHZMzmxRLDiBwe8zOKtI1RaTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSUfXKSnFcnc5wzfBeBourYTn3MxwhIld4yx53bxfSZ6YXINq2Aail4tfG6cwRGxrVFPgPmgqcmLNRRR6i8mXLzho9Y9rOGSmKitSI8mjoy0D7d2sF6eN3h88zlgwGOrTUECBWC7BXG9OSgU9V3MBsIQ2b/cI7ux2ctL2AIcU2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+Ociijk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+Ociijk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710279623; x=1741815623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWw53xTnLymI3uJj6rfHZMzmxRLDiBwe8zOKtI1RaTI=;
  b=L+Ociijk6liPPAFPFkxegV7oXqFtNC/hZpWVOE8FuIqpIrrS2a8PfjTz
   0vfwMGX/ozP3RS7R4p7+lZ0UqO2oM+WdBv9PmO2sXP/LED5DIGigzE2Cr
   o8Qy/s8zhzcI7AVRQ18vJPcUInPl5WM/mVADOlMDeegDNe8i0eJzpCIKe
   KAvHRo55v2r9pY9uLqtC6H/q7Glj55ZCxy1Ca4NHcbE6q9L64WM16LRVe
   6HHVYPjj/xL0qJPiNTmQBwTsycNcB/bhACpFn98JJetrOCdVQVle2FrIp
   ZKG0j+Ur4aHr62OeE1EE4EIAcVOxkWlO8Jsl8pI8qPp1Oy8FVaBORjmr7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15743451"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="15743451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 14:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42616813"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2024 14:40:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk9r8-000BhL-2H;
	Tue, 12 Mar 2024 21:40:18 +0000
Date: Wed, 13 Mar 2024 05:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20704/21850]
 kernel/sched/grid/qos.c:84:31: error: 'struct mempolicy' has no member named
 'v'
Message-ID: <202403130506.ha6K0yEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c38cc0a3be12e5c70b9a2a015cbee44014a52518
commit: ce35ded5d5774f055f6850b15032066ff4936414 [20704/21850] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: x86_64-randconfig-161-20240313 (https://download.01.org/0day-ci/archive/20240313/202403130506.ha6K0yEi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130506.ha6K0yEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130506.ha6K0yEi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/grid/qos.c:19:
   kernel/sched/grid/qos.c: In function 'sched_grid_preferred_interleave_nid':
>> kernel/sched/grid/qos.c:84:31: error: 'struct mempolicy' has no member named 'v'
      84 |         if (nodes_equal(policy->v.nodes, *preferred_nmask))
         |                               ^~
   include/linux/nodemask.h:202:41: note: in definition of macro 'nodes_equal'
     202 |                         __nodes_equal(&(src1), &(src2), MAX_NUMNODES)
         |                                         ^~~~
   kernel/sched/grid/qos.c:91:32: error: 'struct mempolicy' has no member named 'v'
      91 |         nodes_and(nmask, policy->v.nodes, *preferred_nmask);
         |                                ^~
   include/linux/nodemask.h:162:47: note: in definition of macro 'nodes_and'
     162 |                         __nodes_and(&(dst), &(src1), &(src2), MAX_NUMNODES)
         |                                               ^~~~
>> kernel/sched/grid/qos.c:95:31: error: 'struct task_struct' has no member named 'il_prev'
      95 |         next = next_node_in(me->il_prev, nmask);
         |                               ^~
   include/linux/nodemask.h:278:46: note: in definition of macro 'next_node_in'
     278 | #define next_node_in(n, src) __next_node_in((n), &(src))
         |                                              ^
   kernel/sched/grid/qos.c:97:19: error: 'struct task_struct' has no member named 'il_prev'
      97 |                 me->il_prev = next;
         |                   ^~
   In file included from kernel/sched/grid/qos.c:20:
   include/linux/mempolicy.h: At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~


vim +84 kernel/sched/grid/qos.c

    68	
    69	/* dynamic select a more appropriate preferred interleave nid for process */
    70	int sched_grid_preferred_interleave_nid(struct mempolicy *policy)
    71	{
    72		nodemask_t nmask;
    73		unsigned int next;
    74		struct task_struct *me = current;
    75		nodemask_t *preferred_nmask = NULL;
    76	
    77		if (likely(me->grid_qos))
    78			preferred_nmask =
    79				&me->grid_qos->affinity.mem_preferred_node_mask;
    80	
    81		if (!preferred_nmask || !policy)
    82			return NUMA_NO_NODE;
    83	
  > 84		if (nodes_equal(policy->v.nodes, *preferred_nmask))
    85			return NUMA_NO_NODE;
    86		/*
    87		 * We perceive the actual consumption of memory bandwidth
    88		 * in each node and post a preferred interleave nid in
    89		 * more appropriate range.
    90		 */
    91		nodes_and(nmask, policy->v.nodes, *preferred_nmask);
    92		if (nodes_empty(nmask))
    93			return NUMA_NO_NODE;
    94	
  > 95		next = next_node_in(me->il_prev, nmask);
    96		if (next < MAX_NUMNODES)
    97			me->il_prev = next;
    98		return next;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

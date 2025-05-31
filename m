Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB36A645
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748712635; cv=none; b=MKzVH7byqxNBu4N6qaNCtwrq7KYvTMuW0RjhvTwaakEKqM65nmneS2A+qUyqgPggU/aIYMeEqK6yp+T3fbF/V7zawkcGhewyWohIkSwwAiI5qRoAB9vdkPEV0Rx0pMwaP2yUr/oFufc1a1sqYHBlJIm1ehzF8lkM/5cY5QueEY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748712635; c=relaxed/simple;
	bh=oRpIoBb7BcXwBpb3jk7+2m/MwsMoUakWhDWO239mOZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKuG/E24aUB7FiCDKzSDV5FnPR5o29HEO1ZYl7TTcDh+2kF/WICYw90Ow1ifljQPssjO2sbvr7z2hLW2Beq/PY0tN9tWV6fJeeWAeGYaEHD58AzzD7vp6nBrliEwy2BBnN4mSg+mgLFWxMBxm+IQnutvZkn08Wwu+J9+CugYrmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmcItsBy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmcItsBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748712632; x=1780248632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRpIoBb7BcXwBpb3jk7+2m/MwsMoUakWhDWO239mOZk=;
  b=LmcItsBywNSyJ4SdVymNP6tAN6YrDstuq+xsVAneSPhqQ34xvS5ikPK/
   3I0Be+IPhJ3eXMJyQQ6bmQDmS4JTwxrgRtrfG2G23L0g/mEXDIhs+F4Ex
   D82h1j4xzQq5OkM29FIkEFZ9z6+rEGRWpMmquJpIlhI472BeztGvjeroS
   JahBNF0XaMYYvhMrQkg7du3mCqw5Vsjf8V87C3seWCpAyTUB/rwVue/wm
   8LgfnOXerIyhDl/LlE1J7/Y2zlfl/K2ypG878JCXtnD3743q5HZDfUTSr
   Uh62lnqwYAh9bNq8iLqmJFalu2B9Su2tDwuNCm2W37H86I68PJrzfIqCp
   g==;
X-CSE-ConnectionGUID: mZqYoDqrQLC1UwAcU7qOZg==
X-CSE-MsgGUID: Hyggh+FGRPW7PzUMCIyZcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62181056"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="62181056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 10:30:32 -0700
X-CSE-ConnectionGUID: Qgr+Y97cRYu2do8M4/Zdpg==
X-CSE-MsgGUID: 6EiwhPobRSK23JZMp5PJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="175037228"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2025 10:30:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLQ2O-000YXs-2O;
	Sat, 31 May 2025 17:30:28 +0000
Date: Sun, 1 Jun 2025 01:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1654/1654]
 kernel/sched/grid/qos.c:84:26: error: no member named 'v' in 'struct
 mempolicy'
Message-ID: <202506010120.CPcodFlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8eff3fb546d3baa728542fd40cdbad086cd9227c
commit: ce35ded5d5774f055f6850b15032066ff4936414 [1654/1654] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: x86_64-randconfig-122-20250531 (https://download.01.org/0day-ci/archive/20250601/202506010120.CPcodFlN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010120.CPcodFlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010120.CPcodFlN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/grid/qos.c: note: in included file (through include/linux/kernel.h, include/linux/nodemask.h):
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   kernel/sched/grid/qos.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/nodemask.h):
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   kernel/sched/grid/qos.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/nodemask.h):
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-58df0ef89d/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   kernel/sched/grid/qos.c:84:13: sparse: sparse: using member 'v' in incomplete struct mempolicy
   kernel/sched/grid/qos.c:91:9: sparse: sparse: using member 'v' in incomplete struct mempolicy
   kernel/sched/grid/qos.c:95:16: sparse: sparse: no member 'il_prev' in struct task_struct
   kernel/sched/grid/qos.c:97:19: sparse: sparse: no member 'il_prev' in struct task_struct
>> kernel/sched/grid/qos.c:84:26: error: no member named 'v' in 'struct mempolicy'
      84 |         if (nodes_equal(policy->v.nodes, *preferred_nmask))
         |                         ~~~~~~  ^
   include/linux/nodemask.h:202:20: note: expanded from macro 'nodes_equal'
     202 |                         __nodes_equal(&(src1), &(src2), MAX_NUMNODES)
         |                                         ^~~~
   kernel/sched/grid/qos.c:91:27: error: no member named 'v' in 'struct mempolicy'
      91 |         nodes_and(nmask, policy->v.nodes, *preferred_nmask);
         |                          ~~~~~~  ^
   include/linux/nodemask.h:162:26: note: expanded from macro 'nodes_and'
     162 |                         __nodes_and(&(dst), &(src1), &(src2), MAX_NUMNODES)
         |                                               ^~~~
>> kernel/sched/grid/qos.c:95:26: error: no member named 'il_prev' in 'struct task_struct'
      95 |         next = next_node_in(me->il_prev, nmask);
         |                             ~~  ^
   include/linux/nodemask.h:278:46: note: expanded from macro 'next_node_in'
     278 | #define next_node_in(n, src) __next_node_in((n), &(src))
         |                                              ^
   kernel/sched/grid/qos.c:97:7: error: no member named 'il_prev' in 'struct task_struct'
      97 |                 me->il_prev = next;
         |                 ~~  ^
   4 errors generated.
--
>> kernel/sched/grid/qos.c:84:26: error: no member named 'v' in 'struct mempolicy'
      84 |         if (nodes_equal(policy->v.nodes, *preferred_nmask))
         |                         ~~~~~~  ^
   include/linux/nodemask.h:202:20: note: expanded from macro 'nodes_equal'
     202 |                         __nodes_equal(&(src1), &(src2), MAX_NUMNODES)
         |                                         ^~~~
   kernel/sched/grid/qos.c:91:27: error: no member named 'v' in 'struct mempolicy'
      91 |         nodes_and(nmask, policy->v.nodes, *preferred_nmask);
         |                          ~~~~~~  ^
   include/linux/nodemask.h:162:26: note: expanded from macro 'nodes_and'
     162 |                         __nodes_and(&(dst), &(src1), &(src2), MAX_NUMNODES)
         |                                               ^~~~
>> kernel/sched/grid/qos.c:95:26: error: no member named 'il_prev' in 'struct task_struct'
      95 |         next = next_node_in(me->il_prev, nmask);
         |                             ~~  ^
   include/linux/nodemask.h:278:46: note: expanded from macro 'next_node_in'
     278 | #define next_node_in(n, src) __next_node_in((n), &(src))
         |                                              ^
   kernel/sched/grid/qos.c:97:7: error: no member named 'il_prev' in 'struct task_struct'
      97 |                 me->il_prev = next;
         |                 ~~  ^
   4 errors generated.


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
  > 91		nodes_and(nmask, policy->v.nodes, *preferred_nmask);
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

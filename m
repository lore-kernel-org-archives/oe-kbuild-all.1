Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE314008
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710492967; cv=none; b=jgHQYqs3JSxVeZ5mzJr+7fVReFP299WrB04oD6C7aZgRM1EeGkU8bYumKl+pTDNSl5/9aUB356n5J+VeNI/9OaH+aHpYywrJHP7YtrooFLVS8wtaXFoQN28u2zKYWQI37XuTrxlykw1Mc1HfyZ4Zahe4iX0QWjgpxvIB1qoCyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710492967; c=relaxed/simple;
	bh=sV3mfKpGR6pvO/SfBjnd/cuNjG1t6Bs85yXIhpB8c30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQ3TgQLfCF16jsZH2sf2SJwPReHhBD+DVsmBBEQHw00DzWv2r5O8+VxFPIs+DgWrieL4m9KgS7JsARNVQxR9eG8xHdd5WF+yi5vTZUpfV/EBNXnT06nhGovKVxwuGsWCB3zOO9u1C8g3Rf9p619vXVVrZskFZA4sRdfBE4Spir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVhnxSKN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVhnxSKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710492965; x=1742028965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sV3mfKpGR6pvO/SfBjnd/cuNjG1t6Bs85yXIhpB8c30=;
  b=fVhnxSKN46PgrEce0aXhwF/+mrOH6Rga8HQ4f0kNEaTYtDWjj2UC8bu7
   3RaLw59uLrMqmbGDlZWfCTj+z53/1D+NIuXwWjJWOV0Qpoa/quHyLkltF
   dkHEjEC2oIZ/DJnbTSzfNxm+iYBBVnkcpFoQRUK9PJd83wf34FaaVbwfS
   Kkp7A+T2Z5K3XKpkISrqO4zfFuA4+8gLPF5dox0oVBP+JKs3ucO5Nn8d8
   llQuhRiXzxUH3jEnncS+VaelfubDK64QqadAUfi0P65clzmgw8d7NX/gO
   56Bwkth3A3NDWNWaZLEg+mawpKy5hEGF8RQelyzx5+x0uiE9NeAXlcSa4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5213577"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5213577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="43621576"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 01:56:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl3M8-000EHF-1O;
	Fri, 15 Mar 2024 08:56:00 +0000
Date: Fri, 15 Mar 2024 16:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20704/21867]
 kernel/sched/grid/qos.c:84:26: error: no member named 'v' in 'struct
 mempolicy'
Message-ID: <202403151634.PfWUhfUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   200e028b39abd7f9d901a50673f9a5f54d3eeb1e
commit: ce35ded5d5774f055f6850b15032066ff4936414 [20704/21867] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: x86_64-randconfig-r111-20240313 (https://download.01.org/0day-ci/archive/20240315/202403151634.PfWUhfUu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151634.PfWUhfUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151634.PfWUhfUu-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/grid/qos.c:84:13: sparse: sparse: using member 'v' in incomplete struct mempolicy
   kernel/sched/grid/qos.c:91:9: sparse: sparse: using member 'v' in incomplete struct mempolicy
   kernel/sched/grid/qos.c:95:16: sparse: sparse: no member 'il_prev' in struct task_struct
   kernel/sched/grid/qos.c:97:19: sparse: sparse: no member 'il_prev' in struct task_struct
   In file included from kernel/sched/grid/qos.c:20:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning and 4 errors generated.
--
   In file included from kernel/sched/grid/qos.c:20:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning and 4 errors generated.


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

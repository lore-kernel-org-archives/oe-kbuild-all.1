Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E02550D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 04:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933322; cv=none; b=uXduNLL68F4vfqEDq9syWiXaTwssygFhFZZtD0rtX3ceS9rVlX2lLT7w6VeHQO0kmn6nIXVZubMRs+GJRSAZG7ENYygbSGVSK/MIlMsWFwMT3S4Ay/NjgYwtd9uURQ6JsjGLHL8ANCzlefJ4RetjIbtG37SWK3COhpRZPqRLarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933322; c=relaxed/simple;
	bh=AQVrbWesm+Xpz75jwdMSqr5lIi4++FrnOyDZfe1IlBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OMtwZ0V6AiVVkAdnQYmXhbiOKNAzHFvn/5tIj/d0u53ChL13lTgkyVMiNr6hZZxGqNwfhN4c1Ye2YDJDOu0lU4ZSCIf8osJxyrTJOzaPhepalL7jwgK4JDHLjC2gDF4z/gqnxm/FvTm69toEYIcuruUI8ZKvaVIRpEEuMTj+380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP0Cc8qF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP0Cc8qF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767933321; x=1799469321;
  h=date:from:to:cc:subject:message-id;
  bh=AQVrbWesm+Xpz75jwdMSqr5lIi4++FrnOyDZfe1IlBA=;
  b=IP0Cc8qF5z4P1CS/DmP2csFSWta/rmnWi7eSOFuPZmZKIDKkiR9h9yn+
   2kA003ODVZ3TrTUHlf3LH87ZQavP7b6d1S6qwO4wN5v2u2PLqnYQJSywR
   5b+XXvPTPjISVgBKzgZNzjo6EZciFWv44iuELJbH9Zkb9ML62qODZ6BcV
   heVK7TnKrV8iCxQ5b1fQgKyGdYcMhYX7wSKhGfRzdJ/20l81ttKC6BcWW
   t2Lkqh2aVm6h3FPaogxRhqSWJSKyAune0ac93htuXwTlkiq7iRzSSD/C6
   T/ZlcisFOk41nqY72Yuwt3Tp8rVnEYQSVV6a/Q0SBhL5kXwBPofqNAnmV
   Q==;
X-CSE-ConnectionGUID: UIWXs+GqQTSEURzr5IE2HQ==
X-CSE-MsgGUID: wKxQowCJRGaNYq5I7kvxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80424599"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="80424599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 20:35:20 -0800
X-CSE-ConnectionGUID: Zdx5cAszSJO1rz+sIucS8Q==
X-CSE-MsgGUID: IPnlsukmQcig7z3lfGrpMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="234088854"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Jan 2026 20:35:18 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve4DU-000000001ye-16JP;
	Fri, 09 Jan 2026 04:35:16 +0000
Date: Fri, 09 Jan 2026 05:34:28 +0100
From: kernel test robot <lkp@intel.com>
To: Bing Jiao <bingjiao@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 259/263] mm/vmscan.c:1046:6: warning:
 variable 'target_nid' is uninitialized when used here
Message-ID: <202601090508.cVHh3bJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   ba756a5e4580859e0b26f6679d882f81935a7b14
commit: d92027a5f30a6c5c582169114b1e56d6536ca8f8 [259/263] mm/vmscan: select the closest preferred node in demote_folio_list()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260109/202601090508.cVHh3bJo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090508.cVHh3bJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090508.cVHh3bJo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:1046:6: warning: variable 'target_nid' is uninitialized when used here [-Wuninitialized]
    1046 |         if (target_nid == NUMA_NO_NODE)
         |             ^~~~~~~~~~
   mm/vmscan.c:1026:16: note: initialize the variable 'target_nid' to silence this warning
    1026 |         int target_nid;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/target_nid +1046 mm/vmscan.c

26aa2d199d6f2c Dave Hansen             2021-09-02  1017  
26aa2d199d6f2c Dave Hansen             2021-09-02  1018  /*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1019)  * Take folios on @demote_folios and attempt to demote them to another node.
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1020)  * Folios which are not demoted are left on @demote_folios.
26aa2d199d6f2c Dave Hansen             2021-09-02  1021   */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1022) static unsigned int demote_folio_list(struct list_head *demote_folios,
059c4bb2dc3b93 Bing Jiao               2026-01-08  1023  				      struct pglist_data *pgdat,
059c4bb2dc3b93 Bing Jiao               2026-01-08  1024  				      struct mem_cgroup *memcg)
26aa2d199d6f2c Dave Hansen             2021-09-02  1025  {
d92027a5f30a6c Bing Jiao               2026-01-08  1026  	int target_nid;
26aa2d199d6f2c Dave Hansen             2021-09-02  1027  	unsigned int nr_succeeded;
32008027289239 Jagdish Gediya          2022-08-18  1028  	nodemask_t allowed_mask;
d92027a5f30a6c Bing Jiao               2026-01-08  1029  	nodemask_t preferred;
32008027289239 Jagdish Gediya          2022-08-18  1030  
32008027289239 Jagdish Gediya          2022-08-18  1031  	struct migration_target_control mtc = {
32008027289239 Jagdish Gediya          2022-08-18  1032  		/*
32008027289239 Jagdish Gediya          2022-08-18  1033  		 * Allocate from 'node', or fail quickly and quietly.
32008027289239 Jagdish Gediya          2022-08-18  1034  		 * When this happens, 'page' will likely just be discarded
32008027289239 Jagdish Gediya          2022-08-18  1035  		 * instead of migrated.
32008027289239 Jagdish Gediya          2022-08-18  1036  		 */
bd63d0fde2a2c3 Fushuai Wang            2025-10-06  1037  		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
32008027289239 Jagdish Gediya          2022-08-18  1038  			__GFP_NOMEMALLOC | GFP_NOWAIT,
e42dfe4e0a51b4 Baolin Wang             2024-03-06  1039  		.nmask = &allowed_mask,
e42dfe4e0a51b4 Baolin Wang             2024-03-06  1040  		.reason = MR_DEMOTION,
32008027289239 Jagdish Gediya          2022-08-18  1041  	};
26aa2d199d6f2c Dave Hansen             2021-09-02  1042  
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1043) 	if (list_empty(demote_folios))
26aa2d199d6f2c Dave Hansen             2021-09-02  1044  		return 0;
26aa2d199d6f2c Dave Hansen             2021-09-02  1045  
26aa2d199d6f2c Dave Hansen             2021-09-02 @1046  	if (target_nid == NUMA_NO_NODE)
059c4bb2dc3b93 Bing Jiao               2026-01-08  1047  		/* No lower-tier nodes or nodes were hot-unplugged. */
26aa2d199d6f2c Dave Hansen             2021-09-02  1048  		return 0;
26aa2d199d6f2c Dave Hansen             2021-09-02  1049  
32008027289239 Jagdish Gediya          2022-08-18  1050  	node_get_allowed_targets(pgdat, &allowed_mask);
059c4bb2dc3b93 Bing Jiao               2026-01-08  1051  	mem_cgroup_node_filter_allowed(memcg, &allowed_mask);
059c4bb2dc3b93 Bing Jiao               2026-01-08  1052  	if (nodes_empty(allowed_mask))
059c4bb2dc3b93 Bing Jiao               2026-01-08  1053  		return 0;
059c4bb2dc3b93 Bing Jiao               2026-01-08  1054  
d92027a5f30a6c Bing Jiao               2026-01-08  1055  	target_nid = next_demotion_node(pgdat->node_id, &preferred);
d92027a5f30a6c Bing Jiao               2026-01-08  1056  	while (target_nid != NUMA_NO_NODE &&
d92027a5f30a6c Bing Jiao               2026-01-08  1057  	       !node_isset(target_nid, allowed_mask)) {
d92027a5f30a6c Bing Jiao               2026-01-08  1058  		/* Filter out preferred nodes that are not in allowed. */
d92027a5f30a6c Bing Jiao               2026-01-08  1059  		nodes_and(preferred, preferred, allowed_mask);
d92027a5f30a6c Bing Jiao               2026-01-08  1060  		if (!nodes_empty(preferred)) {
d92027a5f30a6c Bing Jiao               2026-01-08  1061  			/* Randomly select one node from preferred. */
d92027a5f30a6c Bing Jiao               2026-01-08  1062  			target_nid = node_random(&preferred);
d92027a5f30a6c Bing Jiao               2026-01-08  1063  			break;
d92027a5f30a6c Bing Jiao               2026-01-08  1064  		}
d92027a5f30a6c Bing Jiao               2026-01-08  1065  		/*
d92027a5f30a6c Bing Jiao               2026-01-08  1066  		 * Preferred nodes in the lower tier are not set in allowed.
d92027a5f30a6c Bing Jiao               2026-01-08  1067  		 * Recursively get preferred from the next lower tier.
d92027a5f30a6c Bing Jiao               2026-01-08  1068  		 */
d92027a5f30a6c Bing Jiao               2026-01-08  1069  		target_nid = next_demotion_node(target_nid, &preferred);
d92027a5f30a6c Bing Jiao               2026-01-08  1070  	}
d92027a5f30a6c Bing Jiao               2026-01-08  1071  
d92027a5f30a6c Bing Jiao               2026-01-08  1072  	if (target_nid == NUMA_NO_NODE)
d92027a5f30a6c Bing Jiao               2026-01-08  1073  		/* Nodes are gone (e.g., hot-unplugged). */
d92027a5f30a6c Bing Jiao               2026-01-08  1074  		return 0;
059c4bb2dc3b93 Bing Jiao               2026-01-08  1075  	mtc.nid = target_nid;
32008027289239 Jagdish Gediya          2022-08-18  1076  
26aa2d199d6f2c Dave Hansen             2021-09-02  1077  	/* Demotion ignores all cpuset and mempolicy settings */
29ea04095b9697 SeongJae Park           2025-06-16  1078  	migrate_pages(demote_folios, alloc_demote_folio, NULL,
32008027289239 Jagdish Gediya          2022-08-18  1079  		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DEMOTION,
26aa2d199d6f2c Dave Hansen             2021-09-02  1080  		      &nr_succeeded);
26aa2d199d6f2c Dave Hansen             2021-09-02  1081  
26aa2d199d6f2c Dave Hansen             2021-09-02  1082  	return nr_succeeded;
26aa2d199d6f2c Dave Hansen             2021-09-02  1083  }
26aa2d199d6f2c Dave Hansen             2021-09-02  1084  

:::::: The code at line 1046 was first introduced by commit
:::::: 26aa2d199d6f2cfa6f2ef2a5dfe891f2250e71a0 mm/migrate: demote pages during reclaim

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

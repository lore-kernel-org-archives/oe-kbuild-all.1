Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E6F314D11
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762558964; cv=none; b=M/ph9/iddxzwP16qSS/WuTxag+Xf5y1pcsuve+DydRk2McaZUER3WWnmEkWHALujC0QGIgVbl+/jL+UtFQ6XlNtSYaN6cgZHdXgptPJxJoR0OWwU+NKx7U50WpL1qMwfQQLXiiwW9h30iZ+QYvu7RSuCHzv+M2CcOGptq1iSy6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762558964; c=relaxed/simple;
	bh=ghVwipsIthuTrH9wWbs6+MA9GuuuYxTdo9pO86EyuTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4AqxZFp0TNp88/HzQD2FcumQdumy0IVfSDIhweMeSqRYAFlSxISrvU1+bCX0ZqnIMeAHN0k31npydqtZz6AaU9XbduCMj1xhFQnxdxdvJr7h8URGd898eUt04NijhQYyTR/8KRb+3A4HZWEZ6vfthW/8UkcYAXxXNy6qYwkXPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9RwYcc3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9RwYcc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762558963; x=1794094963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghVwipsIthuTrH9wWbs6+MA9GuuuYxTdo9pO86EyuTU=;
  b=n9RwYcc3Uqm79nOo84TiJWgR92tl1cdk0XtxTsbV86gaRCmP2rI7HDpn
   QV4h5AT/2Pnn0wdET3gNmmRQWTEA6ffSQDYcXCM2Sau3N4Djwvw8xItfr
   7fQsY8JgzqpYRyGU/DE7nafqMxSwdOvKszaM0dzRqFdajswKLjzau9wnV
   Ryxiau4FGmaREDkwXf7kwu75CZ+Y9C2bGGngv/tQjYm1lSN1Sh0b08mfE
   wURz7kNDJ9giMN4ZwLyj+wCvmf/jsr9cg7CY4BItGKnIAkvup0CiXiSrD
   4uzO7rtZ/+Ck3B1qmvmFTakBDGenQGGZ8S/ELydO6kraEm36S9hy68cJW
   A==;
X-CSE-ConnectionGUID: nLxIqopYREqpCRnZSbKhqA==
X-CSE-MsgGUID: SDZIGW/pRr2ytNqeSJaDxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75405938"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="75405938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 15:42:42 -0800
X-CSE-ConnectionGUID: yE8tklikTqauiEcZ+7MvdA==
X-CSE-MsgGUID: IXig9DYET5C4Sys9p3qxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="192416334"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2025 15:42:42 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHW6J-0000Uh-01;
	Fri, 07 Nov 2025 23:42:39 +0000
Date: Sat, 8 Nov 2025 07:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 5/11]
 mm/oom_kill.c:1123:32: error: 'default_sysram_nodes' undeclared; did you
 mean 'default_dram_nodes'?
Message-ID: <202511080704.3xqhfwMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   67062e895b94cd27af5fa58d8a567086a53d0914
commit: b5fcc368ba4cbe6b7a89e1220e01dee600b9e4c5 [5/11] mm: default slub, oom_kill, compaction, and page_alloc to sysram
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251108/202511080704.3xqhfwMx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080704.3xqhfwMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080704.3xqhfwMx-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/oom_kill.c: In function 'out_of_memory':
>> mm/oom_kill.c:1123:32: error: 'default_sysram_nodes' undeclared (first use in this function); did you mean 'default_dram_nodes'?
    1123 |                 oc->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                default_dram_nodes
   mm/oom_kill.c:1123:32: note: each undeclared identifier is reported only once for each function it appears in
--
   mm/page_alloc.c: In function 'check_retry_cpuset':
>> mm/page_alloc.c:4614:32: error: 'default_sysram_nodes' undeclared (first use in this function); did you mean 'default_dram_nodes'?
    4614 |                 ac->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                default_dram_nodes
   mm/page_alloc.c:4614:32: note: each undeclared identifier is reported only once for each function it appears in
   mm/page_alloc.c: In function '__alloc_pages_slowpath':
   mm/page_alloc.c:4798:32: error: 'default_sysram_nodes' undeclared (first use in this function); did you mean 'default_dram_nodes'?
    4798 |                 ac->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                default_dram_nodes
   mm/page_alloc.c: In function 'prepare_alloc_pages':
   mm/page_alloc.c:4951:32: error: 'default_sysram_nodes' undeclared (first use in this function); did you mean 'default_dram_nodes'?
    4951 |                 ac->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                default_dram_nodes
   mm/page_alloc.c: In function '__alloc_frozen_pages_noprof':
   mm/page_alloc.c:5198:45: error: 'default_sysram_nodes' undeclared (first use in this function); did you mean 'default_dram_nodes'?
    5198 |         ac.nodemask = nodemask ? nodemask : default_sysram_nodes;
         |                                             ^~~~~~~~~~~~~~~~~~~~
         |                                             default_dram_nodes


vim +1123 mm/oom_kill.c

  1109	
  1110	/**
  1111	 * out_of_memory - kill the "best" process when we run out of memory
  1112	 * @oc: pointer to struct oom_control
  1113	 *
  1114	 * If we run out of memory, we have the choice between either
  1115	 * killing a random task (bad), letting the system crash (worse)
  1116	 * OR try to be smart about which process to kill. Note that we
  1117	 * don't have to be perfect here, we just have to be good.
  1118	 */
  1119	bool out_of_memory(struct oom_control *oc)
  1120	{
  1121		unsigned long freed = 0;
  1122		if (!oc->nodemask)
> 1123			oc->nodemask = default_sysram_nodes;
  1124	
  1125		if (oom_killer_disabled)
  1126			return false;
  1127	
  1128		if (!is_memcg_oom(oc)) {
  1129			blocking_notifier_call_chain(&oom_notify_list, 0, &freed);
  1130			if (freed > 0 && !is_sysrq_oom(oc))
  1131				/* Got some memory back in the last second. */
  1132				return true;
  1133		}
  1134	
  1135		/*
  1136		 * If current has a pending SIGKILL or is exiting, then automatically
  1137		 * select it.  The goal is to allow it to allocate so that it may
  1138		 * quickly exit and free its memory.
  1139		 */
  1140		if (task_will_free_mem(current)) {
  1141			mark_oom_victim(current);
  1142			queue_oom_reaper(current);
  1143			return true;
  1144		}
  1145	
  1146		/*
  1147		 * The OOM killer does not compensate for IO-less reclaim.
  1148		 * But mem_cgroup_oom() has to invoke the OOM killer even
  1149		 * if it is a GFP_NOFS allocation.
  1150		 */
  1151		if (!(oc->gfp_mask & __GFP_FS) && !is_memcg_oom(oc))
  1152			return true;
  1153	
  1154		/*
  1155		 * Check if there were limitations on the allocation (only relevant for
  1156		 * NUMA and memcg) that may require different handling.
  1157		 */
  1158		oc->constraint = constrained_alloc(oc);
  1159		if (oc->constraint != CONSTRAINT_MEMORY_POLICY)
  1160			oc->nodemask = default_sysram_nodes;
  1161		check_panic_on_oom(oc);
  1162	
  1163		if (!is_memcg_oom(oc) && sysctl_oom_kill_allocating_task &&
  1164		    current->mm && !oom_unkillable_task(current) &&
  1165		    oom_cpuset_eligible(current, oc) &&
  1166		    current->signal->oom_score_adj != OOM_SCORE_ADJ_MIN) {
  1167			get_task_struct(current);
  1168			oc->chosen = current;
  1169			oom_kill_process(oc, "Out of memory (oom_kill_allocating_task)");
  1170			return true;
  1171		}
  1172	
  1173		select_bad_process(oc);
  1174		/* Found nothing?!?! */
  1175		if (!oc->chosen) {
  1176			dump_header(oc);
  1177			pr_warn("Out of memory and no killable processes...\n");
  1178			/*
  1179			 * If we got here due to an actual allocation at the
  1180			 * system level, we cannot survive this and will enter
  1181			 * an endless loop in the allocator. Bail out now.
  1182			 */
  1183			if (!is_sysrq_oom(oc) && !is_memcg_oom(oc))
  1184				panic("System is deadlocked on memory\n");
  1185		}
  1186		if (oc->chosen && oc->chosen != (void *)-1UL)
  1187			oom_kill_process(oc, !is_memcg_oom(oc) ? "Out of memory" :
  1188					 "Memory cgroup out of memory");
  1189		return !!oc->chosen;
  1190	}
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

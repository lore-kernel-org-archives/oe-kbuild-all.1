Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CBC238C1F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101765; cv=none; b=Y0iM1tEEE0jXUPvnsbKa3kEt019Fu1B92ascI4s0jB3h+nu9fyP3ONtF6m2/wOJBu5bhgGTqE7hQ0Fox5YBf6Xz9XpZevOjjR7cTOO9K7hPcxn+ds/FI6q2bAr81pjtUVqJhH3Y4j1Ns2msx+NuqyM6SAz0sAnkRWdkxKZb3nSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101765; c=relaxed/simple;
	bh=TYyf3AYmdYB6LSkmLp7u5PGg4PU951wY+ZNPAQzYYXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TuxIZhcdiq3Fg4J+WjRvl7To47dpsJ6j2iLsISWIGtwRhJx4y430UEdRBYVKbw9WASuC2qGm2SK4Ka/wYLifZwenQl4vLGoAn+NSPrAKXBXPmG80spCs/44CmWBipDhO4S/a9WbQOsgAL5FNWG6bkVhR1J0rMV3qYd3i2rBk8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEaKrEbc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEaKrEbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767101763; x=1798637763;
  h=date:from:to:cc:subject:message-id;
  bh=TYyf3AYmdYB6LSkmLp7u5PGg4PU951wY+ZNPAQzYYXE=;
  b=SEaKrEbccMAMy8Ar/naVWuhUeNWkTJC4FRxFvg8Ld1w9R7Oipzj/oAJH
   b+c69HpPbKe4nYrWtdkRTwvePbndSIXns7JcobQGK/kqRjEidW7/K5Z5s
   jDVuojtGDh8CkfD4JTZ42Wa5orJsM0NMbJglBVN1B/nmXrhEtFw7Hqy4O
   PaAbI3hjvDfy5/GOS4IDOYbqGB0DWU/htkykStwJuUIBaf80N38DzagRJ
   FNtV7aLl6UolmSLLtG/Ec+5q4OL9/vDmtorRMEsiiMoTV7fFKEBJHKC3W
   oLTcRRmjqkNxDRpifVjfBMLM+SBfHrxddLVW9RAukptRxnCutehhfOWj4
   w==;
X-CSE-ConnectionGUID: GX74G8/8Rhmo8EcjcCwLfQ==
X-CSE-MsgGUID: RJ+zwhaGSq2MrfwjIjYIRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68664419"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="68664419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:36:00 -0800
X-CSE-ConnectionGUID: BcZMEB5XTPq8CyeMcVvnvA==
X-CSE-MsgGUID: /rGqJFzESZ22jXWOd30HeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="200429152"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2025 05:35:59 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaZtE-000000000P5-2eSH;
	Tue, 30 Dec 2025 13:35:56 +0000
Date: Tue, 30 Dec 2025 21:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 11/16] mm/oom_kill.c:1187: undefined
 reference to `bpf_handle_oom'
Message-ID: <202512302158.gKQw8q3p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   d16fa0113ece3fae58e5105dbed6b0dbe1c28c21
commit: 7752accd071a5cf12d71dff3c340ddf846b9d464 [11/16] mm: introduce BPF OOM struct ops
config: arm-randconfig-003-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302158.gKQw8q3p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302158.gKQw8q3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302158.gKQw8q3p-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/oom_kill.o: in function `out_of_memory':
>> mm/oom_kill.c:1187: undefined reference to `bpf_handle_oom'


vim +1187 mm/oom_kill.c

  1121	
  1122	/**
  1123	 * out_of_memory - kill the "best" process when we run out of memory
  1124	 * @oc: pointer to struct oom_control
  1125	 *
  1126	 * If we run out of memory, we have the choice between either
  1127	 * killing a random task (bad), letting the system crash (worse)
  1128	 * OR try to be smart about which process to kill. Note that we
  1129	 * don't have to be perfect here, we just have to be good.
  1130	 */
  1131	bool out_of_memory(struct oom_control *oc)
  1132	{
  1133		unsigned long freed = 0;
  1134	
  1135		if (oom_killer_disabled)
  1136			return false;
  1137	
  1138		if (!is_memcg_oom(oc)) {
  1139			blocking_notifier_call_chain(&oom_notify_list, 0, &freed);
  1140			if (freed > 0 && !is_sysrq_oom(oc))
  1141				/* Got some memory back in the last second. */
  1142				return true;
  1143		}
  1144	
  1145		/*
  1146		 * If current has a pending SIGKILL or is exiting, then automatically
  1147		 * select it.  The goal is to allow it to allocate so that it may
  1148		 * quickly exit and free its memory.
  1149		 */
  1150		if (task_will_free_mem(current)) {
  1151			mark_oom_victim(current);
  1152			queue_oom_reaper(current);
  1153			return true;
  1154		}
  1155	
  1156		/*
  1157		 * The OOM killer does not compensate for IO-less reclaim.
  1158		 * But mem_cgroup_oom() has to invoke the OOM killer even
  1159		 * if it is a GFP_NOFS allocation.
  1160		 */
  1161		if (!(oc->gfp_mask & __GFP_FS) && !is_memcg_oom(oc))
  1162			return true;
  1163	
  1164		/*
  1165		 * Check if there were limitations on the allocation (only relevant for
  1166		 * NUMA and memcg) that may require different handling.
  1167		 */
  1168		oc->constraint = constrained_alloc(oc);
  1169		if (oc->constraint != CONSTRAINT_MEMORY_POLICY)
  1170			oc->nodemask = NULL;
  1171		check_panic_on_oom(oc);
  1172	
  1173		if (!is_memcg_oom(oc) && sysctl_oom_kill_allocating_task &&
  1174		    current->mm && !oom_unkillable_task(current) &&
  1175		    oom_cpuset_eligible(current, oc) &&
  1176		    current->signal->oom_score_adj != OOM_SCORE_ADJ_MIN) {
  1177			get_task_struct(current);
  1178			oc->chosen = current;
  1179			oom_kill_process(oc, "Out of memory (oom_kill_allocating_task)");
  1180			return true;
  1181		}
  1182	
  1183		/*
  1184		 * Let bpf handle the OOM first. If it was able to free up some memory,
  1185		 * bail out. Otherwise fall back to the kernel OOM killer.
  1186		 */
> 1187		if (bpf_handle_oom(oc))
  1188			return true;
  1189	
  1190		select_bad_process(oc);
  1191		/* Found nothing?!?! */
  1192		if (!oc->chosen) {
  1193			dump_header(oc);
  1194			pr_warn("Out of memory and no killable processes...\n");
  1195			/*
  1196			 * If we got here due to an actual allocation at the
  1197			 * system level, we cannot survive this and will enter
  1198			 * an endless loop in the allocator. Bail out now.
  1199			 */
  1200			if (!is_sysrq_oom(oc) && !is_memcg_oom(oc))
  1201				panic("System is deadlocked on memory\n");
  1202		}
  1203		if (oc->chosen && oc->chosen != (void *)-1UL)
  1204			oom_kill_process(oc, !is_memcg_oom(oc) ? "Out of memory" :
  1205					 "Memory cgroup out of memory");
  1206		return !!oc->chosen;
  1207	}
  1208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

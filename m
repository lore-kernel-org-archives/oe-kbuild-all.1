Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42A368968
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379115; cv=none; b=STKJ+eyAZjfw5OEu8FzOTLJSyaLg/yo2V1/Vf3rg4nRXdwwrNbR7/dWxr8etnSJYJUiah1A1VNvTocwqRlYSBVYoZ7o07H1hPyhS77JNSN6ArQ+/p1C2kqx37AEa/gGuukBR2H+porctw5hKA/rcREb1sZrgbfY5D7SW5BuYBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379115; c=relaxed/simple;
	bh=OQeZNEE5yef0PDxtH/PHntXhBBSRhKzC18psRPx2PeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XjYfe8r8QKSx5gQJBFxodVsBYiiR484r1AKsmq0rdOhTXtZPaeLJwO1aMAjVtNgL3IBEIvWpQE0AnrJwVH4l8xbBIuUkxa47ROSkZaAHtzTGQaqJd93e9OjuxuDpD0b+wjD8mN+kmWZdEwyn5pQ7y6P63eMUT/VT2TSAiVk1tcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWprrp6B; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWprrp6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782379113; x=1813915113;
  h=date:from:to:cc:subject:message-id;
  bh=OQeZNEE5yef0PDxtH/PHntXhBBSRhKzC18psRPx2PeA=;
  b=gWprrp6BnLgXqQwPFRoE465lEKip7IE37KnhMARh75GE5WtzP7CSZMkF
   1LN3+0Z+VsKD2aVq6v6xApV2zivP4rstzbTcCy4OfrPdDK4ZXHvtfPARQ
   Rx8smWr3I6f/OQsM1Btwka3VlPLubeKn6kGL+6I1bnaFkfHiiSISOVkNu
   cTtj1aoy7JMGHwcYZUdSI65pPwkwOGrEuUDpZ8aM7Z2oSIfNvX4Es/OX8
   pZtnOgyhluUN/pDTU1lQZKiJSjSrP/iPN4qieZoC/wWLMMgVT+XD1g3KS
   fT5CCy/bPPp5Ahi9a06D7HR/kQrfjIerj/clpycxXXhk6RePL0HMjYXdo
   Q==;
X-CSE-ConnectionGUID: olCFVfeOTPyGm6aSGlW5Jg==
X-CSE-MsgGUID: N+qGPB5TQJSpHFha8CtdTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93804805"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="93804805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 02:18:32 -0700
X-CSE-ConnectionGUID: VE4tQdA0TaCnT3m7bSkAng==
X-CSE-MsgGUID: jDMSQQUgSyWHNry3I2z5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="250204282"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 02:18:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcgE8-0000000042b-1P9J;
	Thu, 25 Jun 2026 09:18:28 +0000
Date: Thu, 25 Jun 2026 17:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.4.rebased 18/29]
 mm/oom_kill.c:1171:undefined reference to `bpf_handle_oom'
Message-ID: <202606251737.QIycBOOu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.4.rebased
head:   702dfd9ab6849d59d3521f7c6542c1cf6aac217c
commit: f8f699c3c785a375e31b42825752cba88f18e1d8 [18/29] mm: introduce BPF OOM struct ops
config: i386-buildonly-randconfig-005-20260625 (https://download.01.org/0day-ci/archive/20260625/202606251737.QIycBOOu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251737.QIycBOOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251737.QIycBOOu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/oom_kill.o: in function `out_of_memory':
>> mm/oom_kill.c:1171:(.text+0x10c1): undefined reference to `bpf_handle_oom'


vim +1171 mm/oom_kill.c

  1105	
  1106	/**
  1107	 * out_of_memory - kill the "best" process when we run out of memory
  1108	 * @oc: pointer to struct oom_control
  1109	 *
  1110	 * If we run out of memory, we have the choice between either
  1111	 * killing a random task (bad), letting the system crash (worse)
  1112	 * OR try to be smart about which process to kill. Note that we
  1113	 * don't have to be perfect here, we just have to be good.
  1114	 */
  1115	bool out_of_memory(struct oom_control *oc)
  1116	{
  1117		unsigned long freed = 0;
  1118	
  1119		if (oom_killer_disabled)
  1120			return false;
  1121	
  1122		if (!is_memcg_oom(oc)) {
  1123			blocking_notifier_call_chain(&oom_notify_list, 0, &freed);
  1124			if (freed > 0 && !is_sysrq_oom(oc))
  1125				/* Got some memory back in the last second. */
  1126				return true;
  1127		}
  1128	
  1129		/*
  1130		 * If current has a pending SIGKILL or is exiting, then automatically
  1131		 * select it.  The goal is to allow it to allocate so that it may
  1132		 * quickly exit and free its memory.
  1133		 */
  1134		if (task_will_free_mem(current)) {
  1135			mark_oom_victim(current);
  1136			queue_oom_reaper(current);
  1137			return true;
  1138		}
  1139	
  1140		/*
  1141		 * The OOM killer does not compensate for IO-less reclaim.
  1142		 * But mem_cgroup_oom() has to invoke the OOM killer even
  1143		 * if it is a GFP_NOFS allocation.
  1144		 */
  1145		if (!(oc->gfp_mask & __GFP_FS) && !is_memcg_oom(oc))
  1146			return true;
  1147	
  1148		/*
  1149		 * Check if there were limitations on the allocation (only relevant for
  1150		 * NUMA and memcg) that may require different handling.
  1151		 */
  1152		oc->constraint = constrained_alloc(oc);
  1153		if (oc->constraint != CONSTRAINT_MEMORY_POLICY)
  1154			oc->nodemask = NULL;
  1155		check_panic_on_oom(oc);
  1156	
  1157		if (!is_memcg_oom(oc) && sysctl_oom_kill_allocating_task &&
  1158		    current->mm && !oom_unkillable_task(current) &&
  1159		    oom_cpuset_eligible(current, oc) &&
  1160		    current->signal->oom_score_adj != OOM_SCORE_ADJ_MIN) {
  1161			get_task_struct(current);
  1162			oc->chosen = current;
  1163			oom_kill_process(oc, "Out of memory (oom_kill_allocating_task)");
  1164			return true;
  1165		}
  1166	
  1167		/*
  1168		 * Let bpf handle the OOM first. If it was able to free up some memory,
  1169		 * bail out. Otherwise fall back to the kernel OOM killer.
  1170		 */
> 1171		if (bpf_handle_oom(oc))
  1172			return true;
  1173	
  1174		select_bad_process(oc);
  1175		/* Found nothing?!?! */
  1176		if (!oc->chosen) {
  1177			dump_header(oc);
  1178			pr_warn("Out of memory and no killable processes...\n");
  1179			/*
  1180			 * If we got here due to an actual allocation at the
  1181			 * system level, we cannot survive this and will enter
  1182			 * an endless loop in the allocator. Bail out now.
  1183			 */
  1184			if (!is_sysrq_oom(oc) && !is_memcg_oom(oc))
  1185				panic("System is deadlocked on memory\n");
  1186		}
  1187		if (oc->chosen && oc->chosen != (void *)-1UL)
  1188			oom_kill_process(oc, !is_memcg_oom(oc) ? "Out of memory" :
  1189					 "Memory cgroup out of memory");
  1190		return !!oc->chosen;
  1191	}
  1192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

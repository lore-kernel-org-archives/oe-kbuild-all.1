Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7778B30CDB5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762296915; cv=none; b=hBh/0UKznrcFeMfPMNe4/N/MxQD28Wv82n2Hdw9ztgTsbld1XOpANTX+WIZ58dZ//Pq/nrlrfqU62f7AXhcHi4sQx2dTKLdci8DDi3mx1X/6Fx6Usr+nRuZv00dWO0aMZha3j5bMfL7SugamO44WzdjDiproXKMwiLFqis5+NF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762296915; c=relaxed/simple;
	bh=lqA1PVLin934DhsKcNM8jvaCDf7UXMBWv07RAwbz0sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6qJ0k4oPDQQyhASu7odKA/XH75OzUd3/76TF2NQr7WpGL/BY05gmUoFGShOFE2lm2l18KQEEr5nN+CymlddROLlWpxsEi0gU5pamS1m7ut0GoTc2mdO9h7KbzNNqo/AKxRe4KsB9sj8YlOdzPo0u+/1XQfP8wAQcCfpW8oJkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dK3TQmPy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dK3TQmPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762296914; x=1793832914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqA1PVLin934DhsKcNM8jvaCDf7UXMBWv07RAwbz0sU=;
  b=dK3TQmPyuMMU1TYK+WNWkgKmaXzPAtmrDRiwfkAccfW9tzWFlG9MSanl
   eiI7RdSrEJ3yZRdX5VOSn+Cca2GhuedB7LoOrf23yw7UBoNd0uVplMloo
   V/ilwUp+fk5vR2Ku99E7gZtOkepi2ayxMV7usmPJNIV80q6ADi0aHPz/9
   G5omv3AVCR7JD5DJBwiRuliKg1VQy2cBOesLclSjqw7/v9QF13SRYnzOg
   PlWb8EJqiOTQ5SO0FNlfq6loTjZ3lb7eo9QHafFQpidPtPFKiadSiv8G8
   Yh66c9HZ1D3YNp7sYTprynZH+3VuFWIUQsvAvm1fCkbXJYdGB9S9QDyul
   g==;
X-CSE-ConnectionGUID: G+qfCqi4T2WBYh77R+9goQ==
X-CSE-MsgGUID: l+ArHoUdRmS6pIfNVdkLZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64435415"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="64435415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 14:55:13 -0800
X-CSE-ConnectionGUID: ACwmD6GHT8OOqxfj0JeeQA==
X-CSE-MsgGUID: S72tn2FQSveRxqJ5yPYd2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="186967770"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 14:55:12 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGPvh-000Ru6-1m;
	Tue, 04 Nov 2025 22:55:09 +0000
Date: Wed, 5 Nov 2025 06:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 9/27] mm/oom_kill.c:1186:undefined reference
 to `bpf_handle_oom'
Message-ID: <202511050650.B5YFkEaY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   176f3f07db49e29a193bd0b986301486bc19a5a1
commit: c7b8c1b6edf92a358bdf64967bb6ed4df72b6470 [9/27] mm: introduce BPF struct ops for OOM handling
config: s390-randconfig-002-20251105 (https://download.01.org/0day-ci/archive/20251105/202511050650.B5YFkEaY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050650.B5YFkEaY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050650.B5YFkEaY-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/oom_kill.o: in function `out_of_memory':
>> mm/oom_kill.c:1186:(.text+0x5c44): undefined reference to `bpf_handle_oom'


vim +1186 mm/oom_kill.c

  1120	
  1121	/**
  1122	 * out_of_memory - kill the "best" process when we run out of memory
  1123	 * @oc: pointer to struct oom_control
  1124	 *
  1125	 * If we run out of memory, we have the choice between either
  1126	 * killing a random task (bad), letting the system crash (worse)
  1127	 * OR try to be smart about which process to kill. Note that we
  1128	 * don't have to be perfect here, we just have to be good.
  1129	 */
  1130	bool out_of_memory(struct oom_control *oc)
  1131	{
  1132		unsigned long freed = 0;
  1133	
  1134		if (oom_killer_disabled)
  1135			return false;
  1136	
  1137		if (!is_memcg_oom(oc)) {
  1138			blocking_notifier_call_chain(&oom_notify_list, 0, &freed);
  1139			if (freed > 0 && !is_sysrq_oom(oc))
  1140				/* Got some memory back in the last second. */
  1141				return true;
  1142		}
  1143	
  1144		/*
  1145		 * If current has a pending SIGKILL or is exiting, then automatically
  1146		 * select it.  The goal is to allow it to allocate so that it may
  1147		 * quickly exit and free its memory.
  1148		 */
  1149		if (task_will_free_mem(current)) {
  1150			mark_oom_victim(current);
  1151			queue_oom_reaper(current);
  1152			return true;
  1153		}
  1154	
  1155		/*
  1156		 * The OOM killer does not compensate for IO-less reclaim.
  1157		 * But mem_cgroup_oom() has to invoke the OOM killer even
  1158		 * if it is a GFP_NOFS allocation.
  1159		 */
  1160		if (!(oc->gfp_mask & __GFP_FS) && !is_memcg_oom(oc))
  1161			return true;
  1162	
  1163		/*
  1164		 * Check if there were limitations on the allocation (only relevant for
  1165		 * NUMA and memcg) that may require different handling.
  1166		 */
  1167		oc->constraint = constrained_alloc(oc);
  1168		if (oc->constraint != CONSTRAINT_MEMORY_POLICY)
  1169			oc->nodemask = NULL;
  1170		check_panic_on_oom(oc);
  1171	
  1172		if (!is_memcg_oom(oc) && sysctl_oom_kill_allocating_task &&
  1173		    current->mm && !oom_unkillable_task(current) &&
  1174		    oom_cpuset_eligible(current, oc) &&
  1175		    current->signal->oom_score_adj != OOM_SCORE_ADJ_MIN) {
  1176			get_task_struct(current);
  1177			oc->chosen = current;
  1178			oom_kill_process(oc, "Out of memory (oom_kill_allocating_task)");
  1179			return true;
  1180		}
  1181	
  1182		/*
  1183		 * Let bpf handle the OOM first. If it was able to free up some memory,
  1184		 * bail out. Otherwise fall back to the kernel OOM killer.
  1185		 */
> 1186		if (bpf_handle_oom(oc))
  1187			return true;
  1188	
  1189		select_bad_process(oc);
  1190		/* Found nothing?!?! */
  1191		if (!oc->chosen) {
  1192			dump_header(oc);
  1193			pr_warn("Out of memory and no killable processes...\n");
  1194			/*
  1195			 * If we got here due to an actual allocation at the
  1196			 * system level, we cannot survive this and will enter
  1197			 * an endless loop in the allocator. Bail out now.
  1198			 */
  1199			if (!is_sysrq_oom(oc) && !is_memcg_oom(oc))
  1200				panic("System is deadlocked on memory\n");
  1201		}
  1202		if (oc->chosen && oc->chosen != (void *)-1UL)
  1203			oom_kill_process(oc, !is_memcg_oom(oc) ? "Out of memory" :
  1204					 "Memory cgroup out of memory");
  1205		return !!oc->chosen;
  1206	}
  1207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

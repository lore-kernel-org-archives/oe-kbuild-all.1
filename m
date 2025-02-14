Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB91266B7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547098; cv=none; b=rCeNpgcgOE1FWUfvV6OpZzNrxc5FgFj/1RDZuLLuF1Em47tcg25ptTgjfsBi60JYSrzGj4EonFEp+8b99RC7RzQP8xdxFk3m0i+NjUYL1S1UEOt1vH/OTsMC7Hglc14CkvwIgltI8dkMep2bKQER0S2B1/sYd+aWUy0bNWT4Woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547098; c=relaxed/simple;
	bh=hKIyQsU9BC0kOOY748dac2p9zvW1sGmHSFbbW/R/zLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPeprHGko89XSqHumTBrSm7+ID4MTpEZGksu4J3jWZ3SQ+zd5X63ibA1Ngs8GRXL36k6DSMOxUXTxaJICDqylVlH3kX8kf/3RLNMn6uJ5CZJECJGIN5uGa9cEnmUAhgZWIdCg9ldmmSFYMzYGu8DJqjzoIc/Z+BspR5n/f5Cxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9I1bwSN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9I1bwSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739547096; x=1771083096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKIyQsU9BC0kOOY748dac2p9zvW1sGmHSFbbW/R/zLY=;
  b=j9I1bwSN7eRKLmXhMNbAf+HwlcVDVMtf/Pg+T9rTYe7HusW1FjfaKPde
   oQouRTrguk47qVdUQtpp3WyxAH4S501oTvIAQV1cSyDIQFe8M8eu3zvTE
   w3c/JFIPiO/7Lin6lIWOvIxQXCfp+lZ0fJkvIS23aFBHrVZHMDeoSICnC
   dF78vuz5bctWFElxbyZZJU3H0Kt6jjyqm4ExqwWZKMGHJTu47ziqAc0kT
   DofF2um/Z7rQPVRl3Xv+Iif5dbrEp5n1w50T7M8X9x7Mev+5WM1m/zE0q
   Cn3/A/mrLhJlDGuw7H2FBWVgs6WHk5gCXQtfimGFMwDkFPKI4txHeAcwq
   A==;
X-CSE-ConnectionGUID: ZivkiOBEQvqo2S77O9kAmw==
X-CSE-MsgGUID: zJsPqRSMQh23Avg6gVra4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40006840"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40006840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 07:31:33 -0800
X-CSE-ConnectionGUID: VkwZM6jgQhuXkEM+kVJYiQ==
X-CSE-MsgGUID: 0ccb+xTOQkeBaD9wGbOFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118107803"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2025 07:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tixf8-0019mB-1H;
	Fri, 14 Feb 2025 15:31:30 +0000
Date: Fri, 14 Feb 2025 23:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/oom_kill.c:423:6:
 warning: no previous prototype for function 'dump_tasks'
Message-ID: <202502142342.scMfEyor-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: 0801d8a89de16b3371ac091b123081565d58f53a [249/249] ANDROID: mm: export dump_tasks symbol.
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250214/202502142342.scMfEyor-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142342.scMfEyor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142342.scMfEyor-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/oom_kill.c:21:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2025:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/oom_kill.c:423:6: warning: no previous prototype for function 'dump_tasks' [-Wmissing-prototypes]
     423 | void dump_tasks(struct oom_control *oc)
         |      ^
   mm/oom_kill.c:423:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     423 | void dump_tasks(struct oom_control *oc)
         | ^
         | static 
   2 warnings generated.


vim +/dump_tasks +423 mm/oom_kill.c

   412	
   413	/**
   414	 * dump_tasks - dump current memory state of all system tasks
   415	 * @oc: pointer to struct oom_control
   416	 *
   417	 * Dumps the current memory state of all eligible tasks.  Tasks not in the same
   418	 * memcg, not in the same cpuset, or bound to a disjoint set of mempolicy nodes
   419	 * are not shown.
   420	 * State information includes task's pid, uid, tgid, vm size, rss,
   421	 * pgtables_bytes, swapents, oom_score_adj value, and name.
   422	 */
 > 423	void dump_tasks(struct oom_control *oc)
   424	{
   425		pr_info("Tasks state (memory values in pages):\n");
   426		pr_info("[  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name\n");
   427	
   428		if (is_memcg_oom(oc))
   429			mem_cgroup_scan_tasks(oc->memcg, dump_task, oc);
   430		else {
   431			struct task_struct *p;
   432	
   433			rcu_read_lock();
   434			for_each_process(p)
   435				dump_task(p, oc);
   436			rcu_read_unlock();
   437		}
   438	}
   439	EXPORT_SYMBOL_GPL(dump_tasks);
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

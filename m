Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519EF3624A1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205659; cv=none; b=DKUSjyeiY0uXvCVmPtOD5lYAiEbCKcPkD6LmJPphPwiK2bPHSeB6DXKsJUnFypbDDnslCRHNWjXxfEosRKBINUKBTufKXni/vDlwOQPTHnVoS+xGjOU5egSvtb3aDfKDPCCSLWe+XZv47VBOH1uHNhQeEOi+VJVbldJbjTwAf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205659; c=relaxed/simple;
	bh=bJc8MVsCh8MdzQngPr9sFlpO74ctfDmHxNkkb9i0xSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J012nQYWNiVTw7en2+5RngDsLRCrodv9yTNStfO3LJwbJnor+eWqKTtjmfSvFAalKL3bpZ6zE2tfCwlJI0e0Ugiu82Xy7Gwa3/rEaUy7x1HxidAXW9Xgo8o4Z2/8KT4xmTnhmP+iTTo+uy9ziXKVoi6Ky1B5AK75pkYuscYToSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDIe2Juh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDIe2Juh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205659; x=1806741659;
  h=date:from:to:cc:subject:message-id;
  bh=bJc8MVsCh8MdzQngPr9sFlpO74ctfDmHxNkkb9i0xSs=;
  b=DDIe2Juh84uVjyo3skewWKWCVsXPr1e6WUgjvfB2kWNbfIjWyg8wzr0B
   efdnYi+ZxynOIsnsLofSqj/TmNBa6q4hXSb/8kznVk09TEao0t0NASB7f
   lOxueDM9cuElvL7q+/NAbyE3oRDZEpFU1FVOnBsYjPdtv3p4nSGGaopuG
   i6dPZsrjs97PTlyRbZwj982jP3W28drsjEHW+AMmZFDrwu9wb1q3UQArx
   acq6d6QCYaqNSmrPFlPNi+DIynDoVjKLTWfYFWJM0MeG+quHwos7F06x3
   S8KqbmOUjtBhxxUARPSCf7QF4ftDRFHEoS/Y9oM7rsecUU1xozbCLKiID
   Q==;
X-CSE-ConnectionGUID: El/1K69STcS/oeEQ7fLq1A==
X-CSE-MsgGUID: WzwH//GXQQeqwdI8Y5T2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156622"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:58 -0700
X-CSE-ConnectionGUID: GI1eMAcQRKKQtylrg3vUOQ==
X-CSE-MsgGUID: VBqxlWuXRSusWSOxEDLCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="224370754"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2026 01:40:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a5G-0000000012D-0Y4w;
	Fri, 03 Apr 2026 08:40:54 +0000
Date: Fri, 03 Apr 2026 16:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 28/28]
 mm/oom_kill.c:423:6: warning: no previous prototype for 'dump_tasks'
Message-ID: <202604022059.1W1x8nIt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi liangjlee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a106900ad13546acde0a828d15c9e6513e6b5f62
commit: 0801d8a89de16b3371ac091b123081565d58f53a [28/28] ANDROID: mm: export dump_tasks symbol.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260402/202604022059.1W1x8nIt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022059.1W1x8nIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022059.1W1x8nIt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:423:6: warning: no previous prototype for 'dump_tasks' [-Wmissing-prototypes]
     423 | void dump_tasks(struct oom_control *oc)
         |      ^~~~~~~~~~


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

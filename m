Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125300;
	b=qU1dPJKA/aR227nq1h33qdz7hTrGrhf4WvqHoWjCfKgzoB4RReitvFIrUx3BggpoICQ4
	 lR4lsfThCSD2qrXBVOz9anyzBbsZidA/Z1uKUhgRmQzKXFwVHWp/2Tsl0MoNWbw9XIc4U
	 5uhHZgZ+pMHKPib/hsjHD2GXQ26WyOkYD+BQkTi7S5pZTHIzfAqLXl1noEe/M1Fi93hlG
	 DSy5/4PPB0I4t9VZ0tVjPlmgPBEnYI1SfxSzP+fnnJUgmHaw4vRYbeHfQbYvJd2sE9Eov
	 s2TgS78JzwmA+EsqN7kXOhsLoadtl1Zd/MfllsQiWY3lm09M6cIzl6RxrG3aN3HnE2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125300;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ECY3HSkdM47kdPEaLsWJXlXwzIk/yCqNZ1sAUziblT8=;
	b=qumatpEMdyQn3kEo78dnJuCtNAlwTwk9N3xNJvfaZ1WeLden8l/btG+tAMajlIHQcxg8
	 yWrNZ0sLzDPbyWu9srHdaX/D5NlWHBKDJpfOTMLRqc//VESf68yeeyOBlaZE+d0CJIw1s
	 fRQjO6toJN87qMZo679oPOYjWLIoreizPCBJ0fzaLBecKy1G83bTRJz4++VMn8Obt45iC
	 RVrp3mc3LVWbDjhd0RYGUdbJZXVhK27h5chnpXdt7bDzwGNM5djWXmAube1ugELbyjkv+
	 nw3AnxKD0LG5yK8iO6QtnTB7swIEJjTGLsxTTYL4SbylkdlXp59Zj1NJMGbkeUsSUDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1zTbREf;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7BB606A31D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 18:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B7BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1zTbREf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793125298; x=1824661298;
  h=date:from:to:cc:subject:message-id;
  bh=BTPZEBiEyKQinv4plIOfTT0SAhrxWqCvEdc1LynQ0UE=;
  b=j1zTbREfen8TvA3izOx/09XNIgkynTbUDtCvWSVCx6dB9KJm3KtmBSXl
   Os0G2mWn56pcr7HVZOhBn3XHVWAjV3GLUR+wGL39WyHztZSmYEniZGS5H
   lzwwlAv0CK7fhJrTlkAUmB63sp4oBa/xQ1lz/Vt4Orv6FFyJjt3tPghDK
   CqYxcMLijCKNS3Luc9cHE0gvvqEUalJHf1ULn0ZQgutgV6W+3i3EJClIy
   ihncolKkaI7nVyUf8vsYS+EWZTynNRkL6O2c1NOCMMQxrunxrG/ZVLc3d
   bVVmwkusiq4Nq+VBnbr90OIrrk4TG9Elo0Wypt6t/OAh9HLBsTn/vW6W8
   Q==;
X-CSE-ConnectionGUID: RACkJZNvS5yLuAh8x4GUBQ==
X-CSE-MsgGUID: SEK/+RM1Tc6W7dREDMDtoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1848079"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1848079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 11:21:37 -0700
X-CSE-ConnectionGUID: /oDUWYKmShS02aE9oDLN1Q==
X-CSE-MsgGUID: Svbp1IWdTu656havO5FhKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4623260"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2026 11:21:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLlnh-000000004aZ-1RUL;
	Tue, 27 Oct 2026 18:21:33 +0000
Date: Tue, 27 Oct 2026 19:21:08 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/oom_kill.c:423:6: warning: no previous prototype for 'dump_tasks'
Message-ID: <202610271909.Qqw9LyhD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi liangjlee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   0951885c34a0e48adda08777b026c61fed9613ea
commit: 0801d8a89de16b3371ac091b123081565d58f53a [353/353] ANDROID: mm: export dump_tasks symbol.
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271909.Qqw9LyhD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271909.Qqw9LyhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271909.Qqw9LyhD-lkp@intel.com/

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

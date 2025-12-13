Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849526FDBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765663119; cv=none; b=mlm1ELl6TUNBG9GZ2M5rJxtnuMyF8PIKPgueAHoc0g0bFqMi4Ujn3BC2FgbBTNMwspLPs+lYiON0fhlxtmeAzi7n9ykpZ1ZazV+gpJB5q8TDZ2DIZh+hCJyZ6TaNM+yhWaVu3+eFIZJjm4J2wvKgSDgOO84Owlrvlsu5Jbfj74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765663119; c=relaxed/simple;
	bh=fi01fy9WhFk534+n68wzFbWJbFl5uyWek/F+Xh4flCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2qf7aK0EtreRMSec8Sj9B7br02B2IDEArdeTj95iuecKxE/oelODOjBPby3YG4TsdQn1Pl78nDTkL+AX5MVRTWFsspelmu04sBzUOYZbRTjZqlIaQQ84VERBFq8PbMIyp0WmrndCaYUqUMgG2nOSm0X3tinIKTmkPeWtsQZ5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEhavR3a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEhavR3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765663118; x=1797199118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fi01fy9WhFk534+n68wzFbWJbFl5uyWek/F+Xh4flCs=;
  b=jEhavR3aSvQ4qpoEzBmU5zsUpYPSLbZK4kiNyWNDcURp672NxUWnOpja
   KsuY9oYcAwYvu+HdJ+V4z7Y8RC4PRTqFNhT/sGSaEpzg13YX/MK4P0joM
   BeAx2ysken7HL7WF4u3NSMl1CRmitqewgi/tMLjPJm38s7Va2nqiznDf/
   zcr30LjMOGLtHx2rXZUqjPTNL0dZpstD8eCO/zYOeXUTtGowGWGhr299f
   eBvPKljyNTDDVVp3DJEY421njDSu6Ih7qTWcgc5H0apbvqRjL4f/w55UF
   fefBO9W9p5Gn/0YknDmlSkjsuzUarDNBw1jzY+V5q8/hXcZJ07hTv22wi
   Q==;
X-CSE-ConnectionGUID: ve8oxb18RViWv+uYivgYDg==
X-CSE-MsgGUID: coSsRIQsSjiAmOtsMwj/Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93099864"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="93099864"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:58:38 -0800
X-CSE-ConnectionGUID: S6DfQ1ZRSQ2/sPBMlASyUw==
X-CSE-MsgGUID: tufniwBmSlmnh489r+Ys3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202474063"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 13:58:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXdK-000000002C0-1Bur;
	Sat, 13 Dec 2025 21:58:34 +0000
Date: Sat, 13 Dec 2025 22:58:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] mm/oom_kill.c:423:6:
 warning: no previous prototype for 'dump_tasks'
Message-ID: <202512132258.XiRKgUWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 0801d8a89de16b3371ac091b123081565d58f53a [40/40] ANDROID: mm: export dump_tasks symbol.
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512132258.XiRKgUWz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132258.XiRKgUWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132258.XiRKgUWz-lkp@intel.com/

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

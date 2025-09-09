Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497C33EAF8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423524; cv=none; b=JLE7gQqPY2yOFfRsFS/ppiK2IPSKgkPUo1VjjxvNwMYZmoAHTLWWx6nlpRIF9p5iEiNkit9Q97IOZhigB6c6KXeuwcogT8PC9B2ShvqsgHCWkKZWxTy64eyCcXzXYjb/kTgNoIzPZuopCyMDf/IFIPrJt7MEzPO8ORHehobxSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423524; c=relaxed/simple;
	bh=XKgz/ynuCdh3l7zDnUZIDC4fjymQyjQDCPlVwuqteZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiSrrsObCX5Lch/Ov8xqWPIqenuS7uQ0g3aIDYhIkc0WmKOtjFLqbgjP1DhGZK6SdfriV4Z51Ez0BirP7NHvRtZNhcNEKw/0Oev6QEVuKJcT+aRpyCTDFVWb3tDfbTBjF7FSPJPWZLjCROzBmI0toHIMa/muAxySZPTdGu+f9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkOGd3Ja; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkOGd3Ja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757423523; x=1788959523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKgz/ynuCdh3l7zDnUZIDC4fjymQyjQDCPlVwuqteZ8=;
  b=BkOGd3JaBMUeWkcv0AXhHSRWve6jn4/OMkm9epQ72w6eqK4+ybDHtWux
   ntBwy0oBF0vFEiX3WHSyQZ7bRFKJWBdoLt3xGTc0oPdD+fpppTqQXlMYh
   elJ5cv3/Thx1pKgmhrP3DVe6zlKYaLVlcrdaQw522KmQJvusUeTdBT1ya
   rRKE63XlVlIZGaIBGkHCA83gWEEVee+YeZiVoMgwkwRjDYl5mZoKoVfa8
   TqRRQexrNrLS5MsKvXvqblGIyI/ArVmxRCi+35NjOCuOv9JnD+nnaYp4r
   o9tO9uPdh7p889xZcdTip0imb9w0Nh8D92YLKEamkkQa1uIQquqBXTnfG
   g==;
X-CSE-ConnectionGUID: zBVfb1xzQa29QMUrMG3Jjg==
X-CSE-MsgGUID: XyPslFL5R26oQxHArY1LNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58746077"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="58746077"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:12:02 -0700
X-CSE-ConnectionGUID: msqTz+XmTYWPjemv1qp1bw==
X-CSE-MsgGUID: RfDt0q1NTHu+J6F4IgYSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="178285993"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2025 06:12:01 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvy8d-0004sI-0z;
	Tue, 09 Sep 2025 13:11:59 +0000
Date: Tue, 9 Sep 2025 21:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/3] mm/oom_kill.c:423:6: warning: no
 previous prototype for function 'dump_tasks'
Message-ID: <202509092113.0el9k9d9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liangjlee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c
commit: 0801d8a89de16b3371ac091b123081565d58f53a [0/3] ANDROID: mm: export dump_tasks symbol.
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250909/202509092113.0el9k9d9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092113.0el9k9d9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092113.0el9k9d9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:423:6: warning: no previous prototype for function 'dump_tasks' [-Wmissing-prototypes]
     423 | void dump_tasks(struct oom_control *oc)
         |      ^
   mm/oom_kill.c:423:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     423 | void dump_tasks(struct oom_control *oc)
         | ^
         | static 
   1 warning generated.


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

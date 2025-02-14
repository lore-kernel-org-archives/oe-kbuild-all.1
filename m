Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF02163A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523587; cv=none; b=cRc9q6BOw83rYzUvW/Jp0Jx00eYKuI0kwWvnN7b7w00eTV0nd/auICeNxIJNT00VH77IBCoOXKrusVKIgsqu2iT7uUa+34U4dPSZpmQEDh/PiTclrKr/YeFZlnf2h87V2W1EGVVojDCUqjNdWRxRUnQlKSmCoEnNOEM/I6rncbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523587; c=relaxed/simple;
	bh=onyAoNj9/jtIAFzkeJQWtsgdKDKef4DNp9CvTZEOs2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vvc/D/SYgs5ebE8nzoceNPpMs9AlE06HmJIZBQ0wln3OkTU0BcWwqvr2RJB3pHH9YErwbf/Pdy+1QQAtzMb6J9kwcdTz5EXCmaxBgY1d75nPOai4jL8bSh/6Jw5FzjSkNJHXg/B/bQIIB06jjWCKLd0p4CXAobPjrP0UF3o6afA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tectddyl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tectddyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739523586; x=1771059586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=onyAoNj9/jtIAFzkeJQWtsgdKDKef4DNp9CvTZEOs2c=;
  b=TectddylewN32doulmMQsu68bQSyk9iRFWSpVSKA4C95f9NcwY01cSjh
   nA3Rj/uftRpiWX/B1MAj6TxF3uhKxnZd1W69Uuuo2LxKo/P1+y02QYdX9
   RlDJM0AzR/BbefA5ILfSM5GO2rku0VLWoIpVreo/Tq6Y5C1lPf6uoNqFk
   VVa1uj79py31saIYCsgeLWcgEi7zQZ2jii0uT5vKkYZ5Cg0E+8JeLe3pJ
   3u4dlqqDS9XwLOyxQ0i9dlZQBSddgC8IFdv/N1cmgrd+eCeRJOpPuWVFA
   cD7O5S5iVS994aNH4W+n0euQMOwL2dC4vGWDCSKGHmayPMLIN9f/6EJzq
   g==;
X-CSE-ConnectionGUID: sx+xZfKIT8m5qQUdk+K0SQ==
X-CSE-MsgGUID: uMBabCCDS6KH5SMZpcfBVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57672379"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="57672379"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 00:59:45 -0800
X-CSE-ConnectionGUID: AbVz6TSdR1KlKD63l/333A==
X-CSE-MsgGUID: GBfStiw0RES17oqqYnDpdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144339768"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2025 00:59:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tirXx-0019IT-1g;
	Fri, 14 Feb 2025 08:59:41 +0000
Date: Fri, 14 Feb 2025 16:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/oom_kill.c:423:6:
 warning: no previous prototype for 'dump_tasks'
Message-ID: <202502141624.so6V5mCE-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250214/202502141624.so6V5mCE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141624.so6V5mCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141624.so6V5mCE-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA5171CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2RKWWsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704979453; x=1736515453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjSemFIxycOpMNntlP67m9R7FK5weoTIjv9uukqcB3c=;
  b=h2RKWWspwYVtNLOfnJLRPHKeeb4UFXMukDEF8dmA7MjRkT/CAC+zwV8P
   SDhM2pOvKBgbuMECPsLHOpcSbCKNn2Izlvbyinqp89eXDlTdTr3a1zpP7
   doCL6TvnWij+AD4TfeNzlkf5l7usC2va5esAsZiIwDPFlXW42cE3o/IGS
   Nw2S5E0CD+pAj96UtElijSI/Raz7vhKRlAqy9VVakG2WwqkVQhy6M4b0n
   WfaLY5xSh++UgxY+LrQuHodaWLuoJLJeSurSUB7RYtpK4naYzKRimZqP7
   NpaOk8bNWZf/ze1sOS01COJyVHzVjFYKVu6HSkQxUp/EY6u81JcRmo8ha
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5583144"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5583144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 05:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="816713833"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="816713833"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Jan 2024 05:24:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNv2W-0008I8-3A;
	Thu, 11 Jan 2024 13:24:08 +0000
Date: Thu, 11 Jan 2024 21:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] mm/oom_kill.c:423:6: warning:
 no previous prototype for 'dump_tasks'
Message-ID: <202401112115.cN0rEIG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   bf309bfecfed8d40a870a96a53d3c3c4448e67bf
commit: 4df28ddcd988605998c6d2b723345b82c7f83a5a [1/1] ANDROID: mm: export dump_tasks symbol.
config: i386-buildonly-randconfig-002-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112115.cN0rEIG0-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112115.cN0rEIG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112115.cN0rEIG0-lkp@intel.com/

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

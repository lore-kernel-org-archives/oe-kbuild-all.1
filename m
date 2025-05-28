Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130AB640
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 01:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748395014; cv=none; b=UbBaIVGR8Tk5R674kW45190zxWJdMv8wOJz67hD4NWh0Tq/l2JGpiIzhw1d0zYS6U7qztp/eGEphqx8ZxojM1yBa6l91FGoncWyvhcFfbKs+/711tRQrGxy/mjCsHCcMskonTcYL72SEiz+uqeadmnWn9NAmmMUPYBjOG+2ZVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748395014; c=relaxed/simple;
	bh=sDpONXeRSnjheb02sq8Ve98uM3SjTFiMXoWaFZ07jqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxAGR30VGF8tx7Xoe30jSifAjZF+DmcB3GBu+CJXO95S4Hwt4wJwh7ICB5xKi/1BtkbOhxfj8B37GbwO8p5/W5dRfjbD4XUrkydX2ez7wa79Fl2e1RBY2JuxvfqTl6CfGPrmF/O/v2/1BX0VFI5DB3MLKQ/NJ6z00KsMkoLnpkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAuED/v7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAuED/v7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748395013; x=1779931013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDpONXeRSnjheb02sq8Ve98uM3SjTFiMXoWaFZ07jqY=;
  b=oAuED/v7hxnPmD6brHvzsChsuucPFJsDkxEsBeHg0IsyOfMoFVWF3jLB
   DZZlh/aBuaRPu/FtZpzHyRg1TQJtxsvC3ubmgEezIVR9Pxb0R5ghBsK8g
   I2sHPFqjkpLPVeHRc7oe9gWXzMrMTXJ938p9hnVcohwy3gPaUch17H/hZ
   Y+LiE399xp+amylzUBEelPHC/3InlPwMW8hY6MI69Ej2G2xADB9BmhXmW
   dJDcWalVy9Dvil7ANWYe7JJnzm/Hn8qh38hhK6XShveUUv6knJCArGJAL
   7D2tGdt9vw7WiVxHsjRmR/p/1GS30+81dzZyDzpBtNTghabP1Ipn40338
   g==;
X-CSE-ConnectionGUID: OMG4kBCzTKeNJiBXxqWyrg==
X-CSE-MsgGUID: /mn4NH7MTWOVjBAptVZXzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61458846"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61458846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 18:16:52 -0700
X-CSE-ConnectionGUID: RutIpdUBSvu3NG7EgiDDkg==
X-CSE-MsgGUID: 5qd8mLTDQlqyWVqj+dzXmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="144021491"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 May 2025 18:16:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK5PV-000V8u-07;
	Wed, 28 May 2025 01:16:49 +0000
Date: Wed, 28 May 2025 09:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 385/385] mm/oom_kill.c:423:6:
 warning: no previous prototype for function 'dump_tasks'
Message-ID: <202505280928.e3bqBSGQ-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ed91d589b2844cb67999b23119f18a01d3c1cedc
commit: 0801d8a89de16b3371ac091b123081565d58f53a [385/385] ANDROID: mm: export dump_tasks symbol.
config: arm-randconfig-004-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280928.e3bqBSGQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280928.e3bqBSGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280928.e3bqBSGQ-lkp@intel.com/

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

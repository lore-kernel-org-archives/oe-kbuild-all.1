Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94058341062
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188484; cv=none; b=IurZxPaMqaMU79FNW6SCmrMLKTy2uIq7n120DPjoO7HLMrxDwAREZZguP6Pi19tDs4EUBnFGJiV2kkxCHkJLffy1hgfUSqxLd4d0El9zDT166SXa0m7xqOlkXa7P0HPyPh57k8dKeJChAEaJnXN0TSgFQkt919r4h29fGaJo+HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188484; c=relaxed/simple;
	bh=XsRexKuN7XNuYITqvMCRkC7GAhB6jgptz1tPXDnoEog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pd58fhgWn6YbgbjFNNGYVbmMxV4Nmxe/Tk0bM88kPPQNRCu0IXgd9dxKu82dixEhUGMNCAXACE0er0vGAOzsyfsdTG/tmrfU2zKDw0z5fI7X3NnVv4ByumkBWm6flAVWNjpxyHrJMWAMP5ci/UhmSG/fWDghIXAGatqCd4JJprA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW4yUBKZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW4yUBKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778188483; x=1809724483;
  h=date:from:to:cc:subject:message-id;
  bh=XsRexKuN7XNuYITqvMCRkC7GAhB6jgptz1tPXDnoEog=;
  b=BW4yUBKZ9+IoVNsHpMMsiPMyI1cIiHJDaDj0KOd5AOtTRAhaEnyKCoWW
   4zU4Ww3TMi/WssMOTA+eVwbE0KX5PHLrPH+uuTPq+zsA0oMhpLecSsxPM
   McnuOPsYhe7UixD7jox9RcQ3aBdC+h08I4hp3ECoiE3SN90isi/6xWbBR
   2wjR+ews3zmOBCK0DBaGmdiovtGmiyZJ0kGZKMKZwy9tpGTx1TBsPHOp8
   ybjeTKOxuOSraI89tSYwnnc4wdbzMTTNdK48ZbJsBLYastBrF1igDZBie
   0GLvhftL2B1kGakNkV6IptkkIGPI8d68OyWxgganKrXRMXiB1M2mHjMZD
   Q==;
X-CSE-ConnectionGUID: glYWF7LGSG+MZZX7KxBAHQ==
X-CSE-MsgGUID: VhRb2G7fTxKroZ81WetZNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90531683"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="90531683"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 14:14:41 -0700
X-CSE-ConnectionGUID: 1UgZsXC8RLu+HOQeFzqAmQ==
X-CSE-MsgGUID: zttr2+xnTeiT92iHmmh7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="230181878"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 14:14:39 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL63I-000000000Rt-34Jn;
	Thu, 07 May 2026 21:14:36 +0000
Date: Fri, 08 May 2026 05:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:313:26: warning: 'scx_find_sub_sched'
 defined but not used
Message-ID: <202605080556.42PXw8U9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 25037af712eb04eb92a89440852029a50eea8d82 sched_ext: Add rhashtable lookup for sub-schedulers
date:   9 weeks ago
config: powerpc-randconfig-001-20260508 (https://download.01.org/0day-ci/archive/20260508/202605080556.42PXw8U9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080556.42PXw8U9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25037af712eb ("sched_ext: Add rhashtable lookup for sub-schedulers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080556.42PXw8U9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5633:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5633 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: At top level:
>> kernel/sched/ext.c:313:26: warning: 'scx_find_sub_sched' defined but not used [-Wunused-function]
     313 | static struct scx_sched *scx_find_sub_sched(u64 cgroup_id) { return NULL; }
         |                          ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:12:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
      12 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/scx_find_sub_sched +313 kernel/sched/ext.c

   305	
   306	static void scx_set_task_sched(struct task_struct *p, struct scx_sched *sch)
   307	{
   308		rcu_assign_pointer(p->scx.sched, sch);
   309	}
   310	#else	/* CONFIG_EXT_SUB_SCHED */
   311	static struct scx_sched *scx_parent(struct scx_sched *sch) { return NULL; }
   312	static struct scx_sched *scx_next_descendant_pre(struct scx_sched *pos, struct scx_sched *root) { return pos ? NULL : root; }
 > 313	static struct scx_sched *scx_find_sub_sched(u64 cgroup_id) { return NULL; }
   314	static void scx_set_task_sched(struct task_struct *p, struct scx_sched *sch) {}
   315	#endif	/* CONFIG_EXT_SUB_SCHED */
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011E23F411A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 00:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717814; cv=none; b=jW9gNV2kmXUPlt7FYKFfbC0fAxYJFZI6ejUgxQrTvCuNQDU//JHw+pv8+VG6ISKpaRkBYww5Bcl8CiFe8x2Osb78oesdO7f8rJ1XNeygnuLlEtB38KP51O8j/hQlZmhxBmEY8SuUQRBm7hcIObHtBEGbf1LSF7fS+IiABBlP0a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717814; c=relaxed/simple;
	bh=Bogh93+3QW0FibIT2WzhjF/JWRMIR0QOB2PBue11j48=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ATazqdcwWFJr5sQeNqhgEzxiryCBZ3BinMvQmxRNj0RSGEAk8PckWZXHrNs+gy0RtkqIlOZJGLAZ5CetBDNKqxtg+C9MfH2lLhCtETMS5ZFLugqDoM9iIlsR+mopX+RCuTDIvycexCKiFVScyk3qzx1CGTDhp7+qIkPl83hQ/VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Grf3BVBt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Grf3BVBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778717813; x=1810253813;
  h=date:from:to:cc:subject:message-id;
  bh=Bogh93+3QW0FibIT2WzhjF/JWRMIR0QOB2PBue11j48=;
  b=Grf3BVBtXK627WxZ6Pr8eUAJrDX+UpiKyFFIlSbkcxPx1q6LEqbILWMk
   BNsdiga3bZD+jHuP9of085YffSqzXCYvcRzh5etQHumbxGWnMe7jXjmNc
   VqbFb0lt1/feDdte/CdBdDmJxS9HRg/Ujr+2AaebrXK3FZ3UbIi+ULDiv
   PrKrGqQjEGznagH4P+yiZKBnwZswBJzlOV7hTQdeMNGxDnvhKPSKuErse
   65wsBBNUYXk69syT8tlGwqKqgwJMbRfUVH3xtNX9Rue8G+r7U+FfyHged
   za8kXVEljtuMqHpVtAplhI0rvWMIUXVDLdsQAuD2ir/6KyE0WV9/5G9D9
   w==;
X-CSE-ConnectionGUID: oTaRgQS6T0yCkNv6i+PxFQ==
X-CSE-MsgGUID: cf4+6KVuRlaMrmwJ9BiY+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79551694"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79551694"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 17:16:53 -0700
X-CSE-ConnectionGUID: wuPlW+ztTgCTxws7CPRMPw==
X-CSE-MsgGUID: EW/J+bBST/qLXCNdQGTbtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237248836"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 17:16:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNJku-000000008hV-2XNI;
	Thu, 14 May 2026 00:16:48 +0000
Date: Thu, 14 May 2026 02:16:08 +0200
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cpuset.c:3604:1: warning: label
 'out_unlock_reset' defined but not used
Message-ID: <202605140253.viWshnDL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/cgroup-cpuset-Fix-deadline-bandwidth-leak-in-cpuset_can_attach/20260513-233840
head:   6b7a0366d38d3efa80d721b02d588f3f519aa8b3
commit: 6c37dfa9b4198303c230c525e0796e883dde1624 cgroup/cpuset: Fix deadline bandwidth leak in cpuset_can_attach()
date:   8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260514/202605140253.viWshnDL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140253.viWshnDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140253.viWshnDL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/cpuset.c: In function 'cpuset_can_attach':
   kernel/cgroup/cpuset.c:3037:33: error: label 'out_unlock_reset' used but not defined
    3037 |                                 goto out_unlock_reset;
         |                                 ^~~~
   kernel/cgroup/cpuset.c: In function 'cpuset_can_fork':
>> kernel/cgroup/cpuset.c:3604:1: warning: label 'out_unlock_reset' defined but not used [-Wunused-label]
    3604 | out_unlock_reset:
         | ^~~~~~~~~~~~~~~~


vim +/out_unlock_reset +3604 kernel/cgroup/cpuset.c

  3563	
  3564	/*
  3565	 * In case the child is cloned into a cpuset different from its parent,
  3566	 * additional checks are done to see if the move is allowed.
  3567	 */
  3568	static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
  3569	{
  3570		struct cpuset *cs = css_cs(cset->subsys[cpuset_cgrp_id]);
  3571		bool same_cs;
  3572		int ret;
  3573	
  3574		rcu_read_lock();
  3575		same_cs = (cs == task_cs(current));
  3576		rcu_read_unlock();
  3577	
  3578		if (same_cs)
  3579			return 0;
  3580	
  3581		lockdep_assert_held(&cgroup_mutex);
  3582		mutex_lock(&cpuset_mutex);
  3583	
  3584		/* Check to see if task is allowed in the cpuset */
  3585		ret = cpuset_can_attach_check(cs);
  3586		if (ret)
  3587			goto out_unlock;
  3588	
  3589		ret = task_can_attach(task);
  3590		if (ret)
  3591			goto out_unlock;
  3592	
  3593		ret = security_task_setscheduler(task);
  3594		if (ret)
  3595			goto out_unlock;
  3596	
  3597		/*
  3598		 * Mark attach is in progress.  This makes validate_change() fail
  3599		 * changes which zero cpus/mems_allowed.
  3600		 */
  3601		cs->attach_in_progress++;
  3602		goto out_unlock;
  3603	
> 3604	out_unlock_reset:
  3605		if (cs->nr_migrate_dl_tasks)
  3606			reset_migrate_dl_data(cs);
  3607	out_unlock:
  3608		mutex_unlock(&cpuset_mutex);
  3609		return ret;
  3610	}
  3611	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

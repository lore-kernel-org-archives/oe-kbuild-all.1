Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC393E5EFA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336417; cv=none; b=nl+Nt/JHdJtrRsnZCCPST4PZ48reGaSG0yjQbKcRJCGJzYQFgvqryoIeqJjbKhg+dYs7qZeR2XWjws85QRYSdk+WTZ8pmNpCkPfEqUgxFDEMXbXYOy5oxa/rIMAXa/T7fG50kPbhOtLzxJlEGkVWQTb8BETpUrS9aBcODN+Ae34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336417; c=relaxed/simple;
	bh=9g5UHAEpawLOXxnFab25ECu+ymqsID9m6PiRmhzl1QM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=grKjdllzSpXxR8iNfAQmcJol14B/jEKZ6Is88WQEotSsfxDWpL8QY/T+/klsAmxH2aFm1Yr2Wg+L2f8KG+8uDo0aWkCS+wT0UCPNbkd1I4a9SIeCoLpEJon38l/XEENHkVc/rwgxkQSWufE0TXQMto9P647vSuG6waDMwXFPty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0N8iGTQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0N8iGTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782336415; x=1813872415;
  h=date:from:to:cc:subject:message-id;
  bh=9g5UHAEpawLOXxnFab25ECu+ymqsID9m6PiRmhzl1QM=;
  b=f0N8iGTQBvc3TfU7MyHp10N0KNdzGrLmam4uuGnL8PVYKJV90NN2KJlV
   +2fdGc8M9fEwKISIlVzz6zLfw25ss7BoGIFIyL7+KtFksgA79x9rrZY5M
   pI5nM1E1qJDMIszPKguokPV6hQcVoSkceFoWB4YYh4kHkXS8wfJp7eLeZ
   Rdn9qaqmomn8qq1Ekyr9G5tD3mSlAHcAPxoVkZKIhQuQuQfx3JDuLJ1dV
   GwIIKI0qTODXUyA0ZFTBQOubnAzUfgL896KRVIc1F9dedyc1h59b5XP7j
   IngTuamaZkcTSfwRs1SLP4/TjFQ01zzTvFMqa8Azd00CIiYluuTtwvnXw
   w==;
X-CSE-ConnectionGUID: ThZv9GzLRA6PiAQzAc1OJg==
X-CSE-MsgGUID: C9QlrrBAS8+qHYiaR+gfqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83112005"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83112005"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:26:54 -0700
X-CSE-ConnectionGUID: +CZaW6omQAW5KidECp6SlQ==
X-CSE-MsgGUID: scTRAY4bTP2E8oBuUrJL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="243686842"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2026 14:26:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcV7T-000000003g9-0H4p;
	Wed, 24 Jun 2026 21:26:51 +0000
Date: Thu, 25 Jun 2026 05:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:puranjay.2026.06.24a 54/65] tree.c:undefined
 reference to `rcu_preempt_blocked_readers_cgp_ndqs'
Message-ID: <202606250524.NuoTnzfd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux puranjay.2026.06.24a
head:   9f9e05ef4454de1724d65dcc1d45018d0457bd7c
commit: ab15f8d23a687736b674b3b8669a744dd709d97f [54/65] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606250524.NuoTnzfd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250524.NuoTnzfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250524.NuoTnzfd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:69:
>> kernel/rcu/tree.h:498:12: warning: 'rcu_preempt_blocked_readers_cgp_ndqs' used but never defined
     498 | static int rcu_preempt_blocked_readers_cgp_ndqs(struct rcu_node *rnp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: kernel/rcu/tree.o: in function `rcu_gp_cleanup':
>> tree.c:(.text+0x66c0): undefined reference to `rcu_preempt_blocked_readers_cgp_ndqs'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

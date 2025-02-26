Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F671E1DE8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 21:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740605471; cv=none; b=Ax5Flqfn1c6GkPqAHneE7YdxkZNiXgzo2HTECbtC6vspy/n8VEzPWXEJeTYotznI4AG0D39uRJk7+wRsW6CHUu+vXYMVv2GLiiV5PaVJEe2rjVYYvNAldGWFB8ZaUJvb2mfxsSmAq42cOAbqMChejJUA1sgJj3lmfIJ9xdox7Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740605471; c=relaxed/simple;
	bh=dOY0qxRehsq5FTEulrvLPUDl1Mrht/yPE5s5jOkAsa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LvtzRUXpHZr4YTrjZCJ1yZKAlqUNhI222zOeiQjpf7Wv3nmkJ0fru+9slrL42M8ARj5q9RKurgcBZD/bi/ppJeknyvQwZXLsfS02Ts5f7VSD6EmqLnuZCdb7maCyfAr0XJB2r9au+jqlOsZIfYPZtxwdL+B1v1Jrp1pvrBVDMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULbifNrK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULbifNrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740605470; x=1772141470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dOY0qxRehsq5FTEulrvLPUDl1Mrht/yPE5s5jOkAsa8=;
  b=ULbifNrKDdfjWs7ET5zLvJj0UUK2zjZU2WoxoeqYcPGDXi+ZjK/QsiMX
   nfl7YsA72ZF5LPQsLuZb7OFp5g4StGav+MUkOzJ0NzNSUPv1JJhGJOjuf
   KJJHCbZeC5451Re3t6rDA3Le3nQl7Hek/2orwIwH15nijqmAagiEn9S22
   y1vIs9pQO9RlW1++bex9FOTL2T1XdVekcek4zVLPcxZrnNbEgcUUJqx85
   5M95mJlSWAcHuk/1x7Mte9+j3ltP8rqHiLI9ExvVMLoyG4WWIV/S2bkvR
   lulFzP2RDqQd09TxawUhpzigd1OTZlynjiuIfFfIGOIDyCBvZObs1zMHV
   w==;
X-CSE-ConnectionGUID: wVyfrbPlTkew8PrR9VUxNw==
X-CSE-MsgGUID: 0brrvTF7Tf+icjnl8x8//Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52464414"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="52464414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 13:31:09 -0800
X-CSE-ConnectionGUID: +5r5FlZcQiqEjmizDWlRSg==
X-CSE-MsgGUID: lqZZwz7qQYyRAFjlNy6aOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="116634643"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2025 13:31:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnOzh-000CTx-2j;
	Wed, 26 Feb 2025 21:31:05 +0000
Date: Thu, 27 Feb 2025 05:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 3/4]
 kernel/sched/deadline.c:210:6: warning: no previous prototype for
 'dl_bw_visited'
Message-ID: <202502270541.ky41N2cQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   78c2e4083eeedc3526f07bedfca514eefbe45e38
commit: 2d96e08126551c9773a9c9854d08c7559c9c90e6 [3/4] sched/deadline: Rebuild root domain accounting after every update
config: riscv-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270541.ky41N2cQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270541.ky41N2cQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270541.ky41N2cQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from arch/riscv/include/asm/pgtable.h:9,
                    from arch/riscv/include/asm/uaccess.h:13,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/build_policy.c:17:
   kernel/sched/rt.c: In function 'sched_rt_handler':
   kernel/sched/rt.c:2913:21: error: 'sched_domains_mutex' undeclared (first use in this function); did you mean 'sched_domain_attr'?
    2913 |         mutex_lock(&sched_domains_mutex);
         |                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
     166 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   kernel/sched/rt.c:2913:21: note: each undeclared identifier is reported only once for each function it appears in
    2913 |         mutex_lock(&sched_domains_mutex);
         |                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
     166 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   In file included from kernel/sched/build_policy.c:60:
   kernel/sched/deadline.c: At top level:
>> kernel/sched/deadline.c:210:6: warning: no previous prototype for 'dl_bw_visited' [-Wmissing-prototypes]
     210 | bool dl_bw_visited(int cpu, u64 cookie)
         |      ^~~~~~~~~~~~~


vim +/dl_bw_visited +210 kernel/sched/deadline.c

   209	
 > 210	bool dl_bw_visited(int cpu, u64 cookie)
   211	{
   212		return false;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

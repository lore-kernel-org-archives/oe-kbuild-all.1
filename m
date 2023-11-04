Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B722F14
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 21:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jos54qBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699132263; x=1730668263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ee07yKwov9ulfjDGM+bke0LergdK/Ozz8Esr1Zwgb10=;
  b=jos54qBgcaYxqT5GHYDkBjIF3TVtUIL3hk385QKRpNv0o6+7pJ7uhfSE
   ZgVpt8qH677rFtVFG2n39SCLK49ISZd6/RkHqmYC+DHgGZBPwxybGE6gU
   FPVDT/5A33cunhTbSuJHoDhf1UAZH8qMWHcwpT5fJKi9hsoOKzJfifOhE
   WM9hLdYq3tZI6qVmGkooM6jp3ou6ZL2LSJRXdoGmGXcilvER0DFefU6wv
   X3X+80w2PABLsoizdtb/FTYex/9SGTIaatwn0vYKof2MzoYBue+mfqZAx
   NhfheQAqQPGz2psTjqZ/1BykLDr+hAnc1y2JVOvZLzB3OxhJzC5vHw5Uk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="10645497"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="10645497"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 14:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="755485864"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="755485864"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Nov 2023 14:11:00 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzNv0-0004gp-00;
	Sat, 04 Nov 2023 21:10:58 +0000
Date: Sun, 5 Nov 2023 05:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 1/1] kernel/sched/sched.h:2518:15: warning: extra
 tokens at end of #ifdef directive
Message-ID: <202311050539.nyjJOelf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   f0d1b5037d24ee5b94bb79b790597ecf6897c447
commit: f0d1b5037d24ee5b94bb79b790597ecf6897c447 [1/1] ZEN: INTERACTIVE: eevdf: Rebalance more often, but less tasks at once
config: csky-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20231105/202311050539.nyjJOelf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050539.nyjJOelf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050539.nyjJOelf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:34:
>> kernel/sched/sched.h:2518:15: warning: extra tokens at end of #ifdef directive
    2518 | #ifdef defined(CONFIG_PREEMPT_RT) || defined(CONFIG_ZEN_INTERACTIVE)
         |               ^


vim +2518 kernel/sched/sched.h

  2517	
> 2518	#ifdef defined(CONFIG_PREEMPT_RT) || defined(CONFIG_ZEN_INTERACTIVE)
  2519	#define SCHED_NR_MIGRATE_BREAK 8
  2520	#else
  2521	#define SCHED_NR_MIGRATE_BREAK 32
  2522	#endif
  2523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302461846
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 05:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693459100; x=1724995100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tyaBZ69SYaAnsRpvkXZhHh8p9FdcVoqUUmaJYLqpzdk=;
  b=iPqSyZGaC01WSb62vTZxDDjx09PTNqk18fJEQYjbHggsDnXl9P+OSIDW
   w1awNISMcqGJIpeSAREsF7eeMJvVqfHgl8ZPxKd4586TLp3f5/RS+w4k/
   LcP1UgTyYjER/am/NS9+QdHVJy236luPdj8mN6nSatL5BTbwpuG4eZTb1
   730RjdkkhkQVjO1VauRrdFbZ20j/6zsn4hwSXrnsboRY2N5fV01vU6pMG
   2mzlC/V8q5aiEu3okRMKWi7xqDEY++cGwbFR06ktJnkf4aSpe+R26BPkx
   LXvyLcPrT2NbuDNmVxLvQkZRIyY5tgeSm4JgE63WMv22vFg+7YaHeiH7L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379565650"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="379565650"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768664272"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="768664272"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 22:18:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qba4Q-000Ae7-07;
	Thu, 31 Aug 2023 05:18:18 +0000
Date: Thu, 31 Aug 2023 13:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 15/15] kernel/sched/core.c:4976:6:
 warning: no previous declaration for '__balance_callbacks'
Message-ID: <202308311332.pjrxmlxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   587d5d6afd93c277408eeee695917e92a67e07b1
commit: 51ba045c81b3d00225cfe6866e5fd18a1faddf30 [15/15] ANDROID: GKI: vendor code needs __balance_callbacks access
config: x86_64-randconfig-r032-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311332.pjrxmlxb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311332.pjrxmlxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311332.pjrxmlxb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:4976:6: warning: no previous declaration for '__balance_callbacks' [-Wmissing-declarations]
    void __balance_callbacks(struct rq *rq)
         ^~~~~~~~~~~~~~~~~~~


vim +/__balance_callbacks +4976 kernel/sched/core.c

  4975	
> 4976	void __balance_callbacks(struct rq *rq)
  4977	{
  4978		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4979	}
  4980	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

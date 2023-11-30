Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFA2232D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HraWBnwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701342052; x=1732878052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dYfCqrFSDLR+yuhyAo2wSGLbuFZ4STbjW56C5th4bM=;
  b=HraWBnwdkZxbmwCN3td0WbwhWrpptTkBjfWHGu5wvKWsKxE+LsTCLeeL
   TkOvIPSLklJR+m4SOPWPpuoBPS+egzsS4yd4XOoJ/Xq1XNvYulsKnzC8x
   Vhzr80nrSmmmd3Tbz64hztFWYc2CZ24BfDvB7p6DBixsR2Ka/fleZVaQR
   5p2EX/2NE8f/aVR+V+67Q4NYe0ziW0v0D2U8AapFRsrWFfvjmbJITy0xE
   Gkdtm9gSgpufZpB78/Lvcv5LMT8FQzSufSNIY3qUMFqNsemDjY1ALe+Bk
   FnIjYp5x7IM0gfYDuppYTi7gKDEbcr4DAKpdSCC3iNH4PcGvxfMRhDwOq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378334929"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="378334929"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769255631"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="769255631"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 03:00:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8emm-0001jS-1X;
	Thu, 30 Nov 2023 11:00:48 +0000
Date: Thu, 30 Nov 2023 19:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 2/5] kernel/rcu/tree_nocb.h:1786:13:
 warning: '__call_rcu_nocb_wake' defined but not used
Message-ID: <202311301819.0N4dP0Yv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   747bcee76f689e850284b297c4174b9303445d1a
commit: cae6d648e4b784e345810ceb21dfdb9f9b5e7841 [2/5] rcu/nocb: Re-arrange call_rcu() NOCB specific code
config: arc-defconfig (https://download.01.org/0day-ci/archive/20231130/202311301819.0N4dP0Yv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301819.0N4dP0Yv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301819.0N4dP0Yv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:69:
   kernel/rcu/tree.h:470:13: warning: 'call_rcu_nocb' used but never defined
     470 | static void call_rcu_nocb(struct rcu_data *rdp, struct rcu_head *head,
         |             ^~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5136:
>> kernel/rcu/tree_nocb.h:1786:13: warning: '__call_rcu_nocb_wake' defined but not used [-Wunused-function]
    1786 | static void __call_rcu_nocb_wake(struct rcu_data *rdp, bool was_empty,
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_nocb.h:1780:13: warning: 'rcu_nocb_try_bypass' defined but not used [-Wunused-function]
    1780 | static bool rcu_nocb_try_bypass(struct rcu_data *rdp, struct rcu_head *rhp,
         |             ^~~~~~~~~~~~~~~~~~~


vim +/__call_rcu_nocb_wake +1786 kernel/rcu/tree_nocb.h

dfcb27540213e8 Frederic Weisbecker 2021-05-19  1785  
dfcb27540213e8 Frederic Weisbecker 2021-05-19 @1786  static void __call_rcu_nocb_wake(struct rcu_data *rdp, bool was_empty,
dfcb27540213e8 Frederic Weisbecker 2021-05-19  1787  				 unsigned long flags)
dfcb27540213e8 Frederic Weisbecker 2021-05-19  1788  {
dfcb27540213e8 Frederic Weisbecker 2021-05-19  1789  	WARN_ON_ONCE(1);  /* Should be dead code! */
dfcb27540213e8 Frederic Weisbecker 2021-05-19  1790  }
dfcb27540213e8 Frederic Weisbecker 2021-05-19  1791  

:::::: The code at line 1786 was first introduced by commit
:::::: dfcb27540213e8061ecffacd4bd8ed54a310a7b0 rcu/nocb: Start moving nocb code to its own plugin file

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

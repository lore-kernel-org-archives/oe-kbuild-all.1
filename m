Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E702AB42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 23:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687303739; x=1718839739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wttBpuOwlxRPcb5wFbgHeHgW6I/h5HsYfmKvTvfaf3U=;
  b=YwRQQc2b6bTYFaEMgSMl85zcuf8M3dgFQJeb6tJtO1D7Ys36QhTshm51
   Rl2K2gvVeK562RbYxBIEmRBAXZsry79a97M47PfdHq5cDVsDJREyOav76
   hhY5z6V1ZFBx7W2c5200pKTkRcmynDEkxNOUptQa4Y0K2ZRzZPppLa/HA
   2apUY91NFxow8Yt8lVZY/AyEJk7/asvF97OtRFQgf+mRBL9NpDQEEHwoa
   3oM04Y4kReDLbyBGAHD54DA9IqBlcHgni+J4v5EJkRcB9qK7So9ilOhw4
   inE0eTpnU8+Xgj++NqYmInI7ge1ah4pWe68aixbS1dtYSyJQPBZy418LB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="358881210"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="358881210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 16:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858758598"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="858758598"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 16:28:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBkmA-0006Ki-1a;
	Tue, 20 Jun 2023 23:28:42 +0000
Date: Wed, 21 Jun 2023 07:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7728/11071] kernel/rcu/rcuscale.c:301:27: error:
 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did you mean
 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <202306210727.vqY7wkdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9dbf40840551df336c95ce2a3adbdd25ed53c0ef
commit: df8fa2f1fc4c20cd300855a11b31ba5565f45ac6 [7728/11071] rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time
config: microblaze-randconfig-r003-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210727.vqY7wkdG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210727.vqY7wkdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210727.vqY7wkdG-lkp@intel.com/

Note: the linux-next/master HEAD 9dbf40840551df336c95ce2a3adbdd25ed53c0ef builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> kernel/rcu/rcuscale.c:301:27: error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did you mean 'get_rcu_tasks_trace_gp_kthread'?
     301 |         .rso_gp_kthread = get_rcu_tasks_gp_kthread,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           get_rcu_tasks_trace_gp_kthread


vim +301 kernel/rcu/rcuscale.c

   289	
   290	static struct rcu_scale_ops tasks_ops = {
   291		.ptype		= RCU_TASKS_FLAVOR,
   292		.init		= rcu_sync_scale_init,
   293		.readlock	= tasks_scale_read_lock,
   294		.readunlock	= tasks_scale_read_unlock,
   295		.get_gp_seq	= rcu_no_completed,
   296		.gp_diff	= rcu_seq_diff,
   297		.async		= call_rcu_tasks,
   298		.gp_barrier	= rcu_barrier_tasks,
   299		.sync		= synchronize_rcu_tasks,
   300		.exp_sync	= synchronize_rcu_tasks,
 > 301		.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
   302		.name		= "tasks"
   303	};
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

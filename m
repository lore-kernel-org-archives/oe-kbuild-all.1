Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C7DDAE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685895601; x=1717431601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BBhFna9N6SI67wRhAaQCEUOY6tkNF74Lpve3DiNUSGc=;
  b=Ni8TXUbJNJYsKBT35cwxm0J3uJO8IAoDWzyx0Ro/f+BLE8pVmOZXy+JL
   xerpjrEQocbST5oH5/baU25Aps6x4GX2QB72XDRHX06/+5wGVbkAG/Wjq
   laLD9k07Rc+UzQ3E22iv9aHcMo0huKxsKv/GGqMuN5L7G+EmSEVoV5tsa
   vKZcSUPhJtsiYdxGw0V6UEU5ZYWTX7JeF22Hu1dVWbaXrFV/SWAZH4Euh
   lxFCf6wxtlCO9OHzGCeLWzWKFI2N/p8TXvNK/SLy9WD1qNdMPdNijJfKF
   EChQIXLHlVGCGtsGXc/EAa67TYrtjIusGz2YuqgTpdwCqTSE1hNNmaci1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="340839227"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="340839227"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 09:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="778281167"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="778281167"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2023 09:19:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5qSU-00036y-2j;
	Sun, 04 Jun 2023 16:19:58 +0000
Date: Mon, 5 Jun 2023 00:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wtarreau-nolibc:20230604-nolibc-rv32+stkp6 78/118]
 kernel/rcu/rcuscale.c:301:27: error: 'get_rcu_tasks_gp_kthread' undeclared
 here (not in a function); did you mean 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <202306050015.yUbTQz2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git 20230604-nolibc-rv32+stkp6
head:   a76324560e0f8f916d89452dd6aec1104e97a3c6
commit: 9486af7280fda4a0b8347a1abcdcaba70a67d89b [78/118] rcuscale: Measure RCU Tasks grace-period kthread CPU time
config: arm-randconfig-r046-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050015.yUbTQz2Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git/commit/?id=9486af7280fda4a0b8347a1abcdcaba70a67d89b
        git remote add wtarreau-nolibc https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
        git fetch --no-tags wtarreau-nolibc 20230604-nolibc-rv32+stkp6
        git checkout 9486af7280fda4a0b8347a1abcdcaba70a67d89b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050015.yUbTQz2Q-lkp@intel.com/

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

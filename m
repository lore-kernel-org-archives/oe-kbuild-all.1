Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3891101CF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685894939; x=1717430939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgY6UrERPZ7xyP/LlX3Tan4Yzb+BuTI+gUNBcndKHJc=;
  b=EuO+twFJCcNZy0Z8lHwZRJoRJtwr3rll+nhadEEKHjaJ0wAaX7GebWSm
   1nbysgKNicZYpTvV2SciL7mcEAbs/ex9bHQvrwelWHvrW+VUzMhR2M1td
   DG9EKXdWGDfvp8EA1CtLnUndyTM7MMXVzKSwyNRJXGyH6uyj/BH4+yl+I
   OngPNJsxpjrdQ0zgXV03dsV/1rL5O+JURyajf9BPbVtMgiLahyA6h02t6
   FdLQqJ8E1QvRNBSu983NIJIrGHfv6cgd4crL5XUBGqd16L4yl++Fj9i5O
   k2Ne3UWRAW3JDFmuIUosp3v+ryHLBMWxprc+PfuU6QJb1APKeNEWqCmYy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="335820143"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="335820143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 09:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="832549442"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="832549442"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2023 09:08:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5qHp-00035L-0L;
	Sun, 04 Jun 2023 16:08:57 +0000
Date: Mon, 5 Jun 2023 00:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wtarreau-nolibc:20230604-nolibc-rv32+stkp6 78/118]
 kernel/rcu/tasks.h:1932:16: error: 'rcu_tasks' undeclared
Message-ID: <202306050057.V9tNcx07-lkp@intel.com>
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
config: i386-buildonly-randconfig-r002-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050057.V9tNcx07-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git/commit/?id=9486af7280fda4a0b8347a1abcdcaba70a67d89b
        git remote add wtarreau-nolibc https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
        git fetch --no-tags wtarreau-nolibc 20230604-nolibc-rv32+stkp6
        git checkout 9486af7280fda4a0b8347a1abcdcaba70a67d89b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050057.V9tNcx07-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:649:
>> kernel/rcu/tasks.h:1930:21: warning: no previous prototype for 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
    1930 | struct task_struct *get_rcu_tasks_gp_kthread(void)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tasks.h: In function 'get_rcu_tasks_gp_kthread':
>> kernel/rcu/tasks.h:1932:16: error: 'rcu_tasks' undeclared (first use in this function)
    1932 |         return rcu_tasks.kthread_ptr;
         |                ^~~~~~~~~
   kernel/rcu/tasks.h:1932:16: note: each undeclared identifier is reported only once for each function it appears in
   kernel/rcu/tasks.h:1933:1: error: control reaches end of non-void function [-Werror=return-type]
    1933 | }
         | ^
   cc1: some warnings being treated as errors


vim +/rcu_tasks +1932 kernel/rcu/tasks.h

  1929	
> 1930	struct task_struct *get_rcu_tasks_gp_kthread(void)
  1931	{
> 1932		return rcu_tasks.kthread_ptr;
  1933	}
  1934	EXPORT_SYMBOL_GPL(get_rcu_tasks_gp_kthread);
  1935	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

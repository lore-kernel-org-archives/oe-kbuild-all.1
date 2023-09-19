Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A15237
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695139635; x=1726675635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJMY6XRbDrQqxIjMyOMgR8h12zqwSbPL+Ba9SZWNEQk=;
  b=J/DwY2hUm33cLcirYvtNoS9tv0UHku2wG3zyNRQ2ikcuQ8gT2omtOzct
   VzHCUoV7RGir6UXMKxHrIUlhe2vhIcXYkIXK0jtJNzpTmuMkUGPcWA9sm
   QGD5yduYQlccf5Yt8EcrINWTzUOgjJH/cab7X4q3u/OY3pFnXpW0vMwdW
   m45Ridx+McibEpFJ8VQN7V8qeBGL0xM0Dpq8t8P3ynC/4g3itPvr3V6tQ
   DJ08+Vex34gBCsxyAeCw5FnspZETVzLTFwkIoFsKOXYMDySjmzKUe1nIi
   2lrCPkoodHI1qn77KKMJGaRr79TfMFPAyEh9ZbYEfXMUPu1VpbGegdKP5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444069028"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="444069028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 09:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695963084"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="695963084"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Sep 2023 09:02:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qidBb-0007bc-39;
	Tue, 19 Sep 2023 16:02:51 +0000
Date: Wed, 20 Sep 2023 00:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 22/41] arch/x86/kernel/cpu/debugfs.c:53:35:
 warning: 'sprintf' may write a terminating nul past the end of the
 destination
Message-ID: <202309192324.p3ySFahn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   68e2a6fab985dc1ed5e9e7e2b0a8998ef2951772
commit: b8f285eb46639df7f680c92122aa65302f32e2cd [22/41] x86/cpu: Provide debug interface
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309192324.p3ySFahn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192324.p3ySFahn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192324.p3ySFahn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/debugfs.c: In function 'cpu_init_debugfs':
>> arch/x86/kernel/cpu/debugfs.c:53:35: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
      53 |                 sprintf(name, "%lu", id);
         |                                   ^
   arch/x86/kernel/cpu/debugfs.c:53:17: note: 'sprintf' output between 2 and 11 bytes into a destination of size 10
      53 |                 sprintf(name, "%lu", id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +53 arch/x86/kernel/cpu/debugfs.c

    44	
    45	static __init int cpu_init_debugfs(void)
    46	{
    47		struct dentry *dir, *base = debugfs_create_dir("topo", arch_debugfs_dir);
    48		unsigned long id;
    49		char name[10];
    50	
    51		dir = debugfs_create_dir("cpus", base);
    52		for_each_possible_cpu(id) {
  > 53			sprintf(name, "%lu", id);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

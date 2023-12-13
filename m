Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A215199A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEJXEh4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702453679; x=1733989679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OS/fg6fRG5visVHYSpRkggJ1Ho+9OGr9m1AWKQdOrg=;
  b=GEJXEh4DIDsb1ZOU99b5SDsNh1TjzO0kLckWDtVemvS31Y8i/2Y3B7GK
   E2gM5eKIrT5wF8E04hC3rHTV2a8RL2/y/MqROPMoqkjNuTYJsmi0TutAU
   MPTwwx+e3MQKrQgjJR5UiNvAo14zRz7t0uWffb197V/HKgj3DLKuqeqvG
   x9oa69Le0oJr3zaA5GusW1RW/S1frIjPkbJWWuqw30SdNMcIiZnOO2SbH
   a5p2p3vFlvSE5ZAYv0niSokrj6VKQ5vZolOTHGEVKONtIO+RoFTryUgW9
   e1MsGBus8aERWfpsqZ20rmYqbtK27KuJm6GqndFmLViuiwIawBvNbhwiP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398767975"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="398767975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 23:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1021022386"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1021022386"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2023 23:47:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDJy4-000KEB-1l;
	Wed, 13 Dec 2023 07:47:44 +0000
Date: Wed, 13 Dec 2023 15:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 6674/7300] drivers/perf/riscv_pmu_sbi.c:1015:35:
 error: initialization of 'int (*)(struct ctl_table *, int,  void *, size_t
 *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, long unsigned
 int *, long long int *)'} from incompatible pointer type 'int (*)(...
Message-ID: <202312131509.n6cZrTLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 0bd6bc435f7db3e22acb410b721e97a97463c51c [6674/7300] drivers: perf: Fix build error by adding const to ctl_table argument of handler
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231213/202312131509.n6cZrTLi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131509.n6cZrTLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131509.n6cZrTLi-lkp@intel.com/

Note: the linux-next/master HEAD 48e8992e33abf054bcc0bb2e77b2d43bb899212e builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/perf/riscv_pmu_sbi.c: In function 'riscv_pmu_proc_user_access_handler':
   drivers/perf/riscv_pmu_sbi.c:994:40: warning: passing argument 1 of 'proc_dointvec_minmax' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     994 |         int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
         |                                        ^~~~~
   In file included from include/linux/key.h:17,
                    from include/linux/cred.h:13,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/perf_event.h:49,
                    from include/linux/perf/riscv_pmu.h:12,
                    from drivers/perf/riscv_pmu_sbi.c:14:
   include/linux/sysctl.h:72:26: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
      72 | int proc_dointvec_minmax(struct ctl_table *, int, void *, size_t *, loff_t *);
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c: At top level:
>> drivers/perf/riscv_pmu_sbi.c:1015:35: error: initialization of 'int (*)(struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} from incompatible pointer type 'int (*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} [-Werror=incompatible-pointer-types]
    1015 |                 .proc_handler   = riscv_pmu_proc_user_access_handler,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:1015:35: note: (near initialization for 'sbi_pmu_sysctl_table[0].proc_handler')
   cc1: some warnings being treated as errors


vim +1015 drivers/perf/riscv_pmu_sbi.c

cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1008  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1009  static struct ctl_table sbi_pmu_sysctl_table[] = {
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1010  	{
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1011  		.procname       = "perf_user_access",
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1012  		.data		= &sysctl_perf_user_access,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1013  		.maxlen		= sizeof(unsigned int),
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1014  		.mode           = 0644,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02 @1015  		.proc_handler	= riscv_pmu_proc_user_access_handler,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1016  		.extra1		= SYSCTL_ZERO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1017  		.extra2		= SYSCTL_TWO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1018  	},
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1019  	{ }
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1020  };
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1021  

:::::: The code at line 1015 was first introduced by commit
:::::: cc4c07c89aada16229084eeb93895c95b7eabaa3 drivers: perf: Implement perf event mmap support in the SBI backend

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

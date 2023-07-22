Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18477F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 23:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690067447; x=1721603447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7UnGI/BAsOYAb9A3+RcQ3a1egYLqTuzzuBz6LwUUACA=;
  b=lEHaPiblzXK4M8I5qmQWK+qisQCNmekeknECCXiy+LtBHikMwIy9mxh8
   JUc/s6F7eojDmY3Xfh4zRVGAb3EfBBQrDeyg1a7vXaeEpuxIWOKVh+nhc
   aK3trPHwf3EtTgQgOhB2/dTOjY2IYzkdR/8OqTAnZJ2DIJTXRjoDIU24M
   VPHWOP0x07a59SwDBCRayvdpzlGBOECitq+uS9K9i9GaFNA47K6Uwd0gd
   6Gj9l/MWsUN3vIofvN/HdRlusEQBJmtQAnOjZZIQcghFujKwz5iCW9KXS
   xuxIUZayjk88S15BQsJ0fIDYTMGLXGMkrg3YGPHLq8zAuzF3YffgS4WNQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="369905169"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="369905169"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 16:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868631650"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2023 16:10:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNLkL-0008fd-0L;
	Sat, 22 Jul 2023 23:10:45 +0000
Date: Sun, 23 Jul 2023 07:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] drivers/md/dm-stats.c:91:32: sparse:
 sparse: incompatible types in comparison expression (different type sizes):
Message-ID: <202307230723.oI8kN7T7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext-current
head:   49e3458967802a6981190b5a1fa9fd66dbf58f8c
commit: 631e7c45f5d4cf043cd236a921c341e3dd9f1909 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r083-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230723.oI8kN7T7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230723.oI8kN7T7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230723.oI8kN7T7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-stats.c:91:32: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/md/dm-stats.c:91:32: sparse:    unsigned int *
>> drivers/md/dm-stats.c:91:32: sparse:    unsigned long *
--
>> drivers/md/dm-bufio.c:2842:19: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/md/dm-bufio.c:2842:19: sparse:    unsigned int *
>> drivers/md/dm-bufio.c:2842:19: sparse:    unsigned long *
>> drivers/md/dm-bufio.c:2842:19: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/md/dm-bufio.c:2842:19: sparse:    unsigned int *
>> drivers/md/dm-bufio.c:2842:19: sparse:    unsigned long *
>> drivers/md/dm-bufio.c:2842:19: sparse: sparse: incompatible types for operation (/):
>> drivers/md/dm-bufio.c:2842:19: sparse:    bad type x_
>> drivers/md/dm-bufio.c:2842:19: sparse:    int d_
   drivers/md/dm-bufio.c:2842:19: sparse: sparse: incompatible types for operation (%):
>> drivers/md/dm-bufio.c:2842:19: sparse:    bad type x_
>> drivers/md/dm-bufio.c:2842:19: sparse:    int d_
   drivers/md/dm-bufio.c:2842:19: sparse: sparse: incompatible types for operation (*):
>> drivers/md/dm-bufio.c:2842:19: sparse:    bad type q
>> drivers/md/dm-bufio.c:2842:19: sparse:    int n_
   drivers/md/dm-bufio.c:2842:19: sparse: sparse: incompatible types for operation (*):
>> drivers/md/dm-bufio.c:2842:19: sparse:    bad type r
>> drivers/md/dm-bufio.c:2842:19: sparse:    int n_
   drivers/md/dm-bufio.c:2842:17: sparse: sparse: incompatible types for operation (>):
>> drivers/md/dm-bufio.c:2842:17: sparse:    unsigned long long [assigned] [usertype] mem
>> drivers/md/dm-bufio.c:2842:17: sparse:    void
   drivers/md/dm-bufio.c:2843:23: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/md/dm-bufio.c:2843:23: sparse:    unsigned int *
   drivers/md/dm-bufio.c:2843:23: sparse:    unsigned long *
   drivers/md/dm-bufio.c:2843:23: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/md/dm-bufio.c:2843:23: sparse:    unsigned int *
   drivers/md/dm-bufio.c:2843:23: sparse:    unsigned long *
   drivers/md/dm-bufio.c:2843:23: sparse: sparse: incompatible types for operation (/):
   drivers/md/dm-bufio.c:2843:23: sparse:    bad type x_
   drivers/md/dm-bufio.c:2843:23: sparse:    int d_
   drivers/md/dm-bufio.c:2843:23: sparse: sparse: incompatible types for operation (%):
   drivers/md/dm-bufio.c:2843:23: sparse:    bad type x_
   drivers/md/dm-bufio.c:2843:23: sparse:    int d_
   drivers/md/dm-bufio.c:2843:23: sparse: sparse: incompatible types for operation (*):
   drivers/md/dm-bufio.c:2843:23: sparse:    bad type q
   drivers/md/dm-bufio.c:2843:23: sparse:    int n_
   drivers/md/dm-bufio.c:2843:23: sparse: sparse: incompatible types for operation (*):
   drivers/md/dm-bufio.c:2843:23: sparse:    bad type r
   drivers/md/dm-bufio.c:2843:23: sparse:    int n_

vim +91 drivers/md/dm-stats.c

fd2ed4d252701d Mikulas Patocka 2013-08-16  80  
fd2ed4d252701d Mikulas Patocka 2013-08-16  81  static bool __check_shared_memory(size_t alloc_size)
fd2ed4d252701d Mikulas Patocka 2013-08-16  82  {
fd2ed4d252701d Mikulas Patocka 2013-08-16  83  	size_t a;
fd2ed4d252701d Mikulas Patocka 2013-08-16  84  
fd2ed4d252701d Mikulas Patocka 2013-08-16  85  	a = shared_memory_amount + alloc_size;
fd2ed4d252701d Mikulas Patocka 2013-08-16  86  	if (a < shared_memory_amount)
fd2ed4d252701d Mikulas Patocka 2013-08-16  87  		return false;
ca79b0c211af63 Arun KS         2018-12-28  88  	if (a >> PAGE_SHIFT > totalram_pages() / DM_STATS_MEMORY_FACTOR)
fd2ed4d252701d Mikulas Patocka 2013-08-16  89  		return false;
fd2ed4d252701d Mikulas Patocka 2013-08-16  90  #ifdef CONFIG_MMU
fd2ed4d252701d Mikulas Patocka 2013-08-16 @91  	if (a > (VMALLOC_END - VMALLOC_START) / DM_STATS_VMALLOC_FACTOR)
fd2ed4d252701d Mikulas Patocka 2013-08-16  92  		return false;
fd2ed4d252701d Mikulas Patocka 2013-08-16  93  #endif
fd2ed4d252701d Mikulas Patocka 2013-08-16  94  	return true;
fd2ed4d252701d Mikulas Patocka 2013-08-16  95  }
fd2ed4d252701d Mikulas Patocka 2013-08-16  96  

:::::: The code at line 91 was first introduced by commit
:::::: fd2ed4d252701d3bbed4cd3e3d267ad469bb832a dm: add statistics support

:::::: TO: Mikulas Patocka <mpatocka@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

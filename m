Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C97E139B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 03:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692674794; x=1724210794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eqCyfxz2NSbhhf4pP4lTWx64NCMbVQfXvxN90frx8s8=;
  b=HqOeJvjJU+ZoP/kSydPAL793CSUQVZ5LMkj1X7NS0dWK+fUkrPehL3H8
   gp0sj2B5rpZm2fSBuBksK2muX3qepWkyRRecLTPt4VKqJmsmYKsgjV68O
   myD5Zc1saxQiewEigvvUaPbTnbNt4EggmyqotM5zTYDWeGzJddnfkluIw
   dzkq9IXOgeVqBY4NarZq+zzH9OSQXg0HTMo69B2jSt4Zj0nW+OeNzracT
   qBDicd1JC05D0ijVTRI86lN5yqP/SZDKdER0GcIGCZkDE3jSwciTJpGHL
   BwNO75j+45LwZqx5gOVmVLcugBUdQuNGZN3bJtWXqXtfwzG+y4p7gk214
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373736798"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="373736798"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 20:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739146945"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="739146945"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 20:26:17 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYI1c-0001II-1o;
	Tue, 22 Aug 2023 03:25:53 +0000
Date: Tue, 22 Aug 2023 11:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 11118/11453]
 arch/powerpc/platforms/pseries/lpar.c:2024:36: error: '%ld' directive
 writing between 1 and 20 bytes into a region of size 12
Message-ID: <202308221126.HCcSBbdQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 6d4ab2e97dcfbcd748ae71761a9d8e5e41cc732c [11118/11453] extrawarn: enable format and stringop overflow warnings in W=1
config: powerpc64-defconfig (https://download.01.org/0day-ci/archive/20230822/202308221126.HCcSBbdQ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221126.HCcSBbdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221126.HCcSBbdQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/lpar.c: In function '__machine_initcall_pseries_vpa_debugfs_init':
>> arch/powerpc/platforms/pseries/lpar.c:2024:36: error: '%ld' directive writing between 1 and 20 bytes into a region of size 12 [-Werror=format-overflow=]
    2024 |                 sprintf(name, "cpu-%ld", i);
         |                                    ^~~
   In function 'vpa_debugfs_init',
       inlined from '__machine_initcall_pseries_vpa_debugfs_init' at arch/powerpc/platforms/pseries/lpar.c:2030:1:
   arch/powerpc/platforms/pseries/lpar.c:2024:31: note: directive argument in the range [-9223372036854775808, 4294967294]
    2024 |                 sprintf(name, "cpu-%ld", i);
         |                               ^~~~~~~~~
   arch/powerpc/platforms/pseries/lpar.c:2024:17: note: 'sprintf' output between 6 and 25 bytes into a destination of size 16
    2024 |                 sprintf(name, "cpu-%ld", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/powerpc/platforms/cell/iommu.c: In function 'cell_iommu_alloc':
>> arch/powerpc/platforms/cell/iommu.c:654:58: error: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
     654 |         snprintf(iommu->name, sizeof(iommu->name), "iommu%d", i);
         |                                                          ^~
   arch/powerpc/platforms/cell/iommu.c:654:52: note: directive argument in the range [-2147483648, 1]
     654 |         snprintf(iommu->name, sizeof(iommu->name), "iommu%d", i);
         |                                                    ^~~~~~~~~
   arch/powerpc/platforms/cell/iommu.c:654:9: note: 'snprintf' output between 7 and 17 bytes into a destination of size 8
     654 |         snprintf(iommu->name, sizeof(iommu->name), "iommu%d", i);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/powerpc/platforms/ps3/setup.c: In function 'ps3_setup_arch':
>> arch/powerpc/platforms/ps3/setup.c:229:24: error: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 4 and 12 [-Werror=format-truncation=]
     229 |                 "%u.%u.%u", ps3_firmware_version.major,
         |                        ^~
   arch/powerpc/platforms/ps3/setup.c:229:17: note: directive argument in the range [0, 65535]
     229 |                 "%u.%u.%u", ps3_firmware_version.major,
         |                 ^~~~~~~~~~
   arch/powerpc/platforms/ps3/setup.c:228:9: note: 'snprintf' output between 6 and 18 bytes into a destination of size 16
     228 |         snprintf(ps3_firmware_version_str, sizeof(ps3_firmware_version_str),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     229 |                 "%u.%u.%u", ps3_firmware_version.major,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     230 |                 ps3_firmware_version.minor, ps3_firmware_version.rev);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/powerpc/sysdev/xive/common.c: In function 'xive_core_debugfs_create':
>> arch/powerpc/sysdev/xive/common.c:1845:50: error: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Werror=format-truncation=]
    1845 |                 snprintf(name, sizeof(name), "cpu%ld", cpu);
         |                                                  ^~~
   arch/powerpc/sysdev/xive/common.c:1845:46: note: directive argument in the range [-9223372036854775808, 4294967294]
    1845 |                 snprintf(name, sizeof(name), "cpu%ld", cpu);
         |                                              ^~~~~~~~
   arch/powerpc/sysdev/xive/common.c:1845:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
    1845 |                 snprintf(name, sizeof(name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +2024 arch/powerpc/platforms/pseries/lpar.c

c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2010  
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2011  static int __init vpa_debugfs_init(void)
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2012  {
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2013  	char name[16];
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2014  	long i;
11dd34f3eae5a4 YueHaibing       2019-02-18  2015  	struct dentry *vpa_dir;
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2016  
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2017  	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2018  		return 0;
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2019  
dbf77fed8b302e Aneesh Kumar K.V 2021-08-12  2020  	vpa_dir = debugfs_create_dir("vpa", arch_debugfs_dir);
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2021  
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2022  	/* set up the per-cpu vpa file*/
c6c26fb55e8e4b Aravinda Prasad  2018-10-16  2023  	for_each_possible_cpu(i) {
c6c26fb55e8e4b Aravinda Prasad  2018-10-16 @2024  		sprintf(name, "cpu-%ld", i);

:::::: The code at line 2024 was first introduced by commit
:::::: c6c26fb55e8e4b3fc376be5611685990a17de27a powerpc/pseries: Export raw per-CPU VPA data via debugfs

:::::: TO: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

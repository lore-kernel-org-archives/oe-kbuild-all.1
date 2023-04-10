Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347F63C04
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681143359; x=1712679359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/A2Vg6dnhGabBtSmfLtAxg9qMdduwygDAFAzO+LflAM=;
  b=DOnK+pQnrb03hBc8QJQMQVWcgyIwpgjs+RDCuBlRLKdzbeCtSECG353o
   Xw+/+0qLEyG5L6bSa9uKKId4z9h90CaMiuFHD2w0oYxNzaG+asrtrsJLI
   +Q2VwM6GEMyTdnS/MI7KFNL966RiAZmFloxaN1FjNpTlmWud8r+z3jX7Z
   sj0TiD8QkZ6NFkTp+H2xMRiSJCZO5VqtXqpXw1azXD40FZmynj9OK5n8s
   tGJ/rGmSu2WRe1K+R8rcUtAZiAaqJcSxtoGxcgPI81K1MvaJRzN+zQlLo
   LfNPDn8BulIPEhl0eW2y5axo4hpvXPQ1Vu7gnxgHCCArPJkBSMw4mYxr6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323025258"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="323025258"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 09:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018026269"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="1018026269"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2023 09:15:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pluAy-000VTp-2p;
	Mon, 10 Apr 2023 16:15:28 +0000
Date: Tue, 11 Apr 2023 00:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:t602x/bringup 114/125]
 drivers/iommu/io-pgtable-dart.c:531:21: warning: variable 'ptep' set but not
 used
Message-ID: <202304110033.xO3FumNZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux t602x/bringup
head:   595f97705c505e843b8e264e9daa5710474237dc
commit: 1fd505339e7b4e6e5b6019c98f4978c459a3d5a9 [114/125] iommu: io-pgtable: Add 4-level page table support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230411/202304110033.xO3FumNZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/1fd505339e7b4e6e5b6019c98f4978c459a3d5a9
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux t602x/bringup
        git checkout 1fd505339e7b4e6e5b6019c98f4978c459a3d5a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110033.xO3FumNZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from drivers/iommu/io-pgtable-dart.c:16:
   drivers/iommu/io-pgtable-dart.c: In function 'dart_install_table':
   include/linux/atomic/atomic-arch-fallback.h:60:32: error: implicit declaration of function 'arch_cmpxchg64'; did you mean 'arch_cmpxchg'? [-Werror=implicit-function-declaration]
      60 | #define arch_cmpxchg64_relaxed arch_cmpxchg64
         |                                ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1968:9: note: in expansion of macro 'arch_cmpxchg64_relaxed'
    1968 |         arch_cmpxchg64_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-dart.c:173:15: note: in expansion of macro 'cmpxchg64_relaxed'
     173 |         old = cmpxchg64_relaxed(ptep, curr, new);
         |               ^~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-dart.c: In function 'apple_dart_free_pgtable':
>> drivers/iommu/io-pgtable-dart.c:531:21: warning: variable 'ptep' set but not used [-Wunused-but-set-variable]
     531 |         dart_iopte *ptep;
         |                     ^~~~
   cc1: some warnings being treated as errors


vim +/ptep +531 drivers/iommu/io-pgtable-dart.c

   526	
   527	static void apple_dart_free_pgtable(struct io_pgtable *iop)
   528	{
   529		struct io_pgtable_cfg *cfg = &iop->cfg;
   530		struct dart_io_pgtable *data = io_pgtable_to_data(iop);
 > 531		dart_iopte *ptep;
   532		int i;
   533	
   534	        if (cfg->quirks & IO_PGTABLE_QUIRK_APPLE_LOCKED) {
   535			kfree(data);
   536			return;
   537		}
   538	
   539		for (i = 0; i < (1 << data->tbl_bits) && data->pgd[i]; ++i) {
   540			ptep = data->pgd[i];
   541			apple_dart_free_pgtables(data, data->pgd[i], data->levels - 1);
   542		}
   543	
   544		kfree(data);
   545	}
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
